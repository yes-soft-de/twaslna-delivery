import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:twaslna_dashboard/abstracts/states/loading_state.dart';
import 'package:twaslna_dashboard/abstracts/states/state.dart';
import 'package:twaslna_dashboard/module_filters/model/captain_filter_model.dart';
import 'package:twaslna_dashboard/module_filters/model/store_filter_model.dart';
import 'package:twaslna_dashboard/module_filters/service/filters_service.dart';
import 'package:twaslna_dashboard/module_filters/ui/screen/captain_filter_screen.dart';
import 'package:twaslna_dashboard/module_filters/ui/screen/store_filter_screen.dart';
import 'package:twaslna_dashboard/module_filters/ui/state/filter_captain/captains_filter_loaded_state.dart';
import 'package:twaslna_dashboard/module_filters/ui/state/filter_store/stores_filter_loaded_state.dart';


@injectable
class StoresFilterStateManager {
  final FiltersService _filtersService;
  final PublishSubject<States> _stateSubject = PublishSubject();

  Stream<States> get stateStream => _stateSubject.stream;

  StoresFilterStateManager(this._filtersService);

  void getStores(StoresFilterScreenState screenState,String key){
    _stateSubject.add(LoadingState(screenState));
    _filtersService.getStoreFilter(key).then((value){
      if (value.hasError){
        _stateSubject.add(StoresFilterLoadedState(screenState,null,error:value.error,));
      }
      else if (value.isEmpty) {
        _stateSubject.add(StoresFilterLoadedState(screenState,null,empty: value.isEmpty));
      }
      else {
        StoresFilterModel _model = value as StoresFilterModel;
        _stateSubject.add(StoresFilterLoadedState(screenState,_model.data));
      }
    });
  }

}

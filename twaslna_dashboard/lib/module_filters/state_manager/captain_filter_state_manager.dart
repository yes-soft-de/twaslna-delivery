import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:twaslna_dashboard/abstracts/states/loading_state.dart';
import 'package:twaslna_dashboard/abstracts/states/state.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/module_captain/model/balance_model.dart';
import 'package:twaslna_dashboard/module_captain/model/porfile_model.dart';
import 'package:twaslna_dashboard/module_captain/service/captains_service.dart';
import 'package:twaslna_dashboard/module_filters/model/captain_filter_model.dart';
import 'package:twaslna_dashboard/module_filters/service/filters_service.dart';
import 'package:twaslna_dashboard/module_filters/ui/screen/captain_filter_screen.dart';
import 'package:twaslna_dashboard/module_filters/ui/state/filter_captain/captains_filter_loaded_state.dart';
import 'package:twaslna_dashboard/module_payments/request/captain_payments_request.dart';
import 'package:twaslna_dashboard/module_payments/service/payments_service.dart';
import 'package:twaslna_dashboard/module_payments/ui/screen/paymen_from_captain_screen.dart';
import 'package:twaslna_dashboard/module_payments/ui/state/payments_from_captain/captains_payments_loaded_state.dart';
import 'package:twaslna_dashboard/utils/helpers/custom_flushbar.dart';


@injectable
class CaptainFilterStateManager {
  final FiltersService _filtersService;
  final PublishSubject<States> _stateSubject = PublishSubject();

  Stream<States> get stateStream => _stateSubject.stream;

  CaptainFilterStateManager(this._filtersService);

  void getCaptainPaymentsDetails(CaptainFilterScreenState screenState,String key){
    _stateSubject.add(LoadingState(screenState));
    _filtersService.getCaptainFilter(key).then((value){
      if (value.hasError){
        _stateSubject.add(CaptainsFilterLoadedState(screenState,null,error:value.error,));
      }
      else if (value.isEmpty) {
        _stateSubject.add(CaptainsFilterLoadedState(screenState,null,empty: value.isEmpty));
      }
      else {
        CaptainFilterModel _model = value as CaptainFilterModel;
         _stateSubject.add(CaptainsFilterLoadedState(screenState,_model.data));
      }
    });
  }

}

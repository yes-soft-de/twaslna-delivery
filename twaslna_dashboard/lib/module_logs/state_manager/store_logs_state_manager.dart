import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:twaslna_dashboard/abstracts/states/loading_state.dart';
import 'package:twaslna_dashboard/abstracts/states/state.dart';
import 'package:twaslna_dashboard/module_logs/model/captain_logs_model.dart';
import 'package:twaslna_dashboard/module_logs/service/logs_service.dart';
import 'package:twaslna_dashboard/module_logs/ui/screen/captain_logs_screen.dart';
import 'package:twaslna_dashboard/module_logs/ui/screen/store_logs_screen.dart';
import 'package:twaslna_dashboard/module_logs/ui/state/captain_logs_state/captain_logs_state.dart';
import 'package:twaslna_dashboard/module_logs/ui/state/store_logs_state/store_logs_loaded_state.dart';

@injectable
class StoreLogsStateManager {
  final LogsService _logsService;
  final PublishSubject<States> _stateSubject = PublishSubject();

  Stream<States> get stateStream => _stateSubject.stream;

  StoreLogsStateManager(this._logsService);

  void getStoreLogs(StoreLogsScreenState screenState,int captainId){
    _stateSubject.add(LoadingState(screenState));
    _logsService.getStoreLogs(captainId).then((value){
      if (value.hasError){
        _stateSubject.add(StoreLogsLoadedState(screenState,null,error: [value.error??'']));
      }
      else if (value.isEmpty) {
        _stateSubject.add(StoreLogsLoadedState(screenState,null,empty: value.isEmpty));
      }
      else {
        CaptainLogsModel _model = value as CaptainLogsModel;
        _stateSubject.add(StoreLogsLoadedState(screenState,_model));
      }
    });

  }

}
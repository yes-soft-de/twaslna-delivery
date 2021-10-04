import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:twaslna_dashboard/abstracts/states/loading_state.dart';
import 'package:twaslna_dashboard/abstracts/states/state.dart';
import 'package:twaslna_dashboard/module_logs/model/captain_logs_model.dart';
import 'package:twaslna_dashboard/module_logs/service/logs_service.dart';
import 'package:twaslna_dashboard/module_logs/ui/screen/captain_logs_screen.dart';
import 'package:twaslna_dashboard/module_logs/ui/state/captain_logs_state/captain_logs_state.dart';

@injectable
class CaptainLogsStateManager {
  final LogsService _logsService;
  final PublishSubject<States> _stateSubject = PublishSubject();

  Stream<States> get stateStream => _stateSubject.stream;

  CaptainLogsStateManager(this._logsService);

  void getCaptainLogs(CaptainLogsScreenState screenState,int captainId){
    _stateSubject.add(LoadingState(screenState));
    _logsService.getCaptainLogs(captainId).then((value){
      if (value.hasError){
        _stateSubject.add(CaptainLogsLoadedState(screenState,null,error: [value.error??'']));
      }
      else if (value.isEmpty) {
        _stateSubject.add(CaptainLogsLoadedState(screenState,null,empty: value.isEmpty));
      }
      else {
        CaptainLogsModel _model = value as CaptainLogsModel;
        _stateSubject.add(CaptainLogsLoadedState(screenState,_model));
      }
    });

  }

}
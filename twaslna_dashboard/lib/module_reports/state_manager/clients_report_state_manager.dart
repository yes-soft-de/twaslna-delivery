import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:twaslna_dashboard/abstracts/states/loading_state.dart';
import 'package:twaslna_dashboard/abstracts/states/state.dart';
import 'package:twaslna_dashboard/module_reports/model/clients_report_model.dart';
import 'package:twaslna_dashboard/module_reports/service/reports_service.dart';
import 'package:twaslna_dashboard/module_reports/ui/screen/clients_reports_screen.dart';
import 'package:twaslna_dashboard/module_reports/ui/state/client/clients_report_loaded_state.dart';


@injectable
class ClientsReportStateManager {
  final ReportsService _reportsService;
  final PublishSubject<States> _stateSubject = PublishSubject();

  Stream<States> get stateStream => _stateSubject.stream;

  ClientsReportStateManager(this._reportsService);

  void getReports(ClientsReportScreenState screenState){
    _stateSubject.add(LoadingState(screenState));
    _reportsService.getClientsReport().then((value){
      if (value.hasError){
        _stateSubject.add(ClientsReportLoadedState(screenState,null,error: value.error));
      }
      else if (value.isEmpty) {
        _stateSubject.add(ClientsReportLoadedState(screenState,null,empty: value.isEmpty));
      }
      else {
        ClientsReportModel _model = value as ClientsReportModel;
        _stateSubject.add(ClientsReportLoadedState(screenState,_model.data));
      }
    });
  }

}

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:twaslna_dashboard/abstracts/states/loading_state.dart';
import 'package:twaslna_dashboard/abstracts/states/state.dart';
import 'package:twaslna_dashboard/module_reports/model/captains_report_model.dart';
import 'package:twaslna_dashboard/module_reports/model/store_report_model.dart';
import 'package:twaslna_dashboard/module_reports/service/reports_service.dart';
import 'package:twaslna_dashboard/module_reports/ui/screen/captains_reports_screen.dart';
import 'package:twaslna_dashboard/module_reports/ui/screen/stores_reports_screen.dart';
import 'package:twaslna_dashboard/module_reports/ui/state/store/stores_report_loaded_state.dart';

@injectable
class StoresReportStateManager {
  final ReportsService _reportsService;
  final PublishSubject<States> _stateSubject = PublishSubject();

  Stream<States> get stateStream => _stateSubject.stream;

  StoresReportStateManager(this._reportsService);

  void getReports(StoresReportScreenState screenState){
    _stateSubject.add(LoadingState(screenState));
    _reportsService.getStoresReport().then((value){
      if (value.hasError){
        _stateSubject.add(StoresReportLoadedState(screenState,null,error: value.error));
      }
      else if (value.isEmpty) {
        _stateSubject.add(StoresReportLoadedState(screenState,null,empty: value.isEmpty));
      }
      else {
        StoresReportModel _model = value as StoresReportModel;
        _stateSubject.add(StoresReportLoadedState(screenState,_model.data));
      }
    });
  }

}

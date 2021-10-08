import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:twaslna_dashboard/abstracts/states/loading_state.dart';
import 'package:twaslna_dashboard/abstracts/states/state.dart';
import 'package:twaslna_dashboard/module_reports/model/captains_report_model.dart';
import 'package:twaslna_dashboard/module_reports/model/product_report_model.dart';
import 'package:twaslna_dashboard/module_reports/service/reports_service.dart';
import 'package:twaslna_dashboard/module_reports/ui/screen/captains_reports_screen.dart';
import 'package:twaslna_dashboard/module_reports/ui/screen/products_reports_screen.dart';
import 'package:twaslna_dashboard/module_reports/ui/state/product/products_report_loaded_state.dart';

@injectable
class ProductsReportStateManager {
  final ReportsService _reportsService;
  final PublishSubject<States> _stateSubject = PublishSubject();

  Stream<States> get stateStream => _stateSubject.stream;

  ProductsReportStateManager(this._reportsService);

  void getReports(ProductsReportScreenState screenState){
    _stateSubject.add(LoadingState(screenState));
    _reportsService.getProductsReport().then((value){
      if (value.hasError){
        _stateSubject.add(ProductsReportLoadedState(screenState,null,error: value.error));
      }
      else if (value.isEmpty) {
        _stateSubject.add(ProductsReportLoadedState(screenState,null,empty: value.isEmpty));
      }
      else {
        ProductsReportModel _model = value as ProductsReportModel;
        _stateSubject.add(ProductsReportLoadedState(screenState,_model.data));
      }
    });
  }

}

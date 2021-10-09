import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/module_captain/repository/captain_repository.dart';
import 'package:twaslna_dashboard/module_captain/request/accept_captain_request.dart';
import 'package:twaslna_dashboard/module_captain/response/captain_account_balance_response.dart';
import 'package:twaslna_dashboard/module_captain/response/captain_profile_response.dart';
import 'package:twaslna_dashboard/module_captain/response/captain_unfinished_pyments_response.dart';
import 'package:twaslna_dashboard/module_captain/response/in_active_captain_response.dart';
import 'package:twaslna_dashboard/module_categories/response/response.dart';
import 'package:twaslna_dashboard/module_reports/repository/reports_repository.dart';
import 'package:twaslna_dashboard/module_reports/response/reports_captain_response.dart';
import 'package:twaslna_dashboard/module_reports/response/reports_client_response.dart';
import 'package:twaslna_dashboard/module_reports/response/reports_products_response.dart';
import 'package:twaslna_dashboard/module_reports/response/reports_store_response.dart';


@injectable
class ReportsManager {

  final ReportRepository _reportRepository;

  ReportsManager(this._reportRepository);

  Future<ReportsCaptainResponse?> getCaptainsReport() => _reportRepository.getCaptainsReport();
  Future<ReportsStoreResponse?> getStoresReport() => _reportRepository.getStoresReport();
  Future<ReportsProductsResponse?> getProductsReport() => _reportRepository.getProductsReport();
  Future<ReportsClientResponse?> getClientReport() => _reportRepository.getClientsReport();

}

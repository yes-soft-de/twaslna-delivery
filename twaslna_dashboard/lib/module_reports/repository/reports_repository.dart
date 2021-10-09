import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/consts/urls.dart';
import 'package:twaslna_dashboard/module_auth/service/auth_service/auth_service.dart';
import 'package:twaslna_dashboard/module_network/http_client/http_client.dart';
import 'package:twaslna_dashboard/module_reports/response/reports_captain_response.dart';
import 'package:twaslna_dashboard/module_reports/response/reports_client_response.dart';
import 'package:twaslna_dashboard/module_reports/response/reports_products_response.dart';
import 'package:twaslna_dashboard/module_reports/response/reports_store_response.dart';

@injectable
class ReportRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  ReportRepository(this._apiClient, this._authService);

  Future<ReportsCaptainResponse?> getCaptainsReport() async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.get(Urls.GET_CAPTAINS_REPORT,
        headers: {'Authorization': 'Bearer ' + token.toString()});
    if (response == null) return null;
    return ReportsCaptainResponse.fromJson(response);
  }
  Future<ReportsProductsResponse?> getProductsReport() async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.get(Urls.GET_PRODUCTS_REPORT,
        headers: {'Authorization': 'Bearer ' + token.toString()});
    if (response == null) return null;
    return ReportsProductsResponse.fromJson(response);
  }
  Future<ReportsClientResponse?> getClientsReport() async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.get(Urls.GET_CLIENTS_REPORT,
        headers: {'Authorization': 'Bearer ' + token.toString()});
    if (response == null) return null;
    return ReportsClientResponse.fromJson(response);
  }
  Future<ReportsStoreResponse?> getStoresReport() async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.get(Urls.GET_STORES_REPORT,
        headers: {'Authorization': 'Bearer ' + token.toString()});
    if (response == null) return null;
    return ReportsStoreResponse.fromJson(response);
  }

}

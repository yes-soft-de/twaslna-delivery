import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/consts/urls.dart';
import 'package:twaslna_dashboard/module_auth/service/auth_service/auth_service.dart';
import 'package:twaslna_dashboard/module_captain/response/captain_account_balance_response.dart';
import 'package:twaslna_dashboard/module_logs/response/captain_logs_response.dart';
import 'package:twaslna_dashboard/module_network/http_client/http_client.dart';

@injectable
class LogsRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  LogsRepository(this._apiClient, this._authService);

  Future<CaptainLogsResponse?> getCaptainLogs(int captainId) async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.get(
        Urls.GET_CAPTAINS_LOGS + '$captainId',
        headers: {'Authorization': 'Bearer ' + token.toString()});
    if (response == null) return null;
    return CaptainLogsResponse.fromJson(response);
  }
  Future<CaptainAccountBalanceResponse?> getStoreLogs(int storeId) async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.get(
        Urls.GET_ACCOUNT_BALANCE_CAPTAIN + '$storeId',
        headers: {'Authorization': 'Bearer ' + token.toString()});
    if (response == null) return null;
    return CaptainAccountBalanceResponse.fromJson(response);
  }

}

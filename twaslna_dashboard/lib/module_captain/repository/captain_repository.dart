import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/consts/urls.dart';
import 'package:twaslna_dashboard/module_auth/service/auth_service/auth_service.dart';
import 'package:twaslna_dashboard/module_captain/request/accept_captain_request.dart';
import 'package:twaslna_dashboard/module_captain/response/captain_account_balance_response.dart';
import 'package:twaslna_dashboard/module_captain/response/captain_profile_response.dart';
import 'package:twaslna_dashboard/module_captain/response/captain_unfinished_pyments_response.dart';
import 'package:twaslna_dashboard/module_captain/response/in_active_captain_response.dart';
import 'package:twaslna_dashboard/module_categories/response/response.dart';
import 'package:twaslna_dashboard/module_network/http_client/http_client.dart';
import 'package:twaslna_dashboard/module_orders/response/captain_remaining_payments_response.dart';

@injectable
class CaptainRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  CaptainRepository(this._apiClient, this._authService);

  Future<InActiveCaptainResponse?> getInActiveCaptain() async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.get(Urls.GET_IN_ACTIVE_CAPTAINS,
        headers: {'Authorization': 'Bearer ' + token.toString()});
    if (response == null) return null;
    return InActiveCaptainResponse.fromJson(response);
  }

  Future<InActiveCaptainResponse?> getCaptains() async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.get(Urls.GET_CAPTAINS_LIST,
        headers: {'Authorization': 'Bearer ' + token.toString()});
    if (response == null) return null;
    return InActiveCaptainResponse.fromJson(response);
  }

  Future<CaptainProfileResponse?> getCaptainProfile(int captainId) async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.get(
        Urls.GET_CAPTAIN_PROFILE + '$captainId',
        headers: {'Authorization': 'Bearer ' + token.toString()});
    if (response == null) return null;
    return CaptainProfileResponse.fromJson(response);
  }

  Future<CaptainAccountBalanceResponse?> getCaptainAccountBalance(int captainId) async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.get(
        Urls.GET_ACCOUNT_BALANCE_CAPTAIN + '$captainId',
        headers: {'Authorization': 'Bearer ' + token.toString()});
    if (response == null) return null;
    return CaptainAccountBalanceResponse.fromJson(response);
  }
  Future<CaptainAccountBalanceResponse?> getCaptainAccountBalanceLastBalance(int captainId) async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.get(
        Urls.GET_ACCOUNT_BALANCE_CAPTAIN_LAST_MONTH + '$captainId',
        headers: {'Authorization': 'Bearer ' + token.toString()});
    if (response == null) return null;
    return CaptainAccountBalanceResponse.fromJson(response);
  }

  Future<CaptainUnfinishedPaymentsResponse?> captainPayments() async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.get(
        Urls.GET_UNFINISHED_PAYMENT,
        headers: {'Authorization': 'Bearer ' + token.toString()});
    if (response == null) return null;
    return CaptainUnfinishedPaymentsResponse.fromJson(response);
  }
  Future<CaptainRemainingPaymentsResponse?> captainRemainingPayments() async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.get(
        Urls.GET_REMAINING_PAYMENT,
        headers: {'Authorization': 'Bearer ' + token.toString()});
    if (response == null) return null;
    return CaptainRemainingPaymentsResponse.fromJson(response);
  }

  Future<ActionResponse?> enableCaptain(AcceptCaptainRequest request) async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.put(
        Urls.ACTIVATE_CAPTAIN, request.toJson(),
        headers: {'Authorization': 'Bearer ' + token.toString()});
    if (response == null) return null;
    return ActionResponse.fromJson(response);
  }

  Future<CaptainAccountBalanceResponse?> getCaptainSpecificDate(int captainId,String firstDate,String lastDate) async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.get(
        Urls.GET_ACCOUNT_BALANCE_CAPTAIN_SPECIFIC + '$captainId' + '/$firstDate' + '/$lastDate',
        headers: {'Authorization': 'Bearer ' + token.toString()});
    if (response == null) return null;
    return CaptainAccountBalanceResponse.fromJson(response);
  }
}

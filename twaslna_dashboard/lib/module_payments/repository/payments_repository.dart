import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/consts/urls.dart';
import 'package:twaslna_dashboard/module_auth/service/auth_service/auth_service.dart';
import 'package:twaslna_dashboard/module_categories/response/response.dart';
import 'package:twaslna_dashboard/module_network/http_client/http_client.dart';
import 'package:twaslna_dashboard/module_payments/request/captain_payments_request.dart';

@injectable
class PaymentsRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  PaymentsRepository(this._apiClient, this._authService);

  Future<ActionResponse?> paymentFromCaptain(CaptainPaymentsRequest request) async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.post(
        Urls.PAYMENTS_FROM_CAPTAIN, request.toJson(),
        headers: {'Authorization': 'Bearer ' + token.toString()});
    if (response == null) return null;
    return ActionResponse.fromJson(response);
  }

  Future<ActionResponse?> paymentToCaptain(CaptainPaymentsRequest request) async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.post(
        Urls.PAYMENTS_TO_CAPTAIN, request.toJson(),
        headers: {'Authorization': 'Bearer ' + token.toString()});
    if (response == null) return null;
    return ActionResponse.fromJson(response);
  }

}

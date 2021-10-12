import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/consts/urls.dart';
import 'package:twaslna_dashboard/module_auth/service/auth_service/auth_service.dart';
import 'package:twaslna_dashboard/module_captain/response/captain_profile_response.dart';
import 'package:twaslna_dashboard/module_captain/response/in_active_captain_response.dart';
import 'package:twaslna_dashboard/module_clients/response/client_profile_response.dart';
import 'package:twaslna_dashboard/module_clients/response/clients_list_profile.dart';
import 'package:twaslna_dashboard/module_filters/response/stores_filter_response.dart';
import 'package:twaslna_dashboard/module_network/http_client/http_client.dart';

@injectable
class ClientsRepository {
  final ApiClient _apiClient;
  final AuthService _authService;

  ClientsRepository(this._apiClient, this._authService);

  Future<ClientsListProfileResponse?> getClients() async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.get(Urls.GET_CLIENTS_LIST,
        headers: {'Authorization': 'Bearer ' + token.toString()});
    if (response == null) return null;
    return ClientsListProfileResponse.fromJson(response);
  }

  Future<ClientProfileResponse?> getClientProfile(int clientId) async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.get(
        Urls.GET_CLIENT_PROFILE + '$clientId',
        headers: {'Authorization': 'Bearer ' + token.toString()});
    if (response == null) return null;
    return ClientProfileResponse.fromJson(response);
  }
  Future<ClientsListProfileResponse?> getClientFilters(String searchKey) async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.get(Urls.CLIENT_FILTER + searchKey,
        headers: {'Authorization': 'Bearer ' + token.toString()});
    if (response == null) return null;
    return ClientsListProfileResponse.fromJson(response);
  }

}

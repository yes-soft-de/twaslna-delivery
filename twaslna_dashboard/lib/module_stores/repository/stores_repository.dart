import 'package:analyzer_plugin/protocol/protocol.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/consts/urls.dart';
import 'package:twaslna_dashboard/module_auth/service/auth_service/auth_service.dart';
import 'package:twaslna_dashboard/module_categories/request/create_store_category_request.dart';
import 'package:twaslna_dashboard/module_categories/response/response.dart';
import 'package:twaslna_dashboard/module_categories/response/store_categories_response.dart';
import 'package:twaslna_dashboard/module_network/http_client/http_client.dart';
import 'package:twaslna_dashboard/module_stores/request/create_store_request.dart';
import 'package:twaslna_dashboard/module_stores/response/stores_response.dart';

@injectable
class StoresRepository {

  final ApiClient _apiClient;
  final AuthService _authService;

  StoresRepository(this._apiClient,this._authService);

  Future<StoresResponse?> getStores() async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.get(Urls.GET_STORES,
        headers: {'Authorization': 'Bearer ' + token.toString()});
    if (response == null) return null;
    return StoresResponse.fromJson(response);
  }

  Future<ActionResponse?> addStore(CreateStoreRequest request) async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.post(Urls.CREATE_STORES,request.toJson(),
        headers: {'Authorization': 'Bearer ' + token.toString()});
    if (response == null) return null;
    return ActionResponse.fromJson(response);
  }

}

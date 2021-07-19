import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/consts/urls.dart';
import 'package:twaslna_delivery/module_network/http_client/http_client.dart';
import 'package:twaslna_delivery/module_our_services/request/send_it_request.dart';
import 'package:twaslna_delivery/module_our_services/response/sendItResponse.dart';
@injectable
class ServicesRepository{
  final ApiClient _apiClient;

  ServicesRepository(this._apiClient);
  var fakeToken = '' ;
  Future <int?> sendItClintOrder(SendItRequest request) async {
    var token = fakeToken;
    dynamic response = await  _apiClient.post(Urls.POST_CLIENT_SEND_IT_ORDER_API, request.toJson());
    if (response == null) return null;
    return int.parse(SendItResponse.fromJson(response).statusCode ?? '500');
  }
}
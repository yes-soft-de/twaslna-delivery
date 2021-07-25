import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/consts/urls.dart';
import 'package:twaslna_delivery/module_network/http_client/http_client.dart';
import 'package:twaslna_delivery/module_orders/request/client_order_request.dart';
import 'package:twaslna_delivery/module_orders/response/client_order_response.dart';
import 'package:twaslna_delivery/module_orders/response/my_orders_response.dart';
import 'package:twaslna_delivery/module_orders/response/order_details_response.dart';

@injectable
class MyOrdersRepository {
  final ApiClient _apiClient;

  MyOrdersRepository(this._apiClient);

  var fakeToken =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2MjcyMzQ0OTcsImV4cCI6MTYyNzI0MTY5Nywicm9sZXMiOlsiUk9MRV9DTElFTlQiLCJ1c2VyIl0sInVzZXJuYW1lIjoiY2xpZW50In0.K1-PZCdtL6j70jdeQUHyY_1y3Bh-AnRKyKGHsV5538UL_ujVJnj3UVpyUkvCxqULlvOtxu9BXahSABlIFD_OOvH4KaDoqO0NyanCVFzl4G0tBifLvG2giSpn8b2GZbS83IcPWEFbRDNoV25hAlbkTIVYlXjtwJGfot7Dr3-FWNcDL5qeincSLDzfuxWvTGhIBbkwVfNJyznU4WDkZLBqpg7tT-_xUQz1NJgfV-ZHSdMLeIpKltRhIo2j_khLcclVHg4qBsUkBJJuipLkmT00NCxY5jx9fEP4Y2EImHjgaFX2fR5Yz49YfMwkkp-eheJ0yhSUq4_YJbI5YaOneknYgQ';

  Future<MyOrdersResponse?> getOrders() async {
    var token = fakeToken;
    dynamic response = await _apiClient.get(Urls.GET_MY_ORDERS,
        headers: {'Authorization': 'Bearer ' + token.toString()});
    if (response == null) return null;
    return MyOrdersResponse.fromJson(response);
  }

  Future<OrderDetailsResponse?> getOrdersDetails(int id) async {
    var token = fakeToken;
    dynamic response = await _apiClient.get(Urls.GET_ORDER_DETAILS + '/$id',
        headers: {'Authorization': 'Bearer ' + token.toString()});
    if (response == null) return null;
    return OrderDetailsResponse.fromJson(response);
  }

  Future<int?> postClientOrder(ClientOrderRequest request) async {
    var token = fakeToken;
    dynamic response = await _apiClient.post(
        Urls.POST_CLIENT_ORDER_API, request.toJson(),
        headers: {'Authorization': 'Bearer ' + token.toString()});
    if (response == null) return null;
    return int.parse(ClientOrderResponse.fromJson(response).statusCode??'500');
  }
  Future<ClientOrderResponse?> deleteClientOrder(int id) async {
    var token = fakeToken;
    dynamic response = await _apiClient.put(
        Urls.DELETE_CLIENT_ORDER_API + '/$id',{},
        headers: {'Authorization': 'Bearer ' + token.toString()});
    if (response == null) return null;
    return ClientOrderResponse.fromJson(response);
  }
  Future<ClientOrderResponse?> updateClientOrder(request) async {
    var token = fakeToken;
    dynamic response = await _apiClient.put(
        Urls.UPDATE_CLIENT_ORDER_API,request.toJson(),
        headers: {'Authorization': 'Bearer ' + token.toString()});
    if (response == null) return null;
    return ClientOrderResponse.fromJson(response);
  }
}

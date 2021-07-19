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
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2MjYzNDU3NDIsImV4cCI6MTYyNjM1Mjk0Miwicm9sZXMiOlsiUk9MRV9DTElFTlQiLCJ1c2VyIl0sInVzZXJuYW1lIjoiY2xpZW50In0.T3ZV2FI5oIt3Q2uwehiDW6ODP94f_3K0JLtPLJsfeerWCo3zIWgu-TREuXv14QbP-raAXpz5czDhPPkAlRPt01cEumNQ9k0tTJ_2uPAbb6Xd5sONR_H76QcyDNn6o9dc3VFLuujaHOTl7JfJb18x1zNeR-Raa9Q31uea7CSVGvdP2YeypuDsr5gzGupPyT78OQDKhaWAggXiIjRF4kjt1U4QS5VB3hPMQ7voQc75BYQ5D6V7FfcChpo77Aaz-zXsgtM6W5Yjfh3Sg3QT4di30MJ3OZUvNSWMKKKlsn8MgcZ7rscT7Uwp8XzG1XBKesEJSlj49Oa3uL_2SWlVcvqlow';

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
}

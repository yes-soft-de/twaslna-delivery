import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/consts/urls.dart';
import 'package:twaslna_delivery/module_network/http_client/http_client.dart';
import 'package:twaslna_delivery/module_orders/response/my_orders_response.dart';
import 'package:twaslna_delivery/module_orders/response/order_details_response.dart';
@injectable
class MyOrdersRepository{
  final ApiClient _apiClient;
  MyOrdersRepository(this._apiClient);
  var fakeToken = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJpYXQiOjE2MjYxMDYwOTIsImV4cCI6MTYyNjExMzI5Miwicm9sZXMiOlsiUk9MRV9DTElFTlQiLCJ1c2VyIl0sInVzZXJuYW1lIjoiY2xpZW50In0.I6_AJ-_VNV8IzHvTgZSObHozUhLdWcWqzYHcCufqxbId4cZSJs_8wMGL_QzoPsUcL0NuaqWLrKdr_ES6jmgI6NALq23H60chEQ8MVypnNCWHTL2OZgU3e7cj2OSk5-x_9f17nfueH_62L8G4oU4Ydln1dOlPcCeJCcp2WE3P-0NV4nIVQAXRoulRElfacNqBk7DIBIbonbynx1--kifZ44aok3oJWqNAqqnJmOZyFOgjPpk4EtIE5GUImUbqAcQu6qP02o17g8SzrQLYeIuUsADUT791mjXAq1Urjv2Ly3LCoTMhOvS6gKzB-iz3b2HQG77sd2vHMCzpwSvLyyZw0w';
  Future <MyOrdersResponse?> getOrders() async {
    var token = fakeToken;
    dynamic response = await _apiClient.get(Urls.GET_MY_ORDERS,headers: {'Authorization':'Bearer ' + token.toString()});
    if (response == null) return null;
    return MyOrdersResponse.fromJson(response);
  }
  Future <OrderDetailsResponse?> getOrdersDetails(int id) async {
    var token = fakeToken;
    dynamic response = await _apiClient.get(Urls.GET_ORDER_DETAILS + '/$id');
    if (response == null) return null;
    return OrderDetailsResponse.fromJson(response);
  }
}
import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/consts/urls.dart';
import 'package:twaslna_dashboard/module_auth/service/auth_service/auth_service.dart';
import 'package:twaslna_dashboard/module_network/http_client/http_client.dart';
import 'package:twaslna_dashboard/module_orders/response/my_orders_response.dart';
import 'package:twaslna_dashboard/module_orders/response/order_details_response.dart';

@injectable
class MyOrdersRepository {
  final ApiClient _apiClient;
  final AuthService _authService;
  MyOrdersRepository(this._apiClient,this._authService);

  Future<MyOrdersResponse?> getOrders() async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.get(Urls.GET_UNFINISHED_ORDER,
        headers: {'Authorization': 'Bearer ' + token.toString()});
    if (response == null) return null;
    return MyOrdersResponse.fromJson(response);
  }
  Future<MyOrdersResponse?> getOnGoingOrders() async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.get(Urls.GET_ONGOING_ORDERS,
        headers: {'Authorization': 'Bearer ' + token.toString()});
    if (response == null) return null;
    return MyOrdersResponse.fromJson(response);
  }

  Future<OrderDetailsResponse?> getOrdersDetails(int id) async {
    var token = await _authService.getToken();

    dynamic response = await _apiClient.get(Urls.GET_ORDER_DETAILS + '$id',
        headers: {'Authorization': 'Bearer ' + token.toString()});
    if (response == null) return null;
    return OrderDetailsResponse.fromJson(response);
  }



}

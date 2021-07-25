import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_orders/repository/orders_repository.dart';
import 'package:twaslna_delivery/module_orders/request/client_order_request.dart';
import 'package:twaslna_delivery/module_orders/response/client_order_response.dart';
import 'package:twaslna_delivery/module_orders/response/my_orders_response.dart';
import 'package:twaslna_delivery/module_orders/response/order_details_response.dart';

@injectable
class MyOrdersManager {
  final MyOrdersRepository _myOrdersRepository;

  MyOrdersManager(this._myOrdersRepository);

  Future <MyOrdersResponse?> getOrders() => _myOrdersRepository.getOrders();
  Future <OrderDetailsResponse?> getOrderDetails(int id) => _myOrdersRepository.getOrdersDetails(id);
  Future <int?> postClintOrder(ClientOrderRequest request) => _myOrdersRepository.postClientOrder(request);
  Future <ClientOrderResponse?> deleteClientOrder(int id) => _myOrdersRepository.deleteClientOrder(id);
  Future <ClientOrderResponse?> updateClientOrder(request) => _myOrdersRepository.updateClientOrder(request);

}

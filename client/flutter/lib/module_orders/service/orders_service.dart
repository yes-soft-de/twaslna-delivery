 import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_orders/helper/error_messages.dart';
import 'package:twaslna_delivery/module_orders/manager/my_orders_manager.dart';
import 'package:twaslna_delivery/module_orders/model/deleted_order_status.dart';
import 'package:twaslna_delivery/module_orders/model/order_details_model.dart';
import 'package:twaslna_delivery/module_orders/model/order_model.dart';
import 'package:twaslna_delivery/module_orders/request/client_order_request.dart';
import 'package:twaslna_delivery/module_orders/response/client_order_response.dart';
import 'package:twaslna_delivery/module_orders/response/my_orders_response.dart';
import 'package:twaslna_delivery/module_orders/response/order_details_response.dart';
import 'package:twaslna_delivery/utils/helpers/order_status_helper.dart';
import 'package:twaslna_delivery/utils/helpers/status_code_helper.dart';

@injectable
class OrdersService {
  final MyOrdersManager _myOrdersManager;

  OrdersService(this._myOrdersManager);

  Future<OrderModel> getOrders() async {
    MyOrdersResponse? _ordersResponse = await _myOrdersManager.getOrders();
    if (_ordersResponse == null) return OrderModel.Error(S.current.networkError);
    if (_ordersResponse.statusCode != '200') return OrderModel.Error(StatusCodeHelper.getStatusCodeMessages(_ordersResponse.statusCode));
    if (_ordersResponse.data == null) return OrderModel.Empty();
    return OrderModel.Data(_ordersResponse);
  }
  Future<OrderDetailsModel> getOrdersDetails(int id) async {
    OrderDetailsResponse? _ordersResponse = await _myOrdersManager.getOrderDetails(id);
    if (_ordersResponse == null) return OrderDetailsModel.Error(S.current.networkError);
    if (_ordersResponse.statusCode != '200') return OrderDetailsModel.Error(StatusCodeHelper.getStatusCodeMessages(_ordersResponse.statusCode));
    if (_ordersResponse.data == null) return OrderDetailsModel.Empty();
    return OrderDetailsModel.Data(_ordersResponse);
  }

  Future <MyOrderState> postClientOrder(ClientOrderRequest request) async {
    ClientOrderResponse? clientOrderResponse = await _myOrdersManager.postClintOrder(request);
    if (clientOrderResponse == null) return MyOrderState.error(S.current.networkError);
    if (clientOrderResponse.statusCode != '201') return MyOrderState.error(StatusCodeHelper.getStatusCodeMessages(clientOrderResponse.statusCode));
    return MyOrderState.empty();
  }
  Future <MyOrderState> deleteClientOrder(int id) async {
    ClientOrderResponse? clientOrderResponse = await _myOrdersManager.deleteClientOrder(id);
    if (clientOrderResponse == null) {
      return MyOrderState.error(S.current.networkError);
    } else {
      if (clientOrderResponse.statusCode == '204') {
      return MyOrderState.empty();
      }
      else if (clientOrderResponse.statusCode == '425') {
        return MyOrderState.error(ErrorMessages.getDeleteMessage(clientOrderResponse.data));
      }
      else {
        return MyOrderState.error(StatusCodeHelper.getStatusCodeMessages(int.parse(clientOrderResponse.statusCode??'500')));
      }
    }
  }
  Future <MyOrderState> updateClientOrder(ClientOrderRequest request) async {
    ClientOrderResponse? clientOrderResponse = await _myOrdersManager.updateClientOrder(request);
    if (clientOrderResponse == null) {
      return MyOrderState.error(S.current.networkError);
    }
    if (clientOrderResponse.statusCode == '204') {
        return MyOrderState.empty();
      }
    if (clientOrderResponse.statusCode == '425') {
        return MyOrderState.error(ErrorMessages.getDeleteMessage(clientOrderResponse.data));
    }
    return MyOrderState.error(StatusCodeHelper.getStatusCodeMessages(clientOrderResponse.statusCode??'0'));
  }
}

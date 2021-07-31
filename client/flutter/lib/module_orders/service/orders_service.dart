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

  Future getOrders() async {
    MyOrdersResponse? _ordersResponse = await _myOrdersManager.getOrders();
    if (_ordersResponse == null) return null;
    if (_ordersResponse.data != null) {
      List<OrderModel> orders = [];
      _ordersResponse.data?.forEach((element) {
        String date = DateFormat('dd-MM-yyyy').format(DateTime.fromMillisecondsSinceEpoch(
            (element.deliveryDate?.timestamp ??
                DateTime.now().millisecondsSinceEpoch) *
                1000));
        orders.add(OrderModel(
            orderDate:date,
            orderId: element.orderNumber ?? '-1',
            orderStatus: StatusHelper.getStatusEnum(element.state),
            orderCost: element.orderCost ?? 0));
      });
      return orders;
    }
    else {
      return _ordersResponse.statusCode;
    }
  }
  Future getOrdersDetails(int id) async {
    OrderDetailsResponse? _ordersResponse = await _myOrdersManager.getOrderDetails(id);
    if (_ordersResponse == null) return null;
    if (_ordersResponse.data != null ) {
      OrderDetailsModel orderDetails = OrderDetailsModel(
        carts: toCartList(_ordersResponse.data?.orderDetails??<OrderDetails>[]),
        order: toOrder(_ordersResponse.data?.order),
        storeInfo:StoreOwnerInfo(
          storeOwnerID: _ordersResponse.data?.storeOwner?.storeOwnerID ?? -1,
          storeOwnerName: _ordersResponse.data?.storeOwner?.storeOwnerName ?? S.current.storeOwner,
          image: 'https://static.parade.com/wp-content/uploads/2020/03/target-senior-hours-ftr.jpg',
          imageURL: 'https://static.parade.com/wp-content/uploads/2020/03/target-senior-hours-ftr.jpg',
        )
      );
    return orderDetails;
    }
    else {
      return int.parse(_ordersResponse.statusCode??'500');
    }
  }

  Future <int?> postClientOrder(ClientOrderRequest request) async {
    int? clientOrderResponse = await _myOrdersManager.postClintOrder(request);
    if (clientOrderResponse == null) return null;
    return clientOrderResponse;
  }
  Future <DeletedOrderStatus> deleteClientOrder(int id) async {
    ClientOrderResponse? clientOrderResponse = await _myOrdersManager.deleteClientOrder(id);
    if (clientOrderResponse == null) {
      return DeletedOrderStatus.error(S.current.networkError);
    } else {
      if (clientOrderResponse.statusCode == '204') {
      return DeletedOrderStatus.empty();
      }
      else if (clientOrderResponse.statusCode == '425') {
        return DeletedOrderStatus.error(ErrorMessages.getDeleteMessage(clientOrderResponse.data));
      }
      else {
        return DeletedOrderStatus.error(StatusCodeHelper.getStatusCodeMessages(int.parse(clientOrderResponse.statusCode??'500')));
      }
    }
  }
  Future <DeletedOrderStatus> updateClientOrder(ClientOrderRequest request) async {
    ClientOrderResponse? clientOrderResponse = await _myOrdersManager.updateClientOrder(request);
    if (clientOrderResponse == null) {
      return DeletedOrderStatus.error(S.current.networkError);
    } else {
      if (clientOrderResponse.statusCode == '204') {
        return DeletedOrderStatus.empty();
      }
      else if (clientOrderResponse.statusCode == '425') {
        return DeletedOrderStatus.error(ErrorMessages.getDeleteMessage(clientOrderResponse.data));
      }
      else {
        return DeletedOrderStatus.error(StatusCodeHelper.getStatusCodeMessages(int.parse(clientOrderResponse.statusCode??'500')));
      }
    }
  }
}

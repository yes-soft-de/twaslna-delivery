import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_orders/manager/my_orders_manager.dart';
import 'package:twaslna_delivery/module_orders/model/order_details_model.dart';
import 'package:twaslna_delivery/module_orders/model/order_model.dart';
import 'package:twaslna_delivery/module_orders/request/client_order_request.dart';
import 'package:twaslna_delivery/module_orders/response/my_orders_response.dart';
import 'package:twaslna_delivery/module_orders/response/order_details_response.dart';
import 'package:twaslna_delivery/utils/helpers/order_status_helper.dart';

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
          storeOwnerID: _ordersResponse.data?.storeOwner?.id.toString() ?? '-1',
          storeOwnerName: _ordersResponse.data?.storeOwner?.storeOwnerName ?? S.current.storeOwner,
          image: 'https://static.parade.com/wp-content/uploads/2020/03/target-senior-hours-ftr.jpg',
          imageURL: 'https://static.parade.com/wp-content/uploads/2020/03/target-senior-hours-ftr.jpg'
        )
      );
    return orderDetails;
    }
    else {
      return _ordersResponse.statusCode;
    }
  }

  Future <int?> postClientOrder(ClientOrderRequest request) async {
    int? clientOrderResponse = await _myOrdersManager.postClintOrder(request);
    if (clientOrderResponse == null)return null;
    return clientOrderResponse;
  }
}

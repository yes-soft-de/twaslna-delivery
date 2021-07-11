import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/abstracts/module/yes_module.dart';
import 'package:twaslna_delivery/module_orders/orders_routes.dart';
import 'package:twaslna_delivery/module_orders/ui/screen/my_orders_screen.dart';
import 'package:twaslna_delivery/module_orders/ui/screen/order_details_screen.dart';
import 'package:twaslna_delivery/module_orders/ui/screen/order_status_screen.dart';
@injectable
class OrdersModule extends YesModule {
final MyOrdersScreen _myOrdersScreen;
final OrderDetailsScreen _orderDetailsScreen;
final OrderStatusScreen _orderStatusScreen;
  OrdersModule(this._myOrdersScreen,this._orderDetailsScreen,this._orderStatusScreen){
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
     OrdersRoutes.MY_ORDERS : (context) => _myOrdersScreen,
      OrdersRoutes.ORDER_DETAILS : (context) => _orderDetailsScreen,
      OrdersRoutes.ORDER_STATUS : (context) => _orderStatusScreen
    };
  }
}
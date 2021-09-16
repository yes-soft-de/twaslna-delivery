import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/abstracts/module/yes_module.dart';
import 'package:twaslna_dashboard/module_orders/orders_routes.dart';
import 'package:twaslna_dashboard/module_orders/ui/screen/OngoingOrdersScreen.dart';
import 'package:twaslna_dashboard/module_orders/ui/screen/my_orders_screen.dart';
import 'package:twaslna_dashboard/module_orders/ui/screen/order_details_screen.dart';

@injectable
class OrdersModule extends YesModule {
final OrdersScreen _myOrdersScreen;
final OrderDetailsScreen _orderDetailsScreen;
final OnGoingOrdersScreen _onGoingOrdersScreen;
  OrdersModule(this._myOrdersScreen,this._orderDetailsScreen,this._onGoingOrdersScreen){
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      OrdersRoutes.MY_ORDERS : (context) => _myOrdersScreen,
      OrdersRoutes.ORDER_DETAILS : (context) => _orderDetailsScreen,
      OrdersRoutes.ORDERS_ONGOING :(context) => _onGoingOrdersScreen
    };
  }
}
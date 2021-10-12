import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/abstracts/module/yes_module.dart';
import 'package:twaslna_dashboard/module_orders/orders_routes.dart';
import 'package:twaslna_dashboard/module_orders/ui/screen/OngoingOrdersScreen.dart';
import 'package:twaslna_dashboard/module_orders/ui/screen/my_orders_screen.dart';
import 'package:twaslna_dashboard/module_orders/ui/screen/order_accounts_screen.dart';
import 'package:twaslna_dashboard/module_orders/ui/screen/order_details_screen.dart';
import 'package:twaslna_dashboard/module_orders/ui/screen/order_timeline_screen.dart';
import 'package:twaslna_dashboard/module_orders/ui/screen/orders_without_pending_screen.dart';

@injectable
class OrdersModule extends YesModule {
final OrdersScreen myOrdersScreen;
final OrdersWithoutPendingScreen ordersWithoutPendingScreen;
final OrderDetailsScreen orderDetailsScreen;
final OnGoingOrdersScreen onGoingOrdersScreen;
final OrderTimLineScreen orderTimLineScreen;
final OrdersAccountScreen ordersAccountScreen;
  OrdersModule(this.myOrdersScreen,this.orderDetailsScreen,this.onGoingOrdersScreen,this.orderTimLineScreen,this.ordersWithoutPendingScreen,this.ordersAccountScreen){
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      OrdersRoutes.PENDING_ORDERS : (context) => myOrdersScreen,
      OrdersRoutes.ORDER_DETAILS : (context) => orderDetailsScreen,
      OrdersRoutes.ORDERS_ONGOING :(context) => onGoingOrdersScreen,
      OrdersRoutes.ORDER_TIME_LINE : (context) => orderTimLineScreen,
      OrdersRoutes.ORDERS : (context) => ordersWithoutPendingScreen,
      OrdersRoutes.ORDERS_ACCOUNTS : (context) => ordersAccountScreen,

    };
  }
}
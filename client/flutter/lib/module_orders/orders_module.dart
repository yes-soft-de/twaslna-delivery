import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/abstracts/module/yes_module.dart';
import 'package:twaslna_delivery/module_orders/orders_routes.dart';
import 'package:twaslna_delivery/module_orders/ui/screen/my_orders_screen.dart';
@injectable
class OrdersModule extends YesModule {
final MyOrdersScreen _myOrdersScreen;
  OrdersModule(this._myOrdersScreen){
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
     OrdersRoutes.MY_ORDERS : (context) => _myOrdersScreen
    };
  }
}
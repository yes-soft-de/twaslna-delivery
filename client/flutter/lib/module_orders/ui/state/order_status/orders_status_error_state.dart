import 'package:flutter/material.dart';
import 'package:twaslna_delivery/module_orders/ui/screen/order_status_screen.dart';
import 'package:twaslna_delivery/module_orders/ui/state/order_status/order_status_state.dart';
class OrderStatusErrorState extends OrderStatusState {
  final String error;
  OrderStatusScreenState screenState;

  OrderStatusErrorState(this.screenState, this.error) : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(child: Text(error));
  }
}

import 'package:flutter/material.dart';
import 'package:twaslna_delivery/module_orders/ui/screen/my_orders_screen.dart';
import 'package:twaslna_delivery/module_orders/ui/state/my_orders/my_orders_state.dart';


class MyOrdersErrorState extends MyOrdersState {
  final String error;
  MyOrdersScreenState screenState;

  MyOrdersErrorState(this.screenState, this.error) : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(child: Text(error));
  }
}

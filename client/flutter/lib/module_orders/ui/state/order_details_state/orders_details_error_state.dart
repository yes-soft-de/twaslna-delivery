import 'package:flutter/material.dart';
import 'package:twaslna_delivery/module_orders/ui/screen/order_details_screen.dart';
import 'package:twaslna_delivery/module_orders/ui/state/order_details_state/order_details_state.dart';
class OrderDetailsErrorState extends OrderDetailsState {
  final String error;
  OrderDetailsScreenState screenState;

  OrderDetailsErrorState(this.screenState, this.error) : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(child: Text(error));
  }
}

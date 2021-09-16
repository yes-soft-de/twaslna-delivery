import 'package:flutter/material.dart';
import 'package:twaslna_dashboard/module_orders/ui/screen/order_details_screen.dart';

abstract class OrderDetailsState {
  final OrderDetailsScreenState orderDetailsScreenState;

  OrderDetailsState(this.orderDetailsScreenState);

  Widget getUI(BuildContext context);
}

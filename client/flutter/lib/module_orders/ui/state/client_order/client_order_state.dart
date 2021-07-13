import 'package:flutter/material.dart';
import 'package:twaslna_delivery/module_orders/ui/screen/client_order_screen.dart';

abstract class ClientOrderState {
  final ClientOrderScreenState screenState;

  ClientOrderState(this.screenState);
  Widget getUI(BuildContext context);
}
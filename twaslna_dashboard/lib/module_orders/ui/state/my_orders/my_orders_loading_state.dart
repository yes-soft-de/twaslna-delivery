import 'package:flutter/material.dart';
import 'package:twaslna_dashboard/abstracts/states/state.dart';
import 'package:twaslna_dashboard/module_orders/ui/screen/my_orders_screen.dart';
import 'package:twaslna_dashboard/module_orders/ui/state/my_orders/my_orders_state.dart';

class MyOrdersLoadingState extends States {
  MyOrdersLoadingState(State<StatefulWidget> screenState) : super(screenState);
  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
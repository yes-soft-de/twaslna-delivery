import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_orders/state_manager/my_orders_state_manager.dart';
import 'package:twaslna_delivery/module_orders/ui/state/my_orders/my_orders_loading_state.dart';
import 'package:twaslna_delivery/module_orders/ui/state/my_orders/my_orders_state.dart';

@injectable
class MyOrdersScreen extends StatefulWidget {
  final MyOrdersStateManager _stateManager;

  MyOrdersScreen(this._stateManager);

  @override
  MyOrdersScreenState createState() => MyOrdersScreenState();
}

class MyOrdersScreenState extends State<MyOrdersScreen> {
  late MyOrdersState currentState;

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    currentState = MyOrdersLoadingState(this);
    widget._stateManager.getOrders(this);
    widget._stateManager.stateStream.listen((event) {
      currentState = event;
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var focus = FocusScope.of(context);
        if (focus.canRequestFocus) {
          focus.unfocus();
        }
      },
      child: Scaffold(
        body: currentState.getUI(context),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_orders/ui/state/order_status/order_status_loaded_state.dart';
import 'package:twaslna_delivery/module_orders/ui/state/order_status/order_status_state.dart';
@injectable
class OrderStatusScreen extends StatefulWidget {

  @override
  OrderStatusScreenState createState() => OrderStatusScreenState();
}

class OrderStatusScreenState extends State<OrderStatusScreen> {
  late OrderStatusState currentState;
  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    currentState = OrderStatusLoadedState(this);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        var focus = FocusScope.of(context);
        if (focus.canRequestFocus){
          focus.unfocus();
        }
      },
      child: Scaffold(
        body: currentState.getUI(context),
      ),
    );
  }
}

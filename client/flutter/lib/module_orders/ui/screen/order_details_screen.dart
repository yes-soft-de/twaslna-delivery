import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_orders/ui/state/order_details_state/order_details_loaded_state.dart';
import 'package:twaslna_delivery/module_orders/ui/state/order_details_state/order_details_state.dart';
@injectable
class OrderDetailsScreen extends StatefulWidget {

  @override
  OrderDetailsScreenState createState() => OrderDetailsScreenState();
}

class OrderDetailsScreenState extends State<OrderDetailsScreen> {
  late OrderDetailsState currentState;
  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    currentState = OrderDetailsLoadedState(this);
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

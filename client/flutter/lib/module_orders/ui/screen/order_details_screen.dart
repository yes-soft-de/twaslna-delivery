import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_orders/state_manager/order_details_state_manager.dart';
import 'package:twaslna_delivery/module_orders/ui/state/order_details_state/order_details_state.dart';
import 'package:twaslna_delivery/module_orders/ui/state/order_details_state/orders_details_loading_state.dart';
@injectable
class OrderDetailsScreen extends StatefulWidget {
  final OrderDetailsStateManager _stateManager;

  OrderDetailsScreen(this._stateManager);

  @override
  OrderDetailsScreenState createState() => OrderDetailsScreenState();
}

class OrderDetailsScreenState extends State<OrderDetailsScreen> {
  late OrderDetailsState currentState;
  bool flagOrderId = true;
  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    currentState = OrderDetailsLoadingState(this);
    widget._stateManager.stateStream.listen((event) {
      currentState = event;
      if (mounted){
        setState(() {
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments;
    if (flagOrderId && args is String) {
      widget._stateManager.getOrderDetails(int.parse(args), this);
      flagOrderId = false;
    }
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

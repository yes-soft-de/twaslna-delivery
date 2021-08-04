import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_main/main_routes.dart';
import 'package:twaslna_delivery/module_orders/request/client_order_request.dart';
import 'package:twaslna_delivery/module_orders/state_manager/order_details_state_manager.dart';
import 'package:twaslna_delivery/module_orders/ui/state/order_details_state/order_details_state.dart';
import 'package:twaslna_delivery/module_orders/ui/state/order_details_state/orders_details_loading_state.dart';
import 'package:twaslna_delivery/module_orders/ui/widget/order_details/custom_alert_dialog.dart';
import 'package:twaslna_delivery/utils/helpers/custom_flushbar.dart';
@injectable
class OrderDetailsScreen extends StatefulWidget {
  final OrderDetailsStateManager _stateManager;

  OrderDetailsScreen(this._stateManager);

  @override
  OrderDetailsScreenState createState() => OrderDetailsScreenState();
}

class OrderDetailsScreenState extends State<OrderDetailsScreen> {
  late OrderDetailsState currentState;
  ClientOrderRequest? clientOrderRequest;
  bool flagOrderId = true;
  int? orderNumber;
  bool edit = false;
  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }
  void deleteMessage(bool success, [String err = '']) {
    if (success) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(MainRoutes.MAIN_SCREEN, (route) => false,arguments: 1);
      CustomFlushBarHelper.createSuccess(
        title: S.of(context).warnning,
        message: S.of(context).deleteSuccess,
      )..show(context);
    } else {
      Navigator.of(context).pop();
      CustomFlushBarHelper.createError(
          title: S.of(context).warnning, message: err)
        ..show(context);
    }
  }
  void updateMessage(bool success, [String err = '']) {
    if (success) {
      CustomFlushBarHelper.createSuccess(
        title: S.of(context).warnning,
        message: S.of(context).updateOrderSuccess,
      )..show(context);
    } else {
      Navigator.of(context).pop();
      CustomFlushBarHelper.createError(
          title: S.of(context).warnning, message: err)
        ..show(context);
    }
  }

  // methods
  void deleteOrder(int id){
    showDialog(context: context, builder:(_){
      return CustomAlertDialog(onPressed: (){
        Navigator.of(context).pop();
        widget._stateManager.deleteOrderDetails(id, this);
      },);
    });
  }
 void updateClientOrder() {
    widget._stateManager.updateOrderDetails(clientOrderRequest!, this);
 }
 void getOrderDetails(int id){
   widget._stateManager.getOrderDetails(id, this);
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
      orderNumber = int.parse(args);
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

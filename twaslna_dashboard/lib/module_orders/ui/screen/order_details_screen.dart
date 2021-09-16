import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/global_nav_key.dart';
import 'package:twaslna_dashboard/module_main/main_routes.dart';
import 'package:twaslna_dashboard/module_orders/state_manager/order_details_state_manager.dart';
import 'package:twaslna_dashboard/module_orders/ui/state/order_details_state/order_details_state.dart';
import 'package:twaslna_dashboard/module_orders/ui/state/order_details_state/orders_details_loading_state.dart';
import 'package:twaslna_dashboard/utils/components/custom_app_bar.dart';
import 'package:twaslna_dashboard/utils/helpers/custom_flushbar.dart';

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
        appBar: CustomTwaslnaAppBar.appBar(context,
            title: S.of(context).orderDetails),
        body: currentState.getUI(context),
      ),
    );
  }
  @override
  void dispose(){
    widget._stateManager.newActionSubscription?.cancel();
    super.dispose();
  }
}

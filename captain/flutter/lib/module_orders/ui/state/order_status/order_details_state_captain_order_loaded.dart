import 'package:flutter/material.dart';
import 'package:simple_moment/simple_moment.dart';
import 'package:twaslna_captain/consts/order_status.dart';
import 'package:twaslna_captain/generated/l10n.dart';
import 'package:twaslna_captain/module_orders/model/order/order_details_model.dart';
import 'package:twaslna_captain/module_orders/ui/screens/order_status/order_status_screen.dart';
import 'package:twaslna_captain/module_orders/ui/state/order_status/order_status.state.dart';
import 'package:twaslna_captain/module_orders/ui/widgets/order_status_widget/private_order.dart';
import 'package:twaslna_captain/module_orders/ui/widgets/order_status_widget/products.dart';
import 'package:twaslna_captain/module_orders/ui/widgets/order_status_widget/send_it_for_me.dart';
import 'package:twaslna_captain/module_orders/ui/widgets/order_widget/custom_step.dart';
import 'package:twaslna_captain/module_orders/utils/icon_helper/order_progression_helper.dart';
import 'package:twaslna_captain/utils/components/custom_list_view.dart';
import 'package:twaslna_captain/utils/helpers/custom_flushbar.dart';
import 'package:twaslna_captain/utils/helpers/order_status_helper.dart';

class OrderDetailsStateCaptainOrderLoaded extends OrderDetailsState {
  OrderDetailsModel currentOrder;
  final _distanceCalculator = TextEditingController();
  final OrderStatusScreenState screenState;
  OrderDetailsStateCaptainOrderLoaded(
       this.screenState,
      this.currentOrder,
   ) : super(screenState) {
    cart = this.currentOrder.cart;
    storeInfo = this.currentOrder.storeInfo;
    orderInfo = this.currentOrder.order;
    if (orderInfo.state == OrderStatus.IN_STORE) {
      screenState.makeInvoice = true;
      screenState.deliverOnMe = orderInfo.orderType == 3;
      screenState.refresh();
    }
    else {
      if (screenState.makeInvoice) {
        screenState.makeInvoice = false;
        screenState.refresh();
      }
    }
  }
  late List<Item> cart;
  late StoreOwnerInfo storeInfo;
  late OrderInfo orderInfo;
  @override
  Widget getUI(BuildContext context) {
    return CustomListView.custom(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0,left: 16,right: 16,),
          child: OrderProgressionHelper.getStatusIcon(
              orderInfo.state,175,context),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0,left: 16,right: 16,bottom: 8),
          child: Flex(
            direction: Axis.horizontal,
            children: getStepper(StatusHelper.getOrderStatusIndex(
                orderInfo.state)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right:8.0,left:8,bottom: 24,top: 16),
          child: ListTile(
            leading: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:StatusHelper.getOrderStatusColor(orderInfo.state)
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(StatusHelper.getOrderStatusIcon(orderInfo.state),color:Colors.white,size: 28,),
              ),
            ),
            trailing:Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:StatusHelper.getOrderStatusColor(orderInfo.state)
              ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(Moment.now().from(DateTime.parse(orderInfo.deliveryDate)).toString(),style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white)),
                )),
            title: Text(StatusHelper.getOrderStatusMessages(orderInfo.state),style: TextStyle(fontWeight: FontWeight.bold,fontSize:18),),
            subtitle:Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Text(StatusHelper.getOrderStatusDescriptionMessages(orderInfo.state),style: TextStyle(fontWeight: FontWeight.w600)),
            ),
          ),
        ),
        // with order type we can get order widgets
       orderInfo.state == OrderStatus.CANCELLED ?SizedBox(): getOrderWidgets(orderInfo.orderType),
        Container(
          height: 75,
        ),
      ],
    );
  }
  List<Widget> getStepper(int currentIndex) {
    List<Widget> steps = [
      CustomStep(status: OrderStatus.WAITING, currentIndex: currentIndex),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(right:4.0,left: 4.0),
          child: Opacity(
            opacity: 0.65,
            child: Container(
                height: 2.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color:currentIndex < StatusHelper.getOrderStatusIndex(OrderStatus.GOT_CAPTAIN) ? Theme.of(screenState.context).disabledColor:Theme.of(screenState.context).primaryColor,
                ),
            ),
          ),
        ),
      ),
      CustomStep(status: OrderStatus.GOT_CAPTAIN, currentIndex: currentIndex),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(right:4.0,left: 4.0),
          child: Opacity(
            opacity: 0.65,
            child: Container(
              height: 2.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color:currentIndex < StatusHelper.getOrderStatusIndex(OrderStatus.IN_STORE) ? Theme.of(screenState.context).disabledColor:Theme.of(screenState.context).primaryColor,
              ),
            ),
          ),
        ),
      ),
      CustomStep(status: OrderStatus.IN_STORE, currentIndex: currentIndex),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(right:4.0,left: 4.0),
          child: Opacity(
            opacity: 0.65,
            child: Container(
              height: 2.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color:currentIndex < StatusHelper.getOrderStatusIndex(OrderStatus.DELIVERING) ? Theme.of(screenState.context).disabledColor:Theme.of(screenState.context).primaryColor,
              ),
            ),
          ),
        ),
      ),
      CustomStep(status: OrderStatus.DELIVERING, currentIndex: currentIndex),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(right:4.0,left: 4.0),
          child: Opacity(
            opacity: 0.65,
            child: Container(
              height: 2.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color:currentIndex < StatusHelper.getOrderStatusIndex(OrderStatus.FINISHED) ? Theme.of(screenState.context).disabledColor:Theme.of(screenState.context).primaryColor,
              ),
            ),
          ),
        ),
      ),
      CustomStep(status: OrderStatus.FINISHED, currentIndex: currentIndex),
    ];
    return steps;
  }
  Widget getOrderWidgets(int orderType){
    if (orderType == 1) {
      return ProductsOrder(
        orderNumber: screenState.orderId.toString(),
        acceptOrder:acceptOrder,
        provideDistance: (distance) => providedDistance(distance) , storeInfo: storeInfo, distanceCalculator: _distanceCalculator, orderInfo: orderInfo, cart: cart,
      );
    }
    else if (orderType == 2) {
      return PrivateOrder(
        orderNumber: screenState.orderId.toString(),
        acceptOrder:acceptOrder,
        provideDistance: (distance) => providedDistance(distance)
        , storeInfo: storeInfo, distanceCalculator: _distanceCalculator, orderInfo: orderInfo, cart: cart,
      );
    }
    else {
      return SendItForMe(
        orderNumber: screenState.orderId.toString(),
        acceptOrder:acceptOrder,
        provideDistance: (distance) => providedDistance(distance), storeInfo: storeInfo, distanceCalculator: _distanceCalculator, orderInfo: orderInfo, cart: cart,
      );
    }
  }
  void acceptOrder(){
    if (orderInfo.state != OrderStatus.IN_STORE) {
      screenState.requestOrderProgress(currentOrder,StatusHelper.getOrderStatusIndex(orderInfo.state));
    }
    else {
      if (screenState.invoiceRequest != null || orderInfo.orderType == 3) {
        screenState.requestOrderProgress(currentOrder,StatusHelper.getOrderStatusIndex(orderInfo.state));
      }
      else {
        CustomFlushBarHelper.createError(title:S.current.warnning, message: S.current.pleaseProvideStoreBill).show(screenState.context);
      }
    }
  }
  void providedDistance(String distance){
    screenState.requestOrderProgress(currentOrder,StatusHelper.getOrderStatusIndex(orderInfo.state),distance: _distanceCalculator.text);
  }
}

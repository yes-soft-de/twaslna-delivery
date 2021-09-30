import 'package:intl/intl.dart';
import 'package:simple_moment/simple_moment.dart';
import 'package:twaslna_dashboard/abstracts/states/state.dart';
import 'package:flutter/material.dart';
import 'package:twaslna_dashboard/module_orders/model/order_model.dart';
import 'package:twaslna_dashboard/module_orders/ui/screen/OngoingOrdersScreen.dart';
import 'package:twaslna_dashboard/module_orders/ui/widget/my_orders/order_card.dart';
import 'package:twaslna_dashboard/utils/components/fixed_container.dart';

class OnGoingOrdersLoadedState extends States {
  OnGoingOrdersScreenState screenState;
  List<OrderModel> orders;

  OnGoingOrdersLoadedState(this.screenState, this.orders) : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return screenState.getOrders();
      },
      child: FixedContainer(child:ListView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: ListView(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: getOrders(orders),
            ),
          ),
          SizedBox(
            height: 75,
          ),
        ],
      )),
    );
  }

  List<Widget> getOrders(List<OrderModel> orders) {
    if (orders.isEmpty) return [];
    List<OrderCard> ordersCard = [];
    orders.forEach((element) {
      ordersCard.add(OrderCard(
        orderId: element.orderId,
        orderCost: element.orderCost.toString(),
        orderStatus: element.orderStatus,
        orderDate: DateFormat.jm().format(element.dateTime) + '   ' + DateFormat.yMd().format(element.dateTime),
      ));
    });
    return ordersCard;
  }
}

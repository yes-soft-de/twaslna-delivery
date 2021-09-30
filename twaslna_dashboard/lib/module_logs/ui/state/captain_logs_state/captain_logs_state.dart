import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:twaslna_dashboard/abstracts/states/state.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/module_captain/model/balance_model.dart';
import 'package:twaslna_dashboard/module_captain/ui/screen/captain_balance_screen.dart';
import 'package:twaslna_dashboard/module_logs/model/captain_logs_model.dart';
import 'package:twaslna_dashboard/module_logs/ui/screen/captain_logs_screen.dart';
import 'package:twaslna_dashboard/module_orders/ui/widget/my_orders/order_card.dart';
import 'package:twaslna_dashboard/utils/components/custom_list_view.dart';
import 'package:twaslna_dashboard/utils/components/empty_screen.dart';
import 'package:twaslna_dashboard/utils/components/error_screen.dart';
import 'package:twaslna_dashboard/utils/components/fixed_container.dart';
import 'package:twaslna_dashboard/utils/effect/hidder.dart';
import 'package:twaslna_dashboard/utils/effect/scaling.dart';

class CaptainLogsLoadedState extends States {
  final CaptainLogsScreenState screenState;
  final List<String>? error;
  final bool empty;
  final List<CaptainLogsModel>? captainBalance;

  CaptainLogsLoadedState(this.screenState, this.captainBalance,
      {this.empty = false, this.error})
      : super(screenState) {
    if (error != null) {
      screenState.refresh();
    }
  }

  int currentIndex = 0;

  @override
  Widget getUI(BuildContext context) {
    if (error != null) {
      return ErrorStateWidget(
        onRefresh: () {
          screenState.getCaptain();
        },
        errors: error,
      );
    } else if (empty) {
      return EmptyStateWidget(
          empty: S.current.emptyStaff,
          onRefresh: () {
            screenState.getCaptain();
          });
    }
    return FixedContainer(
        child: ListView(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: ListView(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            children: getOrders(captainBalance),
          ),
        ),
        SizedBox(
          height: 75,
        ),
      ],
    ));
  }

  List<Widget> getOrders(List<CaptainLogsModel>? orders) {
    if (orders == null) return[];
    if (orders.isEmpty) return [];
    List<OrderCard> ordersCard = [];
    orders.forEach((element) {
      ordersCard.add(OrderCard(
        orderId: element.orderNumber,
        orderCost: element.orderCost.toString(),
        orderStatus: element.state,
        orderDate: DateFormat.jm().format(element.deliveryDate) +
            '   ' +
            DateFormat.yMd().format(element.deliveryDate),
      ));
    });
    return ordersCard;
  }
}

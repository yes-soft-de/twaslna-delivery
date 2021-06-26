import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_orders/ui/screen/my_orders_screen.dart';
import 'package:twaslna_delivery/module_orders/ui/state/my_orders/my_orders_state.dart';
import 'package:flutter/material.dart';
import 'package:twaslna_delivery/module_orders/ui/widget/my_orders/my_orders_app_bar.dart';
import 'package:twaslna_delivery/module_orders/ui/widget/my_orders/order_card.dart';
import 'package:twaslna_delivery/utils/components/costom_search.dart';
import 'package:twaslna_delivery/utils/text_style/text_style.dart';

class MyOrdersLoadedState extends MyOrdersState {
  MyOrdersScreenState screenState;

  MyOrdersLoadedState(this.screenState) : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height,
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset('assets/images/delivery_splash.png',fit: BoxFit.cover,height: 525,
                width: 2500,
                alignment: Alignment.bottomRight,
                ))),
        Container(
          color: Theme.of(context).cardColor.withOpacity(0.90),
          child: ListView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [
              MyOrdersAppBar(),
              Padding(
                padding: const EdgeInsets.only(right:10.0,left:10,),
                child: ListTile(
                  leading: FaIcon(FontAwesomeIcons.sortAmountDown,color: Theme.of(context).primaryColor,size: 18,),
                  title: Text(
                    S.of(context).sortByEarlier,
                    style: StyleText.categoryStyle,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return OrderCard(
                        orderId: index,
                      );
                    }),
              ),
              SizedBox(
                height: 75,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

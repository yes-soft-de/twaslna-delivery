import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:twaslna_delivery/module_my_notifications/ui/screen/my_notifications_screen.dart';
import 'package:twaslna_delivery/module_my_notifications/ui/widget/my_notifications/my_notifications_app_bar.dart';
import 'package:twaslna_delivery/module_orders/ui/widget/my_orders/order_card.dart';
import 'package:twaslna_delivery/utils/text_style/text_style.dart';
import 'my_notifications_state.dart';

class MyNotificationsLoadedState extends MyNotificationsState {
  MyNotificationsScreenState screenState;

  MyNotificationsLoadedState(this.screenState) : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: ListView(
        physics:
        BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: [
          MyNotificationsAppBar(),
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
                  return Padding(padding: EdgeInsets.only(top:8,bottom: 8),
                  child: ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).backgroundColor
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.notifications),
                      ),
                    ),
                    title: Text('مراحب مراحب يا باتمان'),
                    subtitle: Text('معاك روبن يا صاح'),
                    trailing:Container(
                        height: double.maxFinite,
                        child: Padding(
                          padding: const EdgeInsets.only(top:14.0),
                          child: Text('7:00 م'),
                        )),
                  ),
                  );
                }),
          ),
          SizedBox(
            height: 75,
          ),
        ],
      ),
    );
  }
}

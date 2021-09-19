import 'package:flutter/material.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/global_nav_key.dart';
import 'package:twaslna_dashboard/utils/components/custom_list_view.dart';
import 'package:twaslna_dashboard/utils/customIcon/custom_icons.dart';

class NavigatorMenu extends StatefulWidget {
  final Function(int) onTap;
  final int currentIndex;

  NavigatorMenu({required this.onTap, required this.currentIndex});

  @override
  _NavigatorMenuState createState() => _NavigatorMenuState();
}

class _NavigatorMenuState extends State<NavigatorMenu> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var drawerHeader = SizedBox(
      height: 150,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 75,
              width: 75,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(left: 12.5),
                  child: Icon(
                    CustomIcon.logo,
                    size: 50,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Twaslna Dashboard',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
    return Drawer(
        child: Container(
      color: Theme.of(context).primaryColor,
      child: CustomListView.custom(children: [
        drawerHeader,
        Divider(
          thickness: 1,
          color: Theme.of(context).backgroundColor.withOpacity(0.7),
        ),
        customListTile(0, S.current.home, Icons.home_rounded),
        Theme(
          data: Theme.of(context).copyWith(brightness: Brightness.dark),
          child: ExpansionTile(
            initiallyExpanded:
                widget.currentIndex == 1 || widget.currentIndex == 2,
            leading: Icon(
              Icons.store,
              color: Colors.white,
            ),
            collapsedIconColor: Colors.white,
            title: Text(
              S.current.stores,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            children: <Widget>[
              customListTile(
                  1, S.current.storeCategories, Icons.add_business_rounded),
              customListTile(2, S.current.storesList, Icons.storefront_rounded),
            ],
          ),
        ),
        Theme(
          data: Theme.of(context).copyWith(brightness: Brightness.dark),
          child: ExpansionTile(
            initiallyExpanded:
                widget.currentIndex == 4 || widget.currentIndex == 3 || widget.currentIndex == 8 ,
            leading: Icon(
              Icons.store,
              color: Colors.white,
            ),
            collapsedIconColor: Colors.white,
            title: Text(
              S.current.captain,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            children: <Widget>[
              customListTile(
                  3, S.current.captains, Icons.delivery_dining_rounded),
              customListTile(
                  4, S.current.inActiveCaptains, Icons.delivery_dining_rounded),
              customListTile(
                  8, S.current.captainPayments, Icons.delivery_dining_rounded),
            ],
          ),
        ),
        Theme(
          data: Theme.of(context).copyWith(brightness: Brightness.dark),
          child: ExpansionTile(
            initiallyExpanded:
            widget.currentIndex == 10 || widget.currentIndex == 9 ,
            leading: Icon(
              Icons.list,
              color: Colors.white,
            ),
            collapsedIconColor: Colors.white,
            title: Text(
              S.current.orders,
              style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            children: <Widget>[
              customListTile(
                  9, S.current.orderPending, Icons.timer),
              customListTile(
                  10, S.current.orders, Icons.filter_list_rounded),
            ],
          ),
        ),
        Theme(
          data: Theme.of(context).copyWith(brightness: Brightness.dark),
          child: ExpansionTile(
            initiallyExpanded:
            widget.currentIndex == 5 || widget.currentIndex == 11 ,
            leading: Icon(
              Icons.info,
              color: Colors.white,
            ),
            collapsedIconColor: Colors.white,
            title: Text(
              S.current.companyInfo,
              style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            children: <Widget>[
              customListTile(5, S.current.companyInfo, Icons.info),
              customListTile(
                  11, S.current.companyFinance, Icons.account_balance_wallet_rounded),
            ],
          ),
        ),

        customListTile(6, S.current.settings, Icons.settings_rounded),
      ]),
    ));
  }

  Widget customListTile(int index, String title, IconData icon) {
    bool selected = index == widget.currentIndex;
    return InkWell(
      onTap: () {
        widget.onTap(index);
        GlobalVariable.mainScreenScaffold.currentState?.openEndDrawer();
        setState(() {});
      },
      child: Container(
        color: selected
            ? Theme.of(context).backgroundColor.withOpacity(0.2)
            : null,
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.white,
          ),
          title: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

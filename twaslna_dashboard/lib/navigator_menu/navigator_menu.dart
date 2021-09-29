import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/global_nav_key.dart';
import 'package:twaslna_dashboard/utils/components/custom_list_view.dart';
import 'package:twaslna_dashboard/utils/customIcon/custom_icons.dart';

class NavigatorMenu extends StatefulWidget {
  final Function(int) onTap;
  final int currentIndex;
  final double? width;
  NavigatorMenu({this.width,required this.onTap, required this.currentIndex});

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
                backgroundColor: Theme.of(context).primaryColor,
                child: Padding(
                  padding: EdgeInsets.only(left: 12.5),
                  child: Icon(
                    CustomIcon.logo,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              S.current.twaslnaDashboard,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
    return Container(
        width: widget.width,
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: Localizations.localeOf(context).languageCode == 'ar'
                ? BorderRadius.horizontal(left: Radius.circular(25))
                : BorderRadius.horizontal(right: Radius.circular(25))),
        child: CustomListView.custom(children: [
          drawerHeader,
          Divider(
            thickness: 2.5,
            color: Theme.of(context).backgroundColor,
          ),
          customListTile(0, S.current.home, FontAwesomeIcons.home),
          // Store
          customExpansionTile(
              title: S.current.stores,
              icon: FontAwesomeIcons.store,
              children: [
                customListTile(
                    1, S.current.storeCategories, Icons.category_rounded,true),
                customListTile(
                    2, S.current.storesList, Icons.storefront_rounded,true),
              ],
              index: widget.currentIndex),
          // Captains
          customExpansionTile(
              title: S.current.captains,
              icon: FontAwesomeIcons.car,
              children: [
                customListTile(
                    3, S.current.captains, FontAwesomeIcons.solidListAlt,true),
                customListTile(
                    4, S.current.inActiveCaptains, FontAwesomeIcons.solidAddressCard,true),
                customListTile(
                    8, S.current.captainPayments, FontAwesomeIcons.solidCreditCard,true),
              ],
              index: widget.currentIndex),
          // Orders
          customExpansionTile(
              title: S.current.orders,
              icon: FontAwesomeIcons.box,
              children: [
                customListTile(9, S.current.orderPending, FontAwesomeIcons.solidClock,true),
                customListTile(10, S.current.ongoingOrders, FontAwesomeIcons.play,true),
                customListTile(12, S.current.ordersAccount, FontAwesomeIcons.cashRegister,true),
              ],
              index: widget.currentIndex),
          customExpansionTile(
              title: S.current.company,
              icon: FontAwesomeIcons.solidCopyright,
              children: [
                customListTile(11, S.current.companyFinance, FontAwesomeIcons.moneyCheckAlt,true),
                customListTile(5, S.current.companyInfo, Icons.info,true),
              ],
              index: widget.currentIndex),
          customExpansionTile(
              title: S.current.Logs,
              icon: FontAwesomeIcons.solidFlag,
              children: [
                customListTile(13, S.current.captainLogs, FontAwesomeIcons.history,true),
              ],
              index: widget.currentIndex),
          customListTile(6, S.current.settings, FontAwesomeIcons.cog),
        ]));
  }

  Widget customListTile(int index, String title, IconData icon,[bool subtitle = false]) {
    bool selected = index == widget.currentIndex;
    double? size = icon.fontPackage == 'font_awesome_flutter' ? (subtitle ? 18 : 22) : 26;
    if (size == 26 && subtitle){
      size = 20;
    }

    return InkWell(
      key: ValueKey(index),
      onTap: () {
        widget.onTap(index);
        GlobalVariable.mainScreenScaffold.currentState?.openEndDrawer();
        setState(() {});
      },
      child: Padding(
        padding:  EdgeInsets.only(left:subtitle ? 16.0 : 8.0,right:subtitle ? 16 :8.0),
        child: Container(
          decoration: BoxDecoration(
              color: selected ? Theme.of(context).primaryColor : null,
              borderRadius: BorderRadius.circular(25)),
          child: ListTile(
            minLeadingWidth:subtitle?4:null,
            visualDensity: VisualDensity(
             vertical: -2
            ),
            leading: Icon(
              icon,
              color: selected ? Colors.white : null,
              size: size
            ),
            title: Text(
              title,
              style: TextStyle(
                color: selected ? Colors.white : null,
                fontSize:subtitle ?  14 : null
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget customExpansionTile(
      {required int index,
      required String title,
      required IconData icon,
      required List<Widget> children}) {
    bool extended = false;
    for (var i in children) {
      if (i.key.toString() == '[<$index>]') {
        extended = true;
        break;
      }
    }
    double? size = icon.fontPackage == 'font_awesome_flutter' ? 22 : 26;

    return Padding(
      padding: const EdgeInsets.only(left:8.0,right: 8.0),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: extended,
          title: Text(title),
          leading: Icon(icon,size: size,),
          children: children,
        ),
      ),
    );
  }
}

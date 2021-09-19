import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/global_nav_key.dart';
import 'package:twaslna_dashboard/module_captain/ui/screen/captain_balance_screen.dart';
import 'package:twaslna_dashboard/module_captain/ui/screen/captains_list_screen.dart';
import 'package:twaslna_dashboard/module_captain/ui/screen/catpains_payment_screen.dart';
import 'package:twaslna_dashboard/module_captain/ui/screen/in_active_captains_screen.dart';
import 'package:twaslna_dashboard/module_categories/ui/screen/store_categories_screen.dart';
import 'package:twaslna_dashboard/module_company/ui/screen/company_finance_screen.dart';
import 'package:twaslna_dashboard/module_company/ui/screen/company_profile_screen.dart';
import 'package:twaslna_dashboard/module_main/sceen/home_screen.dart';
import 'package:twaslna_dashboard/module_orders/ui/screen/OngoingOrdersScreen.dart';
import 'package:twaslna_dashboard/module_orders/ui/screen/my_orders_screen.dart';
import 'package:twaslna_dashboard/module_settings/ui/settings_page/settings_page.dart';
import 'package:twaslna_dashboard/module_stores/ui/screen/stores_screen.dart';
import 'package:twaslna_dashboard/navigator_menu/navigator_menu.dart';

@injectable
class MainScreen extends StatefulWidget {
  final HomeScreen _homeScreen;
  final StoreCategoriesScreen _storeCategoriesScreen;
  final StoresScreen _storesScreen;
  final InActiveCaptainsScreen _inActiveCaptainsScreen;
  final SettingsScreen _settingsScreen;
  final CompanyProfileScreen _companyProfileScreen;
  final CaptainsScreen _captainsScreen;
  final CaptainBalanceScreen _captainBalanceScreen;
  final CaptainsPaymentsScreen _captainsPaymentsScreen;
  final OrdersScreen _myOrdersScreen;
  final OnGoingOrdersScreen _onGoingOrdersScreen;
  final CompanyFinanceScreen _companyFinanceScreen;
  final List<Widget> pages = [];

  MainScreen(
      this._homeScreen,
      this._storeCategoriesScreen,
      this._captainsScreen,
      this._inActiveCaptainsScreen,
      this._storesScreen,
      this._settingsScreen,
      this._companyProfileScreen,
      this._captainBalanceScreen,
      this._captainsPaymentsScreen,
      this._myOrdersScreen,
      this._onGoingOrdersScreen,
      this._companyFinanceScreen
      ) {
    pages.add(_homeScreen);
    pages.add(_storeCategoriesScreen);
    pages.add(_storesScreen);
    pages.add(_captainsScreen);
    pages.add(_inActiveCaptainsScreen);
    pages.add(_companyProfileScreen);
    pages.add(_settingsScreen);
    pages.add(_captainBalanceScreen);
    pages.add(_captainsPaymentsScreen);
    pages.add(_myOrdersScreen);
    pages.add(_onGoingOrdersScreen);
    pages.add(_companyFinanceScreen);
  }

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedPage = 0;
  late List<Widget> currentPage;

  @override
  void initState() {
    currentPage = widget.pages;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: GlobalVariable.mainScreenScaffold,
      drawer: Container(
        color: Theme.of(context).primaryColor,
        child: NavigatorMenu(
          currentIndex: selectedPage,
          onTap: (index) {
            selectedPage = index;
            setState(() {});
          },
        ),
      ),
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 50),
        child: currentPage[selectedPage],
      ),
    );
  }
}

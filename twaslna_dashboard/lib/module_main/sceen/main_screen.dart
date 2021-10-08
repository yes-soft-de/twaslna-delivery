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
import 'package:twaslna_dashboard/module_filters/ui/screen/captain_filter_screen.dart';
import 'package:twaslna_dashboard/module_filters/ui/screen/store_filter_screen.dart';
import 'package:twaslna_dashboard/module_main/sceen/home_screen.dart';
import 'package:twaslna_dashboard/module_orders/ui/screen/OngoingOrdersScreen.dart';
import 'package:twaslna_dashboard/module_orders/ui/screen/my_orders_screen.dart';
import 'package:twaslna_dashboard/module_orders/ui/screen/order_accounts_screen.dart';
import 'package:twaslna_dashboard/module_orders/ui/screen/orders_without_pending_screen.dart';
import 'package:twaslna_dashboard/module_reports/ui/screen/captains_reports_screen.dart';
import 'package:twaslna_dashboard/module_reports/ui/screen/clients_reports_screen.dart';
import 'package:twaslna_dashboard/module_reports/ui/screen/products_reports_screen.dart';
import 'package:twaslna_dashboard/module_reports/ui/screen/stores_reports_screen.dart';
import 'package:twaslna_dashboard/module_settings/ui/settings_page/settings_page.dart';
import 'package:twaslna_dashboard/module_stores/ui/screen/stores_screen.dart';
import 'package:twaslna_dashboard/navigator_menu/navigator_menu.dart';
import 'package:twaslna_dashboard/utils/global/screen_type.dart';

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
  final OrdersAccountScreen _ordersAccountScreen;
  final CaptainFilterScreen _captainFilterScreen;
  final StoresFilterScreen _storesFilterScreen;
  final OrdersWithoutPendingScreen _ordersWithoutPendingScreen;
  final StoresReportScreen _storesReportScreen;
  final ProductsReportScreen _productsReportScreen;
  final ClientsReportScreen _clientsReportScreen;
  final CaptainsReportScreen _captainsReportScreen;

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
      this._companyFinanceScreen,
      this._ordersAccountScreen,
      this._captainFilterScreen,
      this._storesFilterScreen,
      this._ordersWithoutPendingScreen,
      this._clientsReportScreen,
      this._captainsReportScreen,
      this._productsReportScreen,
      this._storesReportScreen
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
    pages.add(_ordersAccountScreen);
    pages.add(_captainFilterScreen);
    pages.add(_storesFilterScreen);
    pages.add(_ordersWithoutPendingScreen);
    pages.add(_clientsReportScreen);
    pages.add(_captainsReportScreen);
    pages.add(_productsReportScreen);
    pages.add(_storesReportScreen);

  }

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with WidgetsBindingObserver{
  int selectedPage = 0;
  late List<Widget> currentPage;

  @override
  void initState() {
    currentPage = widget.pages;
    super.initState();
  }
  @override
  void didChangeMetrics() {
setState(() {

});
  }

  @override
  Widget build(BuildContext context) {
    print(ScreenType.getCurrentScreenType());
    if (ScreenType.isDesktop()) {
      return Scaffold(
        body: Row(
          children: [
            NavigatorMenu(
              width: 300,
              currentIndex: selectedPage,
              onTap: (index) {
                selectedPage = index;
                setState(() {});
              },
            ),
            Expanded(
              child: Scaffold(
                body: AnimatedSwitcher(
                  duration: Duration(milliseconds: 50),
                  child: currentPage[selectedPage],
                ),
              ),
            )
          ],
        ),
      );
    }
    return Scaffold(
      key: GlobalVariable.mainScreenScaffold,
      drawer: NavigatorMenu(
        width:ScreenType.isTablet() ? MediaQuery.of(context).size.width * 0.4 : MediaQuery.of(context).size.width * 0.75,
        currentIndex: selectedPage,
        onTap: (index) {
          selectedPage = index;
          setState(() {});
        },
      ),
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 50),
        child: currentPage[selectedPage],
      ),
    );
  }
}

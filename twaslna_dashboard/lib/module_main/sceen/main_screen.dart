import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/global_nav_key.dart';
import 'package:twaslna_dashboard/module_main/sceen/home_screen.dart';
import 'package:twaslna_dashboard/navigator_menu/navigator_menu.dart';
import 'package:twaslna_dashboard/utils/global/screen_type.dart';

@injectable
class MainScreen extends StatefulWidget {
 final HomeScreen _homeScreen;

 MainScreen(this._homeScreen);

 @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with WidgetsBindingObserver{
 late StatefulWidget selectedPage;
  @override
  void initState() {
    selectedPage = widget._homeScreen;

    super.initState();
  }
  @override
  void didChangeMetrics() {
setState(() {

});
  }

  @override
  Widget build(BuildContext context) {
    if (ScreenType.isDesktop()) {
      return Scaffold(
        body: Row(
          children: [
            NavigatorMenu(
              width: 300,
              currentPage: selectedPage,
              onTap: (selectedClass) {
                selectedPage = selectedClass;
                setState(() {});
              },
            ),
            Expanded(
              child: Scaffold(
                body: AnimatedSwitcher(
                  duration: Duration(milliseconds: 50),
                  child: selectedPage,
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
        currentPage: selectedPage,
        onTap: (selectedClass) {
          selectedPage = selectedClass;
          setState(() {});
        },
      ),
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 50),
        child: selectedPage,
      ),
    );
  }
}

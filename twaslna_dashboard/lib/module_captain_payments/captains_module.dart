import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/abstracts/module/yes_module.dart';
import 'package:twaslna_dashboard/module_captain/captains_routes.dart';
import 'package:twaslna_dashboard/module_captain/ui/screen/captain_balance_screen.dart';
import 'package:twaslna_dashboard/module_captain/ui/screen/captain_profile_screen.dart';
import 'package:twaslna_dashboard/module_captain/ui/screen/catpains_payment_screen.dart';
import 'package:twaslna_dashboard/module_captain/ui/screen/in_active_captains_screen.dart';

@injectable
class CaptainsModule extends YesModule {
  final InActiveCaptainsScreen _inActiveCaptains;
  final CaptainProfileScreen _captainProfileScreen;
  final CaptainBalanceScreen _captainBalanceScreen;
  final CaptainsPaymentsScreen _captainsPaymentsScreen;
  CaptainsModule(this._inActiveCaptains,this._captainProfileScreen,this._captainBalanceScreen,this._captainsPaymentsScreen){
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      CaptainsRoutes.IN_ACTIVE_CAPTAINS: (context) => _inActiveCaptains,
      CaptainsRoutes.CAPTAIN_PROFILE: (context) => _captainProfileScreen,
      CaptainsRoutes.CAPTAIN_BALANCE: (context) => _captainBalanceScreen,
      CaptainsRoutes.CAPTAIN_UNFINISHED: (context) => _captainsPaymentsScreen,
    };
  }
}
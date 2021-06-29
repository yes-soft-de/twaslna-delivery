import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/abstracts/module/yes_module.dart';
import 'package:twaslna_delivery/module_account/account_routes.dart';
import 'package:twaslna_delivery/module_account/ui/screen/account_screen.dart';
@injectable
class AccountModule extends YesModule {
  final AccountScreen _accountScreen;

  AccountModule(this._accountScreen) {
    YesModule.RoutesMap.addAll(getRoutes());
  }

  Map<String, WidgetBuilder> getRoutes() {
    return {AccountRoutes.ACCOUNT: (context) => _accountScreen};
  }
}

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_captain/abstracts/module/yes_module.dart';
import 'package:twaslna_captain/module_about/about_routes.dart';
import 'package:twaslna_captain/module_about/ui/screen/about_screen/about_screen.dart';


@injectable
class AboutModule extends YesModule {
  final AboutScreen _aboutScreen;
  AboutModule(this._aboutScreen) {
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      AboutRoutes.ROUTE_ABOUT: (context) => _aboutScreen,
    };
  }
}
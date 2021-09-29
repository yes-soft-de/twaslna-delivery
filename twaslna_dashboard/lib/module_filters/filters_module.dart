import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/abstracts/module/yes_module.dart';
import 'package:twaslna_dashboard/module_filters/filters_routes.dart';
import 'package:twaslna_dashboard/module_filters/ui/screen/captain_filter_screen.dart';

@injectable
class FiltersModule extends YesModule {
  final CaptainFilterScreen _captainFilterScreen;
  FiltersModule(this._captainFilterScreen){
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      FiltersRoutes.CAPTAIN_FILTERS : (context) => _captainFilterScreen,
    };
  }
}
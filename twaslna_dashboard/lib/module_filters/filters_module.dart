import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/abstracts/module/yes_module.dart';
import 'package:twaslna_dashboard/module_filters/filters_routes.dart';
import 'package:twaslna_dashboard/module_filters/ui/screen/captain_filter_screen.dart';
import 'package:twaslna_dashboard/module_filters/ui/screen/store_filter_screen.dart';

@injectable
class FiltersModule extends YesModule {
  final CaptainFilterScreen captainFilterScreen;
  final StoresFilterScreen storesFilterScreen;
  FiltersModule(this.captainFilterScreen,this.storesFilterScreen){
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      FiltersRoutes.CAPTAIN_FILTERS : (context) => captainFilterScreen,
      FiltersRoutes.STORE_FILTERS : (context) => storesFilterScreen
    };
  }
}
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/abstracts/module/yes_module.dart';

import 'package:twaslna_dashboard/module_categories/ui/screen/store_categories_screen.dart';
import 'package:twaslna_dashboard/module_stores/stores_routes.dart';
import 'package:twaslna_dashboard/module_stores/ui/screen/store_info_screen.dart';
import 'package:twaslna_dashboard/module_stores/ui/screen/stores_screen.dart';

@injectable
class StoresModule extends YesModule {
  final StoresScreen _storesScreen;
  final StoreInfoScreen _storeInfoScreen;
  StoresModule(this._storesScreen,this._storeInfoScreen){
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      StoresRoutes.STORES : (context) => _storesScreen,
      StoresRoutes.STORE_INFO : (context) => _storeInfoScreen
    };
  }
}
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/abstracts/module/yes_module.dart';
import 'package:twaslna_delivery/module_store_list/store_routes.dart';
import 'package:twaslna_delivery/module_store_list/ui/screen/store_list_screen.dart';
@injectable
class StoreModule extends YesModule {
  final StoreListScreen _storeListScreen;
  StoreModule(this._storeListScreen){
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
     StoreRoutes.STORE_LIST_SCREEN : (context) => _storeListScreen
    };
  }
}
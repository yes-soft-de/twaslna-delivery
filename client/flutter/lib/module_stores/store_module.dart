import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/abstracts/module/yes_module.dart';
import 'package:twaslna_delivery/module_stores/store_routes.dart';
import 'package:twaslna_delivery/module_stores/ui/screen/store_list_screen.dart';
import 'package:twaslna_delivery/module_stores/ui/screen/store_products_screen.dart';
@injectable
class StoreModule extends YesModule {
  final StoreListScreen _storeListScreen;
  final StoreProductsScreen _storeProductsScreen;
  StoreModule(this._storeListScreen,this._storeProductsScreen){
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
     StoreRoutes.STORE_LIST_SCREEN : (context) => _storeListScreen,
      StoreRoutes.STORE_PRODUCTS : (context) => _storeProductsScreen
    };
  }
}
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/abstracts/module/yes_module.dart';
import 'package:twaslna_dashboard/module_categories/categories_routes.dart';
import 'package:twaslna_dashboard/module_categories/ui/screen/product_categories_screen.dart';
import 'package:twaslna_dashboard/module_categories/ui/screen/store_products_screen.dart';
import 'package:twaslna_dashboard/module_categories/ui/screen/store_categories_screen.dart';

@injectable
class CategoriesModule extends YesModule {
  final StoreCategoriesScreen _storeCategoriesScreen;
  final ProductCategoriesScreen _productCategoriesScreen;
  final StoreProductScreen _productStoreCategoriesScreen;
  CategoriesModule(this._storeCategoriesScreen,this._productCategoriesScreen,this._productStoreCategoriesScreen){
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      CategoriesRoutes.STORE_CATEGORIES : (context) => _storeCategoriesScreen,
      CategoriesRoutes.PRODUCT_CATEGORIES : (context) => _productCategoriesScreen,
      CategoriesRoutes.PRODUCT_STORE_CATEGORIES : (context) => _productStoreCategoriesScreen
    };
  }
}
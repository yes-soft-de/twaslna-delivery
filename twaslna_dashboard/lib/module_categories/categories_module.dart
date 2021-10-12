import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/abstracts/module/yes_module.dart';
import 'package:twaslna_dashboard/module_categories/categories_routes.dart';
import 'package:twaslna_dashboard/module_categories/ui/screen/product_categories_screen.dart';
import 'package:twaslna_dashboard/module_categories/ui/screen/store_products_screen.dart';
import 'package:twaslna_dashboard/module_categories/ui/screen/store_categories_screen.dart';

@injectable
class CategoriesModule extends YesModule {
  final StoreCategoriesScreen storeCategoriesScreen;
  final ProductCategoriesScreen productCategoriesScreen;
  final StoreProductScreen productStoreCategoriesScreen;
  CategoriesModule(this.storeCategoriesScreen,this.productCategoriesScreen,this.productStoreCategoriesScreen){
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      CategoriesRoutes.STORE_CATEGORIES : (context) => storeCategoriesScreen,
      CategoriesRoutes.PRODUCT_CATEGORIES : (context) => productCategoriesScreen,
      CategoriesRoutes.PRODUCT_STORE_CATEGORIES : (context) => productStoreCategoriesScreen
    };
  }
}
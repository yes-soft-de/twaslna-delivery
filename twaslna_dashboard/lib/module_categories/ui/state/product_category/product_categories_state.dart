
import 'package:flutter/material.dart';
import 'package:twaslna_dashboard/module_categories/ui/screen/product_categories_screen.dart';

abstract class ProductCategoriesState {
  final ProductCategoriesScreenState state;

  ProductCategoriesState(this.state);
  Widget getUI(BuildContext context);
}
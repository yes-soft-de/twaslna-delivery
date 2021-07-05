import 'package:flutter/material.dart';
import 'package:twaslna_delivery/module_stores/ui/screen/store_products_screen.dart';
import 'package:twaslna_delivery/module_stores/ui/state/store_products/store_products_state.dart';

class StoreProductsErrorState extends StoreProductsState {
  final String error;
  StoreProductsScreenState screenState;

  StoreProductsErrorState(this.screenState, this.error) : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(child: Text(error));
  }
}

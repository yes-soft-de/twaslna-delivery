import 'package:flutter/material.dart';
import 'package:twaslna_delivery/module_store_list/ui/screen/store_list_screen.dart';
import 'package:twaslna_delivery/module_store_list/ui/state/store_list_state.dart';

class StoreListLoadingState extends StoreListState {
  StoreListLoadingState(StoreListScreenState screenState) : super(screenState);
  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
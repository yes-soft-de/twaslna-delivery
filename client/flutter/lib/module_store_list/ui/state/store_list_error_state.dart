import 'package:flutter/material.dart';
import 'package:twaslna_delivery/module_store_list/ui/screen/store_list_screen.dart';
import 'package:twaslna_delivery/module_store_list/ui/state/store_list_state.dart';

class StoreListErrorState extends StoreListState {
  final String error;
  StoreListScreenState screenState;

  StoreListErrorState(this.screenState, this.error) : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(child: Text(error));
  }
}

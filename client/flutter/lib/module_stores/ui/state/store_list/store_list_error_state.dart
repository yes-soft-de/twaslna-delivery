import 'package:flutter/material.dart';
import 'package:twaslna_delivery/module_stores/ui/screen/store_list_screen.dart';
import 'package:twaslna_delivery/module_stores/ui/state/store_list/store_list_state.dart';

class StoreListErrorState extends StoreListState {
  final String error;
  StoreListScreenState screenState;

  StoreListErrorState(this.screenState, this.error) : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(child: Text(error));
  }
}

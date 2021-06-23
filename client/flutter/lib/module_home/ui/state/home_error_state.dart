import 'package:twaslna_delivery/module_home/ui/screen/home_screen.dart';
import 'package:twaslna_delivery/module_home/ui/state/home_state.dart';
import 'package:flutter/material.dart';

class HomeErrorState extends HomeState {
  final String error;
  HomeScreenState screenState;

  HomeErrorState(this.screenState, this.error) : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(child: Text(error));
  }
}

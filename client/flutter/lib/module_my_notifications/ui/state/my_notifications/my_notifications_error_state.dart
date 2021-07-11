import 'package:flutter/material.dart';
import 'package:twaslna_delivery/module_my_notifications/ui/screen/my_notifications_screen.dart';

import 'my_notifications_state.dart';



class MyNotificationsErrorState extends MyNotificationsState {
  final String error;
  MyNotificationsScreenState screenState;

  MyNotificationsErrorState(this.screenState, this.error) : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Center(child: Text(error));
  }
}

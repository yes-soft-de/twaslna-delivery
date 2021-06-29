import 'package:flutter/material.dart';
import 'package:twaslna_delivery/module_my_notifications/ui/screen/my_notifications_screen.dart';

abstract class MyNotificationsState {
  final MyNotificationsScreenState myNotificationsScreenState;

  MyNotificationsState(this.myNotificationsScreenState);

  Widget getUI(BuildContext context);
}

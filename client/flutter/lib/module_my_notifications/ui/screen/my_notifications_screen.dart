import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_my_notifications/ui/state/my_notifications/my_notifications_loaded_state.dart';
import 'package:twaslna_delivery/module_my_notifications/ui/state/my_notifications/my_notifications_state.dart';

@injectable
class MyNotificationsScreen extends StatefulWidget {

  MyNotificationsScreen();

  @override
  MyNotificationsScreenState createState() => MyNotificationsScreenState();
}

class MyNotificationsScreenState extends State<MyNotificationsScreen> {
  late MyNotificationsState currentState;

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    currentState = MyNotificationsLoadedState(this);
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        var focus = FocusScope.of(context);
        if (focus.canRequestFocus){
          focus.unfocus();
        }
      },
      child: Scaffold(
        body: currentState.getUI(context),
      ),
    );
  }
}

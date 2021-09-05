import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class NotificationsPrefsHelper {
  var box = Hive.box('Notification');

  void setIsActive(bool active) {
    box.put('captain_active', active);
  }

  bool? getIsActive() {
    return box.get('captain_active');
  }
  RemoteMessage getBackgroundMessage(){
    return box.get('BackgroundMessage');
  }
  void setBackgroundMessage(RemoteMessage message){

    box.put('BackgroundMessage',message);

  }
}

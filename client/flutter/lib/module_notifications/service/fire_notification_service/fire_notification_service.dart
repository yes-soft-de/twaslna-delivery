import 'dart:async';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/scheduler.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/abstracts/global_navigaror.dart';
import 'package:twaslna_delivery/module_notifications/preferences/notification_preferences/notification_preferences.dart';
import 'package:twaslna_delivery/module_notifications/repository/notification_repo.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:rxdart/subjects.dart';
import 'package:twaslna_delivery/utils/logger/logger.dart';
import 'package:flutter/material.dart';
@injectable
class FireNotificationService {
  final NotificationsPrefsHelper _prefsHelper;
  final NotificationRepo _notificationRepo;

  FireNotificationService(
    this._prefsHelper,
    this._notificationRepo,
  );

  static final PublishSubject<RemoteMessage> _onNotificationRecieved =
      PublishSubject();

  Stream get onNotificationStream => _onNotificationRecieved.stream;

  static StreamSubscription? iosSubscription;

  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future<void> init() async {
    await _fcm.requestPermission();
    await _fcm.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    var isActive = await _prefsHelper.getIsActive();
    await refreshNotificationToken();
  }

  Future<void> refreshNotificationToken() async {
    var token = await _fcm.getToken();
    if (token != null) {
      // And Subscribe to the changes
      try {
        _notificationRepo.postToken(token);
        FirebaseMessaging.onMessage.listen((RemoteMessage message) {
          Logger().info('FireNotificationService', 'onMessage: $message');
          SchedulerBinding.instance?.addPostFrameCallback((_) {
            Navigator.pushNamed(GlobalVariable.navState.currentContext!,
                message.data['navigate_route'].toString(),arguments:message.data['argument']);
          },);
        });
        FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
          _onNotificationRecieved.add(message);
        });
        FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
      } catch (e) {
       print(e);
      }

    }
  }
  static Future<dynamic> backgroundMessageHandler(
      RemoteMessage message) async {
    print('AppPushs myBackgroundMessageHandler : $message');
     NotificationsPrefsHelper().setBackgroundMessage(message);
    _onNotificationRecieved.add(message);
    return Future<void>.value();
  }
}

import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_my_notifications/service/my_notification_service.dart';

@injectable
class MyNotificationsStateManager {
  MyNotificationsService _myNotificationsService;

  MyNotificationsStateManager(this._myNotificationsService);
}

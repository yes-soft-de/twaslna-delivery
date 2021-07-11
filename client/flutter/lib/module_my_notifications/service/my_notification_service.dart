import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_my_notifications/manager/my_notifications_manager.dart';

@injectable
class MyNotificationsService {
MyNotificationsManager _myNotificationsManager;

MyNotificationsService(this._myNotificationsManager);
}

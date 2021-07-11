import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_my_notifications/repository/my_notifications_repository.dart';

@injectable
class MyNotificationsManager {
  MyNotificationsRepository _myNotificationsRepository;

  MyNotificationsManager(this._myNotificationsRepository);
}

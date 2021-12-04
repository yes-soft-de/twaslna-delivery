import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_my_notifications/manager/my_notifications_manager.dart';
import 'package:twaslna_delivery/module_my_notifications/notification_model.dart';
import 'package:twaslna_delivery/module_my_notifications/response/my_notification_response.dart';
import 'package:twaslna_delivery/module_orders/model/order_model.dart';
import 'package:twaslna_delivery/module_orders/response/my_orders_response.dart';
import 'package:twaslna_delivery/utils/helpers/status_code_helper.dart';

@injectable
class MyNotificationsService {
final MyNotificationsManager _myNotificationsManager;

MyNotificationsService(this._myNotificationsManager);


Future<NotificationModel> getNotification() async {
  MyNotificationResponse? _myNotificationResponse = await _myNotificationsManager.getNotification();
  if (_myNotificationResponse == null) {
    return NotificationModel.Error(S.current.networkError);
  }
  if (_myNotificationResponse.statusCode != '200') {
    return NotificationModel.Error(
        StatusCodeHelper.getStatusCodeMessages(_myNotificationResponse.statusCode));
  }
  if (_myNotificationResponse.data == null) return NotificationModel.Empty();
  return NotificationModel.Data(_myNotificationResponse);
}
}
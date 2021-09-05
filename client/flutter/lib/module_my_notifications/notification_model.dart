import 'package:intl/intl.dart';
import 'package:twaslna_delivery/consts/order_status.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_my_notifications/response/my_notification_response.dart';
import 'package:twaslna_delivery/module_orders/response/my_orders_response.dart';
import 'package:twaslna_delivery/utils/helpers/order_status_helper.dart';

class NotificationModel {
  String orderNumber = '-1';
  String body = S.current.orderDetails;
  String title = S.current.orderNumber;
  String? error;
  bool empty = false;
  List<NotificationModel> models = [];

  NotificationModel({required this.orderNumber,required this.title,required this.body});

  NotificationModel.Empty() {
    this.empty = true;
  }
  NotificationModel.Error(this.error);

  NotificationModel.Data(MyNotificationResponse orders) {
    var data = orders.data?.order;
    data?.forEach((element) {
      // String date = DateFormat('dd-MM-yyyy').format(DateTime.fromMillisecondsSinceEpoch(
      //     (element.deliveryDate?.timestamp ??
      //         DateTime.now().millisecondsSinceEpoch) *
      //         1000));
      models.add(NotificationModel(
        title: title + ' ' +element.orderNumber.toString(),
        orderNumber: element.orderNumber.toString(),
        body: body
      ));
    });
  }
  bool get hasError => error != null;

  bool get isEmpty => empty;

  List<NotificationModel> get data {
    return models;
  }

}
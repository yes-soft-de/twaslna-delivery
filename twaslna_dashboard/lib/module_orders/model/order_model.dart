import 'package:intl/intl.dart';
import 'package:twaslna_dashboard/abstracts/data_model/data_model.dart';
import 'package:twaslna_dashboard/consts/order_status.dart';
import 'package:twaslna_dashboard/module_orders/response/my_orders_response.dart';
import 'package:twaslna_dashboard/utils/helpers/order_status_helper.dart';

class OrderModel extends DataModel {
  late String orderDate;
  late String orderId;
  late OrderStatus orderStatus;
  late DateTime dateTime;
  late double orderCost;
  List<OrderModel> models = [];
  OrderModel({required this.orderDate,required this.orderId,required this.orderStatus,required this.orderCost,required this.dateTime});


  OrderModel.withData(MyOrdersResponse orders) {
    var data = orders.data;
    data?.forEach((element) {
      String date = DateFormat('dd-MM-yyyy').format(DateTime.fromMillisecondsSinceEpoch(
          (element.deliveryDate?.timestamp ??
              DateTime.now().millisecondsSinceEpoch) *
              1000));
      models.add(OrderModel(
          dateTime:DateTime.fromMillisecondsSinceEpoch(
              (element.deliveryDate?.timestamp ??
                  DateTime.now().millisecondsSinceEpoch) *
                  1000),
          orderDate:date,
          orderId: element.orderNumber ?? '-1',
          orderStatus: StatusHelper.getStatusEnum(element.state),
          orderCost: element.orderCost ?? 0));
    });
  }

  List<OrderModel> get data {
    models.sort((order1,order2){
      DateTime date1 = order1.dateTime;
      DateTime date2 = order2.dateTime;
      return date1.compareTo(date2);
    });
    return models.reversed.toList();
  }
}
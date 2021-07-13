import 'package:twaslna_delivery/consts/order_status.dart';

class OrderModel {
  String orderDate;
  String orderId;
  OrderStatus orderStatus;
  dynamic orderCost;

  OrderModel({required this.orderDate,required this.orderId,required this.orderStatus,required this.orderCost});
}
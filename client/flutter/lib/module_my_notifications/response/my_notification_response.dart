import 'package:twaslna_delivery/utils/logger/logger.dart';

class MyNotificationResponse {
  String? statusCode;
  String? msg;
  Data? data;

  MyNotificationResponse({
      this.statusCode, 
      this.msg, 
      this.data});

  MyNotificationResponse.fromJson(dynamic json) {
    try {
      statusCode = json['status_code'];
      msg = json['msg'];
      data = json['Data'] != null ? Data.fromJson(json['Data']) : null;
    }
    catch (e){
      Logger().error('Notification Response',e.toString(), StackTrace.current);
      statusCode = '-1';
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status_code'] = statusCode;
    map['msg'] = msg;
    if (data != null) {
      map['Data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  List<Order>? order;

  Data({
      this.order});

  Data.fromJson(dynamic json) {
    if (json['order'] != null) {
      order = [];
      json['order'].forEach((v) {
        order?.add(Order.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (order != null) {
      map['order'] = order?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Order {
  String? orderNumber;

  Order({
      this.orderNumber});

  Order.fromJson(dynamic json) {
    orderNumber = json['orderNumber'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['orderNumber'] = orderNumber;
    return map;
  }

}
import 'package:twaslna_delivery/utils/logger/logger.dart';

class StoreCategoryList {
  String? statusCode;
  String? msg;
  List<Data>? data;

  StoreCategoryList({this.statusCode, this.msg, this.data});

  StoreCategoryList.fromJson(dynamic json) {
    try {
      statusCode = json['status_code'];
      msg = json['msg'];
      if (json['Data'] != null) {
        data = [];
        json['Data'].forEach((v) {
          data?.add(Data.fromJson(v));
        });
      }
    } catch (e) {
      Logger().error(
          'store category response', '${e.toString()}', StackTrace.current);
      statusCode = '-1';
    }
  }
}

class Data {
  int? id;
  String? storeOwnerName;
  String? image;
  dynamic phone;
  dynamic location;
  double? deliveryCost;
  bool? privateOrders;
  bool? hasProducts;

  Data(
      {this.id,
      this.storeOwnerName,
      this.image,
      this.phone,
      this.location,
      this.deliveryCost,
      this.privateOrders,
      this.hasProducts});

  Data.fromJson(dynamic json) {
    id = json['id'];
    storeOwnerName = json['storeOwnerName'];
    image = json['image'];
    phone = json['phone'];
    location = json['location'];
    deliveryCost = json['deliveryCost']?.toDouble();
    privateOrders = json['privateOrders'];
    hasProducts = json['hasProducts'];
  }
}

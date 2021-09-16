import 'package:twaslna_dashboard/utils/logger/logger.dart';

class StoresResponse {
  String? statusCode;
  String? msg;
  List<Data>? data;

  StoresResponse({this.statusCode, this.msg, this.data});

  StoresResponse.fromJson(dynamic json) {
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
      Logger().error('stores response', '${e.toString()}', StackTrace.current);
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
  num? categoryId;

  Data(
      {this.id,
      this.storeOwnerName,
      this.image,
      this.phone,
      this.location,
      this.deliveryCost,
      this.privateOrders,
      this.hasProducts,
      this.categoryId});

  Data.fromJson(dynamic json) {
    id = json['id'];
    storeOwnerName = json['storeOwnerName'];
    categoryId = json['storeCategoryId'];
    image = json['image'];
    phone = json['phone'];
    location = json['location'];
    deliveryCost = json['deliveryCost']?.toDouble();
    privateOrders = json['privateOrders'];
    hasProducts = json['hasProducts'];
  }
}

class GeoJson {
  num? lat;
  num? long;

  GeoJson({this.lat, this.long});

  GeoJson.fromJson(dynamic json) {
    lat = json['lat'];
    long = json['lon'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};

    data['lat'] = lat;
    data['lon'] = long;

    return data;
  }
}

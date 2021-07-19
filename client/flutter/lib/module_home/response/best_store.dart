import 'package:twaslna_delivery/utils/logger/logger.dart';

class BestStoreResponse {
  String? statusCode;
  String? msg;
  List<Data>? data;

  BestStoreResponse({this.statusCode, this.msg, this.data});

  BestStoreResponse.fromJson(dynamic json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['Data'] != null) {
      data = [];
      try {
        json['Data'].forEach((v) {
          data?.add(Data.fromJson(v));
        });
      } catch (e) {
        Logger().error(
            'best store response', '${e.toString()}', StackTrace.current);
      }
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status_code'] = statusCode;
    map['msg'] = msg;
    if (data != null) {
      map['Data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Data {
  int? id;
  String? storeOwnerName;
  String? image;
  dynamic? phone;
  dynamic? location;
  double? deliveryCost;

  Data({
    this.id,
    this.storeOwnerName,
    this.image,
    this.phone,
    this.location,
    this.deliveryCost,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    storeOwnerName = json['storeOwnerName'];
    image = json['image'];
    phone = json['phone'];
    location = json['location'];
    deliveryCost = json['deliveryCost'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['storeOwnerName'] = storeOwnerName;
    map['image'] = image;
    map['phone'] = phone;
    map['location'] = location;
    return map;
  }
}

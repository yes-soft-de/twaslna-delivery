import 'package:twaslna_dashboard/module_clients/response/statistics.dart';

class ClientProfileResponse {
  ClientProfileResponse({
      this.statusCode, 
      this.msg, 
      this.data,});

  ClientProfileResponse.fromJson(dynamic json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    data = json['Data'] != null ? Data.fromJson(json['Data']) : null;
  }
  String? statusCode;
  String? msg;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status_code'] = statusCode;
    map['msg'] = msg;
    if (data != null) {
      map['Data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.clientID, 
      this.clientName, 
      this.roomID, 
      this.phone, 
      this.image, 
      this.imageURL, 
      this.baseURL, 
      this.location,
      this.statistics
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    clientID = json['clientID'];
    clientName = json['clientName'];
    roomID = json['roomID'];
    phone = json['phone'];
    image = json['image'];
    imageURL = json['imageURL'];
    baseURL = json['baseURL'];
    location = json['location'];
    statistics = json['statistics'] != null ? Statistics.fromJson(json['statistics']): null;
  }
  int? id;
  String? clientID;
  String? clientName;
  String? roomID;
  dynamic phone;
  String? image;
  dynamic imageURL;
  String? baseURL;
  dynamic location;
  Statistics? statistics;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['clientID'] = clientID;
    map['clientName'] = clientName;
    map['roomID'] = roomID;
    map['phone'] = phone;
    map['image'] = image;
    map['imageURL'] = imageURL;
    map['baseURL'] = baseURL;
    map['location'] = location;
    return map;
  }

}
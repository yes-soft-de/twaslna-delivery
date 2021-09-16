import 'package:twaslna_dashboard/utils/logger/logger.dart';

class ReportResponse {
  String? statusCode;
  String? msg;
  Data? data;

  ReportResponse({
      this.statusCode, 
      this.msg, 
      this.data});

  ReportResponse.fromJson(dynamic json) {
 try{
   statusCode = json['status_code'];
   msg = json['msg'];
   data = json['Data'] != null ? Data.fromJson(json['Data']) : null;
 } catch (e){
   Logger().error('Order Response', e.toString(), StackTrace.current);
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
  CountCompletedOrders? countCompletedOrders;
  CountOngoingOrders? countOngoingOrders;
  CountCaptains? countCaptains;
  CountClients? countClients;
  CountStores? countStores;
  CountProducts? countProducts;

  Data({
      this.countCompletedOrders, 
      this.countOngoingOrders, 
      this.countCaptains, 
      this.countClients, 
      this.countStores, 
      this.countProducts});

  Data.fromJson(dynamic json) {
    countCompletedOrders = json['countCompletedOrders'] != null ? CountCompletedOrders.fromJson(json['countCompletedOrders']) : null;
    countOngoingOrders = json['countOngoingOrders'] != null ? CountOngoingOrders.fromJson(json['countOngoingOrders']) : null;
    countCaptains = json['countCaptains'] != null ? CountCaptains.fromJson(json['countCaptains']) : null;
    countClients = json['countClients'] != null ? CountClients.fromJson(json['countClients']) : null;
    countStores = json['countStores'] != null ? CountStores.fromJson(json['countStores']) : null;
    countProducts = json['countProducts'] != null ? CountProducts.fromJson(json['countProducts']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (countCompletedOrders != null) {
      map['countCompletedOrders'] = countCompletedOrders?.toJson();
    }
    if (countOngoingOrders != null) {
      map['countOngoingOrders'] = countOngoingOrders?.toJson();
    }
    if (countCaptains != null) {
      map['countCaptains'] = countCaptains?.toJson();
    }
    if (countClients != null) {
      map['countClients'] = countClients?.toJson();
    }
    if (countStores != null) {
      map['countStores'] = countStores?.toJson();
    }
    if (countProducts != null) {
      map['countProducts'] = countProducts?.toJson();
    }
    return map;
  }

}

class CountProducts {
  int? count;

  CountProducts({
      this.count});

  CountProducts.fromJson(dynamic json) {
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['count'] = count;
    return map;
  }

}

class CountStores {
  int? count;

  CountStores({
      this.count});

  CountStores.fromJson(dynamic json) {
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['count'] = count;
    return map;
  }

}

class CountClients {
  int? count;

  CountClients({
      this.count});

  CountClients.fromJson(dynamic json) {
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['count'] = count;
    return map;
  }

}

class CountCaptains {
  int? count;

  CountCaptains({
      this.count});

  CountCaptains.fromJson(dynamic json) {
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['count'] = count;
    return map;
  }

}

class CountOngoingOrders {
  int? count;

  CountOngoingOrders({
      this.count});

  CountOngoingOrders.fromJson(dynamic json) {
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['count'] = count;
    return map;
  }

}

class CountCompletedOrders {
  int? count;

  CountCompletedOrders({
      this.count});

  CountCompletedOrders.fromJson(dynamic json) {
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['count'] = count;
    return map;
  }

}
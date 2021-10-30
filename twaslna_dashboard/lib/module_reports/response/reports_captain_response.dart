import 'package:twaslna_dashboard/utils/logger/logger.dart';

class ReportsCaptainResponse {
  String? statusCode;
  String? msg;
  List<Data>? data;

  ReportsCaptainResponse({
      this.statusCode, 
      this.msg, 
      this.data});

  ReportsCaptainResponse.fromJson(dynamic json) {
    try {

    }catch (e){
      Logger().error('Reports Captain Response', e.toString(), StackTrace.current);
      statusCode = '-1';
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
  String? captainID;
  int? countOrdersInMonth;
  String? captainName;
  String? image;

  Data({
      this.captainID, 
      this.countOrdersInMonth, 
      this.captainName, 
      this.image});

  Data.fromJson(dynamic json) {
    captainID = json['captainID'];
    countOrdersInMonth = json['countOrdersInMonth'];
    captainName = json['captainName'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['captainID'] = captainID;
    map['countOrdersInMonth'] = countOrdersInMonth;
    map['captainName'] = captainName;
    map['image'] = image;
    return map;
  }

}
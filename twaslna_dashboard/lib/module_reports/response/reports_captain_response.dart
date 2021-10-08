class ReportsCaptainResponse {
  String? statusCode;
  String? msg;
  List<Data>? data;

  ReportsCaptainResponse({
      this.statusCode, 
      this.msg, 
      this.data});

  ReportsCaptainResponse.fromJson(dynamic json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['Data'] != null) {
      data = [];
      json['Data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
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
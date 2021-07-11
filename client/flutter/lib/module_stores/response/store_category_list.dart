class StoreCategoryList {
  String? statusCode;
  String? msg;
  List<Data>? data;
  String? msgErr;
  StoreCategoryList({
      this.statusCode, 
      this.msg, 
      this.data,
      this.msgErr
  });

  StoreCategoryList.fromJson(dynamic json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    if (json['Data'] != null) {
      if (json['Data'] is String) {
        msgErr = json['Data'];
      } else {
        data = [];
        json['Data'].forEach((v) {
          data?.add(Data.fromJson(v));
        });
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
  dynamic phone;
  dynamic location;

  Data({
      this.id, 
      this.storeOwnerName, 
      this.image, 
      this.phone, 
      this.location});

  Data.fromJson(dynamic json) {
    id = json['id'];
    storeOwnerName = json['storeOwnerName'];
    image = json['image'];
    phone = json['phone'];
    location = json['location'];
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
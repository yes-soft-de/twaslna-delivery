class StoreProducts {
  String? statusCode;
  String? msg;
  List<Data>? data;
  String? msgErr;

  StoreProducts({this.statusCode, this.msg, this.data, this.msgErr});

  StoreProducts.fromJson(dynamic json) {
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
  String? productName;
  String? productImage;
  int? productPrice;
  int? storeOwnerProfileID;
  int? productCategoryID;
  String? storeOwnerName;
  String? storeOwnerID;
  String? image;
  dynamic phone;
  dynamic location;
  dynamic branchName;
  dynamic city;

  Data(
      {this.id,
      this.productName,
      this.productImage,
      this.productPrice,
      this.storeOwnerProfileID,
      this.productCategoryID,
      this.storeOwnerName,
      this.storeOwnerID,
      this.image,
      this.phone,
      this.location,
      this.branchName,
      this.city});

  Data.fromJson(dynamic json) {
    id = json['id'];
    productName = json['productName'];
    productImage = json['productImage'];
    productPrice = json['productPrice'];
    storeOwnerProfileID = json['storeOwnerProfileID'];
    productCategoryID = json['ProductCategoryID'];
    storeOwnerName = json['storeOwnerName'];
    storeOwnerID = json['storeOwnerID'];
    image = json['image'];
    phone = json['phone'];
    location = json['location'];
    branchName = json['branchName'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['productName'] = productName;
    map['productImage'] = productImage;
    map['productPrice'] = productPrice;
    map['storeOwnerProfileID'] = storeOwnerProfileID;
    map['ProductCategoryID'] = productCategoryID;
    map['storeOwnerName'] = storeOwnerName;
    map['storeOwnerID'] = storeOwnerID;
    map['image'] = image;
    map['phone'] = phone;
    map['location'] = location;
    map['branchName'] = branchName;
    map['city'] = city;
    return map;
  }
}

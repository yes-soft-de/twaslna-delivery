class ProductsByCategory {
  String? statusCode;
  String? msg;
  List<Data>? data;
  String? msgErr;
  ProductsByCategory({
      this.statusCode, 
      this.msg, 
      this.data,
      this.msgErr
  });

  ProductsByCategory.fromJson(dynamic json) {
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

  Data({
      this.id, 
      this.productName, 
      this.productImage, 
      this.productPrice, 
      this.storeOwnerProfileID, 
      this.productCategoryID});

  Data.fromJson(dynamic json) {
    id = json['id'];
    productName = json['productName'];
    productImage = json['productImage'];
    productPrice = json['productPrice'];
    storeOwnerProfileID = json['storeOwnerProfileID'];
    productCategoryID = json['ProductCategoryID'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['productName'] = productName;
    map['productImage'] = productImage;
    map['productPrice'] = productPrice;
    map['storeOwnerProfileID'] = storeOwnerProfileID;
    map['ProductCategoryID'] = productCategoryID;
    return map;
  }

}
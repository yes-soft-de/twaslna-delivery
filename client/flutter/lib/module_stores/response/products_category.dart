class ProductsCategory {
  String? statusCode;
  String? msg;
  List<Data>? data;
  String? msgErr;
  ProductsCategory({
      this.statusCode, 
      this.msg, 
      this.data});

  ProductsCategory.fromJson(dynamic json) {
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
  String? productCategoryName;

  Data({
      this.id, 
      this.productCategoryName});

  Data.fromJson(dynamic json) {
    id = json['id'];
    productCategoryName = json['ProductCategoryName'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['ProductCategoryName'] = productCategoryName;
    return map;
  }

}
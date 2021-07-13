class ProductsResponse {
  String? statusCode;
  String? msg;
  List<Data>? data;
  String? msgErr;

  ProductsResponse({this.statusCode, this.msg, this.data, this.msgErr});

  ProductsResponse.fromJson(dynamic json) {
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
}

class Data {
  int? id;
  String? productName;
  String? productImage;
  double? productPrice;
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
    productPrice = json['productPrice']?.toDouble();
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
}

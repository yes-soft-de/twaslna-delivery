class StoreCategoryList {
  String? statusCode;
  String? msg;
  List<Data>? data;
  String? msgErr;

  StoreCategoryList({this.statusCode, this.msg, this.data, this.msgErr});

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

}

class Data {
  int? id;
  String? storeOwnerName;
  String? image;
  dynamic phone;
  dynamic location;
  double? deliveryCost;
  bool? privateOrders;
  bool? hasProducts;

  Data(
      {this.id,
      this.storeOwnerName,
      this.image,
      this.phone,
      this.location,
      this.deliveryCost,
      this.privateOrders,
      this.hasProducts});

  Data.fromJson(dynamic json) {
    id = json['id'];
    storeOwnerName = json['storeOwnerName'];
    image = json['image'];
    phone = json['phone'];
    location = json['location'];
    deliveryCost = json['deliveryCost']?.toDouble();
    privateOrders = json['privateOrders'];
    hasProducts = json['hasProducts'];
  }
}

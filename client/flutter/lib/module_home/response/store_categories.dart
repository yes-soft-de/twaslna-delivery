class StoreCategories {
  String? statusCode;
  String? msg;
  List<Data>? data;
  String? msgErr;
  StoreCategories({
      this.statusCode, 
      this.msg, 
      this.data,
      this.msgErr
  });

  StoreCategories.fromJson(dynamic json) {
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
  String? storeCategoryName;
  String? description;
  String? image;

  Data({
      this.id, 
      this.storeCategoryName, 
      this.description, 
      this.image});

  Data.fromJson(dynamic json) {
    id = json['id'];
    storeCategoryName = json['storeCategoryName'];
    description = json['description'];
    image = json['image'];
  }


}
class ClientOrderRequest {
  GeoJson? destination;
  String? note;
  String? payment;
  String? ownerID;
  List<Products>? products;
  String? deliveryDate;
  double? orderCost;
  double? deliveryCost;

  ClientOrderRequest({
      this.destination, 
      this.note, 
      this.payment, 
      this.ownerID, 
      this.products, 
      this.deliveryDate, 
      this.orderCost, 
      this.deliveryCost});

  ClientOrderRequest.fromJson(dynamic json) {
    destination = json['destination'];
    note = json['note'];
    payment = json['payment'];
    ownerID = json['ownerID'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
    deliveryDate = json['deliveryDate'];
    orderCost = json['orderCost'];
    deliveryCost = json['deliveryCost'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['destination'] = destination;
    map['note'] = note;
    map['payment'] = payment;
    map['ownerID'] = ownerID;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    map['deliveryDate'] = deliveryDate;
    map['orderCost'] = orderCost;
    map['deliveryCost'] = deliveryCost;
    return map;
  }

}
class GeoJson {
  double? long;
  double? lat;

  GeoJson({this.long, this.lat});

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['long'] = long;
    map['lat'] = lat;
    return map;
  }
}
class Products {
  int? productID;
  int? countProduct;

  Products({
      this.productID, 
      this.countProduct});

  Products.fromJson(dynamic json) {
    productID = json['productID'];
    countProduct = json['countProduct'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['productID'] = productID;
    map['countProduct'] = countProduct;
    return map;
  }

}
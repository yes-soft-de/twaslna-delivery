class OrderInvoiceRequest {
  String? orderNumber;
  double? invoiceAmount;
  String? invoiceImage;

  OrderInvoiceRequest({
      this.orderNumber, 
      this.invoiceAmount, 
      this.invoiceImage});

  OrderInvoiceRequest.fromJson(dynamic json) {
    orderNumber = json['orderNumber'];
    invoiceAmount = json['invoiceAmount'];
    invoiceImage = json['invoiceImage'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['orderNumber'] = orderNumber;
    map['invoiceAmount'] = invoiceAmount;
    map['invoiceImage'] = invoiceImage;
    return map;
  }

}
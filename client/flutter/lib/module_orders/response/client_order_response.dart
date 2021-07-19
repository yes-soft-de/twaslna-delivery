class ClientOrderResponse {
  String? statusCode;
  String? msg;
  dynamic data;

  ClientOrderResponse({
    this.statusCode,
    this.msg,
    this.data});

  ClientOrderResponse.fromJson(dynamic json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    data = json['Data'];
  }

}
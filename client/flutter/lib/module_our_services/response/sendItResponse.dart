class SendItResponse {
  String? statusCode;
  String? msg;
  dynamic data;

  SendItResponse({
    this.statusCode,
    this.msg,
    this.data});

  SendItResponse.fromJson(dynamic json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    data = json['Data'];
  }

}
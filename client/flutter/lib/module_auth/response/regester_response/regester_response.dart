class RegisterResponse {
  String? statusCode;
  String? msg;
  dynamic data;

  RegisterResponse({
    this.statusCode,
    this.msg,
    this.data});

  RegisterResponse.fromJson(dynamic json) {
    statusCode = json['status_code'];
    msg = json['msg'];
    data = json['Data'];
  }

}
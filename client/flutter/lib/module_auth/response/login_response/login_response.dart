class LoginResponse {
  String? token;
  String? statusCode;
  LoginResponse({this.token,this.statusCode});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    statusCode = json['statusCode'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = this.token;
    return data;
  }
}

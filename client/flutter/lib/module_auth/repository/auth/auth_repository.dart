import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/consts/urls.dart';
import 'package:twaslna_delivery/module_auth/request/login_request/login_request.dart';
import 'package:twaslna_delivery/module_auth/request/register_request/register_request.dart';
import 'package:twaslna_delivery/module_auth/response/login_response/login_response.dart';
import 'package:twaslna_delivery/module_auth/response/regester_response/regester_response.dart';
import 'package:twaslna_delivery/module_network/http_client/http_client.dart';

@injectable
class AuthRepository {
  final ApiClient _apiClient;

  AuthRepository(this._apiClient);

  Future<RegisterResponse?> createUser(RegisterRequest request) async {
    dynamic result = await _apiClient.post(
      Urls.SIGN_UP_API,
      request.toJson(),
    );
    if (result == null) return null;
    return RegisterResponse.fromJson(result);
  }

  Future<LoginResponse?> getToken(LoginRequest loginRequest) async {
    var result = await _apiClient.post(
      Urls.CREATE_TOKEN_API,
      loginRequest.toJson(),
    );
    if (result == null) {
      return null;
    }
    return LoginResponse.fromJson(result);
  }
}

import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_auth/service/auth_service/auth_service.dart';
import 'package:twaslna_delivery/module_network/http_client/http_client.dart';
@injectable
class AccountRepository{
  final AuthService _authService;
  final ApiClient _apiClient;
  AccountRepository(this._authService,this._apiClient);

}
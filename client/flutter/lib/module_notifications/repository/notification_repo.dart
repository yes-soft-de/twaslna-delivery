import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/consts/urls.dart';
import 'package:twaslna_delivery/module_auth/service/auth_service/auth_service.dart';
import 'package:twaslna_delivery/module_network/http_client/http_client.dart';

@injectable
class NotificationRepo {
  final ApiClient _apiClient;
  final AuthService _authService;

  NotificationRepo(this._apiClient, this._authService);

  void postToken(String? token) {
    _authService.getToken().then(
      (value) {
        if (token != null) {
          _apiClient.post(Urls.NOTIFICATION_API, {'token': token},
              headers: {'Authorization': 'Bearer ${value}'});
        }
      },
    );
  }
}
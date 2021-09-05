import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/consts/urls.dart';
import 'package:twaslna_delivery/module_auth/service/auth_service/auth_service.dart';
import 'package:twaslna_delivery/module_my_notifications/response/my_notification_response.dart';
import 'package:twaslna_delivery/module_network/http_client/http_client.dart';
@injectable
class MyNotificationsRepository{
  final ApiClient _apiClient;
  final AuthService _authService;
  MyNotificationsRepository(this._apiClient,this._authService);

  Future<MyNotificationResponse?> getMyNotification() async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.get(Urls.GET_MY_NOTIFICATION,
        headers: {'Authorization': 'Bearer ' + token.toString()});
    if (response == null) return null;
    return MyNotificationResponse.fromJson(response);
  }
}
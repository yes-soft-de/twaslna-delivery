import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_network/http_client/http_client.dart';
@injectable
class ServicesRepository{
  final ApiClient _apiClient;

  ServicesRepository(this._apiClient);

}
import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_our_services/manager/manager.dart';
import 'package:twaslna_delivery/module_our_services/request/private_order_request.dart';
import 'package:twaslna_delivery/module_our_services/request/send_it_request.dart';

@injectable
class ServicesService {
  final ServicesManager _servicesManager;

  ServicesService(this._servicesManager);
  Future<int?> sendItClintOrder(SendItRequest request) async {
    int? sendItClientOrderResponse = await  _servicesManager.sendItClintOrder(request);
    if (sendItClientOrderResponse == null) return null;
    return sendItClientOrderResponse;
  }
  Future<int?> postPrivateOrder(PrivateOrderRequest request) async {
    int? privateOrderResponse = await  _servicesManager.postPrivateOrder(request);
    if (privateOrderResponse == null) return null;
    return privateOrderResponse;
  }
}
import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_our_services/manager/manager.dart';
import 'package:twaslna_delivery/module_our_services/model/order_status.dart';
import 'package:twaslna_delivery/module_our_services/request/private_order_request.dart';
import 'package:twaslna_delivery/module_our_services/request/send_it_request.dart';
import 'package:twaslna_delivery/module_our_services/response/sendItResponse.dart';
import 'package:twaslna_delivery/utils/helpers/status_code_helper.dart';

@injectable
class ServicesService {
  final ServicesManager _servicesManager;

  ServicesService(this._servicesManager);
  Future<OrderStatus> sendItClintOrder(SendItRequest request) async {
    SendItResponse? sendItClientOrderResponse = await  _servicesManager.sendItClintOrder(request);
    if (sendItClientOrderResponse == null) return OrderStatus.Error(S.current.networkError);
    String statusCode =  sendItClientOrderResponse.statusCode ?? '0';
    if ( statusCode != '201') return OrderStatus.Error(StatusCodeHelper.getStatusCodeMessages(statusCode));
    return OrderStatus.None();
  }
  Future<OrderStatus> postPrivateOrder(PrivateOrderRequest request) async {
    SendItResponse? privateOrderResponse = await  _servicesManager.postPrivateOrder(request);
    if (privateOrderResponse == null) return OrderStatus.Error(S.current.networkError);
    String statusCode =  privateOrderResponse.statusCode ?? '0';
    if ( statusCode != '201') return OrderStatus.Error(StatusCodeHelper.getStatusCodeMessages(statusCode));
    return OrderStatus.None();
  }
}
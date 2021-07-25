import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_our_services/repository/services_repository.dart';
import 'package:twaslna_delivery/module_our_services/request/private_order_request.dart';
import 'package:twaslna_delivery/module_our_services/request/send_it_request.dart';

@injectable
class ServicesManager {
  final ServicesRepository _servicesRepository;

  ServicesManager(this._servicesRepository);

  Future <int?> sendItClintOrder(SendItRequest request) => _servicesRepository.sendItClintOrder(request);
  Future <int?> postPrivateOrder(PrivateOrderRequest request) => _servicesRepository.postPrivateOrder(request);

}
import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_our_services/service/services_service.dart';

@injectable
class ServicesStateManager{
  final ServicesService _servicesService;

  ServicesStateManager(this._servicesService);

}
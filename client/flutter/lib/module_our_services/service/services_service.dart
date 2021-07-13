import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_our_services/manager/manager.dart';

@injectable
class ServicesService {
  final ServicesManager _servicesManager;

  ServicesService(this._servicesManager);

}
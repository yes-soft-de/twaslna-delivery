import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_our_services/repository/services_repository.dart';

@injectable
class ServicesManager {
  final ServicesRepository _servicesRepository;

  ServicesManager(this._servicesRepository);
}
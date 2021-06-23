import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_home/manager/home_manager.dart';

@injectable
class HomeService {
  HomeManager _homeManager;

  HomeService(this._homeManager);
}

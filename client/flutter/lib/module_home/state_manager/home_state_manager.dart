import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_home/service/home_service.dart';

@injectable
class HomeStateManager {
  HomeService _homeService;

  HomeStateManager(this._homeService);

}

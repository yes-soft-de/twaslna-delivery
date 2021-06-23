import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_home/repository/home_repository.dart';
@injectable
class HomeManager{
  HomeRepository _homeRepository;
  HomeManager(this._homeRepository);
}
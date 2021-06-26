import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_home/repository/home_repository.dart';
import 'package:twaslna_delivery/module_store_list/repository/store_list_repository.dart';
@injectable
class StoreListManager{
  StoreListRepository _storeListRepository;
  StoreListManager(this._storeListRepository);
}
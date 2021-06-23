import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_home/service/home_service.dart';
import 'package:twaslna_delivery/module_store_list/service/store_list_service.dart';

@injectable
class StoreListManager {
  StoreListService _storeListService;

  StoreListManager(this._storeListService);

}

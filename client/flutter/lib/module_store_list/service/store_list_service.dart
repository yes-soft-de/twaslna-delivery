import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_store_list/manager/store_list_manager.dart';

@injectable
class StoreListService {
  StoreListManager _storeListManager;

  StoreListService(this._storeListManager);
}

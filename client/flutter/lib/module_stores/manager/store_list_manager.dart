import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_stores/repository/store_list_repository.dart';
import 'package:twaslna_delivery/module_stores/response/store_category_list.dart';
@injectable
class StoreListManager{
  StoreListRepository _storeListRepository;
  StoreListManager(this._storeListRepository);
  Future<StoreCategoryList?> getStoresCategoryList(int id) => _storeListRepository.getStoreList(id);
}
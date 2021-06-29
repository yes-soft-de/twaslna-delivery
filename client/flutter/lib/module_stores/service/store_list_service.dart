import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_stores/manager/store_list_manager.dart';
import 'package:twaslna_delivery/module_stores/response/store_category_list.dart';
import 'package:twaslna_delivery/utils/models/store.dart';

@injectable
class StoreListService {
  StoreListManager _storeListManager;

  StoreListService(this._storeListManager);

  Future getStoresList(int id) async {
    StoreCategoryList? storeCategoryList =
        await _storeListManager.getStoresCategoryList(id);
    if (storeCategoryList == null) return null;
    if (storeCategoryList.msgErr != null) return storeCategoryList.msgErr;
    List<StoreModel> stores = [];
    storeCategoryList.data?.forEach((element) {
      stores.add(StoreModel(
          id: element.id ?? -1,
          storeOwnerName: element.storeOwnerName ?? S.current.store,
          image: element.image,
          location: element.location,
          phone: element.phone));
    });
    return stores;
  }
}

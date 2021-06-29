import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_home/manager/home_manager.dart';
import 'package:twaslna_delivery/module_home/response/products.dart';
import 'package:twaslna_delivery/module_home/response/store_categories.dart';
import 'package:twaslna_delivery/utils/models/product.dart';
import 'package:twaslna_delivery/utils/models/store_category.dart';

@injectable
class HomeService {
  HomeManager _homeManager;

  HomeService(this._homeManager);

  Future getTopProducts() async {
    Products? topProducts = await _homeManager.getTopProducts();
    if (topProducts == null) return null;
    if (topProducts.msgErr != null ) {
      return topProducts.msgErr ;
    }
    List topProductsModel = <ProductModel>[];
    topProducts.data?.forEach((element) {
     topProductsModel.add(ProductModel(title:element.productName ?? S.current.product,
         image: 'https://www.erdeundleben.com/wp-content/uploads/2021/02/folgendes-macht-unser-food-personal-wenn-es-fast-zu-mude-ist-um-zu-kochen-0-Yywyr8ju.jpg'
     ));
    });
    return topProductsModel;
  }
  Future getStoreCategories() async {
    StoreCategories? storeCategories = await _homeManager.getStoreCategories();
    if (storeCategories == null) return null;
    if (storeCategories.msgErr != null) return storeCategories.msgErr;
    List storeCategoriesModel = <StoreCategoryModel>[];
    storeCategories.data?.forEach((element) {
      storeCategoriesModel.add(StoreCategoryModel(id:element.id ?? -1, storeCategoryName:element.storeCategoryName ?? S.current.category, description:element.description ?? '', image:'https://mk0kaleelao979sb1ktf.kinstacdn.com/wp-content/uploads/2020/03/Supermarket-conversation-in-Arabic.jpg'));
    });
    return storeCategoriesModel;
  }
  Future getHomeData() async {
    var top = await getTopProducts();
    var storeCategories = await getStoreCategories();
    if (top == null && storeCategories == null) return null;
    if (top is String) top = [];
    if (storeCategories is String) storeCategories = [];
    return [top,storeCategories];
  }
}

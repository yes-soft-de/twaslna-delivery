import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_stores/manager/store_products.dart';
import 'package:twaslna_delivery/module_stores/model/category_model.dart';
import 'package:twaslna_delivery/module_stores/response/products_by_category.dart';
import 'package:twaslna_delivery/module_stores/response/products_category.dart';
import 'package:twaslna_delivery/module_stores/response/store_products.dart';
import 'package:twaslna_delivery/utils/models/product.dart';

@injectable
class StoreProductsService {
  final StoreProductsManager _storeProductsManager;

  StoreProductsService(this._storeProductsManager);

  Future getStoresProductsTopWanted(int id) async {
    StoreProducts? storeProducts =
        await _storeProductsManager.getStoreProducts(id);
    if (storeProducts == null) return null;
    if (storeProducts.msgErr != null) return storeProducts.msgErr;
    List<ProductModel> products = [];
    storeProducts.data?.forEach((element) {
      products.add(ProductModel(
          title: element.productName ?? S.current.product,
          image:
              'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
          id: element.id ?? -1,
          price: element.productPrice ?? 0));
    });
    return products;
  }

  Future getProductsCategory(int id) async {
    ProductsCategory? productsCategory =
        await _storeProductsManager.getProductsCategory(id);
    if (productsCategory == null) return null;
    if (productsCategory.msgErr != null) return productsCategory.msgErr;
    List<CategoryModel> categories = [];
    productsCategory.data?.forEach((element) {
      categories.add(CategoryModel(
          id: element.id ?? -1,
          label: element.productCategoryName ?? S.current.categories));
    });
    return categories;
  }

  Future getProductsByCategory(int storeId, int categoryId) async {
    ProductsByCategory? productsByCategory =
        await _storeProductsManager.getProductsByCategory(storeId, categoryId);
    if (productsByCategory == null) return null;
    if (productsByCategory.msgErr != null) return productsByCategory.msgErr;
    List<ProductModel> products = [];
    productsByCategory.data?.forEach((element) {
      products.add(ProductModel(
          title: element.productName ?? S.current.product,
          image:
              'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
          price: element.productPrice ?? 0,
          id: element.id ?? -1));
    });

    return products;
  }

  Future getProductsData(int id) async {
    var topWanted = await getStoresProductsTopWanted(id);
    var cats = await getProductsCategory(id);
    if (topWanted == null && cats == null) return null;
    if (topWanted == null) return null;
    if (topWanted is String) return topWanted;
    cats ??= <CategoryModel>[];
    if (cats is String) cats = <CategoryModel>[];
    return [topWanted, cats];
  }
}

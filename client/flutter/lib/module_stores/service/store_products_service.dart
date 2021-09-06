import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_orders/model/deleted_order_status.dart';
import 'package:twaslna_delivery/module_stores/manager/store_products.dart';
import 'package:twaslna_delivery/module_stores/model/category_model.dart';
import 'package:twaslna_delivery/module_stores/model/store_products_model.dart';
import 'package:twaslna_delivery/module_stores/request/rate_response.dart';
import 'package:twaslna_delivery/module_stores/request/rate_store_request.dart';
import 'package:twaslna_delivery/module_stores/response/products_by_category.dart';
import 'package:twaslna_delivery/module_stores/response/products_category.dart';
import 'package:twaslna_delivery/module_stores/response/store_products.dart';
import 'package:twaslna_delivery/utils/helpers/status_code_helper.dart';
import 'package:twaslna_delivery/utils/models/product.dart';

@injectable
class StoreProductsService {
  final StoreProductsManager _storeProductsManager;

  StoreProductsService(this._storeProductsManager);

  Future<ProductModel> getStoresProductsTopWanted(int id) async {
    StoreProducts? storeProducts =
    await _storeProductsManager.getStoreProducts(id);
    if (storeProducts == null) return ProductModel.Error(S.current.networkError);
    if (storeProducts.statusCode != '200') return ProductModel.Error(StatusCodeHelper.getStatusCodeMessages(storeProducts.statusCode));
    if (storeProducts.data == null) return ProductModel.Empty();
    return ProductModel.topWantedData(storeProducts);
  }

  Future<CategoryModel>getProductsCategory(int id) async {
    ProductsCategory? productsCategory =
        await _storeProductsManager.getProductsCategory(id);
    if (productsCategory == null) return CategoryModel.Error(S.current.networkError);
    if (productsCategory.statusCode != '200') return CategoryModel.Error(StatusCodeHelper.getStatusCodeMessages(productsCategory.statusCode));
    if (productsCategory.data == null) return CategoryModel.Empty();
    return CategoryModel.Data(productsCategory);
  }

  Future<ProductModel>getProductsByCategory(int storeId, int categoryId) async {
    ProductsByCategory? productsByCategory =
        await _storeProductsManager.getProductsByCategory(storeId, categoryId);
    if (productsByCategory == null) return ProductModel.Error(S.current.networkError);
    if (productsByCategory.statusCode != '200') return ProductModel.Error(StatusCodeHelper.getStatusCodeMessages(productsByCategory.statusCode));
    if (productsByCategory.data == null) return ProductModel.Empty();
    return ProductModel.Data(productsByCategory);
  }

  Future <StoreProductsData> getProductsData(int id) async {
    var topWanted = await getStoresProductsTopWanted(id);
    var cats = await getProductsCategory(id);
    List<String> errors = [];
    if (topWanted.hasError) {
      errors.add(topWanted.error!);
    }
    if (cats.hasError) {
      errors.add(cats.error!);
    }
    if (errors.isNotEmpty && errors.length == 2) {
      return StoreProductsData.Error(errors);
    }
    if (topWanted.isEmpty && cats.isEmpty) {
      return StoreProductsData.Empty();
    }
    return StoreProductsData.Data(
        topWanted.data, cats.data,errors);
  }

  Future<MyOrderState> rateStore(RateStoreRequest request) async {
    RateResponse? rateStoreResponse =
    await _storeProductsManager.rateStore(request);
    if (rateStoreResponse == null) {
      return MyOrderState.error(S.current.networkError);
    }
    if (rateStoreResponse.statusCode != '201') {
      return MyOrderState.error(StatusCodeHelper.getStatusCodeMessages(
          rateStoreResponse.statusCode));
    }
    return MyOrderState.empty();
  }



}

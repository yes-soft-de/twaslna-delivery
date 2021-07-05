import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/consts/urls.dart';
import 'package:twaslna_delivery/module_network/http_client/http_client.dart';
import 'package:twaslna_delivery/module_stores/response/products_category.dart';
import 'package:twaslna_delivery/module_stores/response/store_products.dart';
@injectable
class StoreProductsRepository{
  final ApiClient _apiClient;
  StoreProductsRepository(this._apiClient);
  Future <StoreProducts?> getMostWantedProducts(int id) async {
   dynamic response =await _apiClient.get(Urls.GET_MOST_WANTED_STORE_PRODUCTS + '/$id');
   if (response == null) return null;
   return StoreProducts.fromJson(response);
  }
  Future <ProductsCategory?> getCategories(int id) async {
    dynamic response = await _apiClient.get(Urls.GET_PRODUCTS_CATEGORY_API+'/$id');
    if (response == null) return null;
    return ProductsCategory.fromJson(response);
  }
}
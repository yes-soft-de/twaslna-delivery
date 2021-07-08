import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/consts/urls.dart';
import 'package:twaslna_delivery/module_home/response/best_store.dart';
import 'package:twaslna_delivery/module_home/response/products.dart';
import 'package:twaslna_delivery/module_home/response/store_categories.dart';
import 'package:twaslna_delivery/module_network/http_client/http_client.dart';
@injectable
class HomeRepository{
  final ApiClient _apiClient;
  HomeRepository(this._apiClient);
  Future <ProductsResponse?> getTopProducts() async {
    dynamic response = await _apiClient.get(Urls.GET_TOP_PRODUCTS_API);
    if (response == null) return null;
    return ProductsResponse.fromJson(response);
  }
  Future <StoreCategoriesResponse?> getStoreCategories() async {
    dynamic response = await _apiClient.get(Urls.GET_STORE_CATEGORIES_API);
    if (response == null) return null;
    return StoreCategoriesResponse.fromJson(response);
  }
  Future <BestStoreResponse?> getBestStores() async {
    dynamic response = await _apiClient.get(Urls.GET_BEST_STORES_API);
    if (response == null) return null;
    return BestStoreResponse.fromJson(response);
  }
}
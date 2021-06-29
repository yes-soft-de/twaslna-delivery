import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/consts/urls.dart';
import 'package:twaslna_delivery/module_home/response/products.dart';
import 'package:twaslna_delivery/module_home/response/store_categories.dart';
import 'package:twaslna_delivery/module_network/http_client/http_client.dart';
@injectable
class HomeRepository{
  final ApiClient _apiClient;
  HomeRepository(this._apiClient);
  Future <Products?> getTopProducts() async {
    dynamic response = await _apiClient.get(Urls.GET_TOP_PRODUCTS_API);
    if (response == null) return null;
    return Products.fromJson(response);
  }
  Future <StoreCategories?> getStoreCategories() async {
    dynamic response = await _apiClient.get(Urls.GET_STORE_CATEGORIES_API);
    if (response == null) return null;
    return StoreCategories.fromJson(response);
  }
}
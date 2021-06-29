import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_home/repository/home_repository.dart';
import 'package:twaslna_delivery/module_home/response/products.dart';
import 'package:twaslna_delivery/module_home/response/store_categories.dart';
@injectable
class HomeManager{
  HomeRepository _homeRepository;
  HomeManager(this._homeRepository);
  Future<Products?> getTopProducts() => _homeRepository.getTopProducts();
  Future<StoreCategories?> getStoreCategories() => _homeRepository.getStoreCategories();
}
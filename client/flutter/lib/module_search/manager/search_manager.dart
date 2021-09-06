import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_search/repository/search_repository.dart';
import 'package:twaslna_delivery/module_search/response/search_response.dart';
import 'package:twaslna_delivery/module_stores/response/store_category_list.dart';
@injectable
class SearchManager{
  final SearchRepository _searchRepository;

  SearchManager(this._searchRepository);
  Future<SearchResponse?> getStoresCategoryList(String key) => _searchRepository.getSearchResult(key);
}
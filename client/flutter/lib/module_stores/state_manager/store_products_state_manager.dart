import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_stores/service/store_products_service.dart';
import 'package:twaslna_delivery/module_stores/ui/screen/store_products_screen.dart';
import 'package:twaslna_delivery/module_stores/ui/state/store_products/store_products_error_state.dart';
import 'package:twaslna_delivery/module_stores/ui/state/store_products/store_products_loaded_state.dart';
import 'package:twaslna_delivery/module_stores/ui/state/store_products/store_products_loading_state.dart';
import 'package:twaslna_delivery/module_stores/ui/state/store_products/store_products_state.dart';
@injectable
class StoreProductsStateManager {
  final  StoreProductsService _storeProductsService;
  final PublishSubject<StoreProductsState> _stateSubject = PublishSubject();
  Stream<StoreProductsState> get stateStream => _stateSubject.stream;
  StoreProductsStateManager(this._storeProductsService);
  void getStoresProducts(int id,StoreProductsScreenState screenState) {
    _stateSubject.add(StoreProductsLoadingState(screenState));
    _storeProductsService.getProductsData(id).then((value){
      if (value!=null){
        if (value is String) {
          _stateSubject.add(StoreProductsErrorState(screenState,value));
        }
        else {
          _stateSubject.add(StoreProductsLoadedState(screenState,value[0],value[1]));
        }
      }
      else {
        _stateSubject.add(StoreProductsErrorState(screenState,S.current.networkError));
      }
    });
  }
}

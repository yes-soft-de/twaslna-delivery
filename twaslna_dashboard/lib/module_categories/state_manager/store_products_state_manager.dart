import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:twaslna_dashboard/abstracts/states/loading_state.dart';
import 'package:twaslna_dashboard/abstracts/states/state.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/module_auth/service/auth_service/auth_service.dart';
import 'package:twaslna_dashboard/module_categories/model/products_categories_model.dart';
import 'package:twaslna_dashboard/module_categories/model/products_model.dart';
import 'package:twaslna_dashboard/module_categories/request/create_product_request.dart';
import 'package:twaslna_dashboard/module_categories/request/update_product_request.dart';
import 'package:twaslna_dashboard/module_categories/service/store_categories_service.dart';
import 'package:twaslna_dashboard/module_categories/ui/screen/store_products_screen.dart';
import 'package:twaslna_dashboard/module_categories/ui/state/product_store/product_store_state.dart';
import 'package:twaslna_dashboard/module_upload/service/image_upload/image_upload_service.dart';
import 'package:twaslna_dashboard/utils/helpers/custom_flushbar.dart';

@injectable
class StoreProductsStateManager {
  final CategoriesService _categoriesService;

  final AuthService _authService;
  final ImageUploadService _imageUploadService;
  final PublishSubject<States> _stateSubject = PublishSubject();

  Stream<States> get stateStream => _stateSubject.stream;

  StoreProductsStateManager(
      this._categoriesService, this._authService,this._imageUploadService);

  void getProductCategory(StoreProductScreenState screenState,int id) {
    _stateSubject.add(LoadingState(screenState));
    _categoriesService.getProductsCategory(id).then((value) {
      if (value.hasError) {
        _stateSubject.add(
            ProductStoreState(screenState, null,null ,error: value.error));
      } else if (value.isEmpty) {
        _stateSubject.add(ProductStoreState(screenState, null,null,
            empty: value.isEmpty));
      } else {
        _categoriesService.getProducts(id).then((products){
          if (products.hasError) {
            _stateSubject.add(
                ProductStoreState(screenState, null,null , error: products.error));
          } else if (products.isEmpty) {
            ProductsCategoryModel model = value as ProductsCategoryModel;
            _stateSubject.add(ProductStoreState(screenState, model.data,[]));
          }
          else {
            ProductsCategoryModel model = value as ProductsCategoryModel;
            ProductsModel storeProducts = products as ProductsModel;
            _stateSubject.add(ProductStoreState(screenState, model.data,storeProducts.data));
          }
        });
      }
    });

  }

  void createProduct(
      StoreProductScreenState screenState,CreateProductRequest request) {
    _stateSubject.add(LoadingState(screenState));
    _imageUploadService.uploadImage(request.productImage ?? '').then((value){
      if (value == null){
        getProductCategory(screenState,request.storeOwnerProfileID ?? -1);
        CustomFlushBarHelper.createError(
            title: S.current.warnning, message: S.current.errorUploadingImages)
          ..show(screenState.context);
      }
      else {
        request.productImage = value;
        _categoriesService.createProduct(request).then((value) {
          if (value.hasError) {
            getProductCategory(screenState,request.storeOwnerProfileID ?? -1);
            CustomFlushBarHelper.createError(
                title: S.current.warnning, message: value.error ?? '')
              ..show(screenState.context);
          } else {
            getProductCategory(screenState,request.storeOwnerProfileID ?? -1);
            CustomFlushBarHelper.createSuccess(
                title: S.current.warnning,
                message: S.current.categoryCreatedSuccessfully)
              ..show(screenState.context);
          }
        });
      }
    });
  }
  void updateProduct(
      StoreProductScreenState screenState,UpdateProductRequest request) {
    _stateSubject.add(LoadingState(screenState));
    if (!request.productImage!.contains('/original-image/')){
      _imageUploadService.uploadImage(request.productImage ?? '').then((value){
        if (value == null){
          getProductCategory(screenState,request.storeOwnerProfileID ?? -1);
          CustomFlushBarHelper.createError(
              title: S.current.warnning, message: S.current.errorUploadingImages)
            ..show(screenState.context);
        }
        else {
          request.productImage = value;
          _categoriesService.updateProduct(request).then((value) {
            if (value.hasError) {
              getProductCategory(screenState,request.storeOwnerProfileID ?? -1);
              CustomFlushBarHelper.createError(
                  title: S.current.warnning, message: value.error ?? '')
                ..show(screenState.context);
            } else {
              getProductCategory(screenState,request.storeOwnerProfileID ?? -1);
              CustomFlushBarHelper.createSuccess(
                  title: S.current.warnning,
                  message: S.current.categoryCreatedSuccessfully)
                ..show(screenState.context);
            }
          });
        }
      });
    }
    else {
      _categoriesService.updateProduct(request).then((value) {
        if (value.hasError) {
          getProductCategory(screenState,request.storeOwnerProfileID ?? -1);
          CustomFlushBarHelper.createError(
              title: S.current.warnning, message: value.error ?? '')
            ..show(screenState.context);
        } else {
          getProductCategory(screenState,request.storeOwnerProfileID ?? -1);
          CustomFlushBarHelper.createSuccess(
              title: S.current.warnning,
              message: S.current.categoryCreatedSuccessfully)
            ..show(screenState.context);
        }
      });
    }
  }

}

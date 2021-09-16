import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/abstracts/states/loading_state.dart';
import 'package:twaslna_dashboard/abstracts/states/state.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/module_categories/request/create_product_request.dart';
import 'package:twaslna_dashboard/module_categories/request/update_product_request.dart';
import 'package:twaslna_dashboard/module_categories/state_manager/store_products_state_manager.dart';
import 'package:twaslna_dashboard/module_categories/ui/state/product_store/product_store_state.dart';

import 'package:twaslna_dashboard/module_categories/ui/widget/add_product_form.dart';
import 'package:twaslna_dashboard/utils/components/custom_app_bar.dart';

@injectable
class StoreProductScreen extends StatefulWidget {
  final StoreProductsStateManager _stateManager;

  StoreProductScreen(this._stateManager);

  @override
  StoreProductScreenState createState() =>
      StoreProductScreenState();
}

class StoreProductScreenState
    extends State<StoreProductScreen> {
   late States currentState;
    bool save = true;

  @override
  void initState() {
    currentState = LoadingState(this);
    widget._stateManager.stateStream.listen((event) {
      currentState = event;
      refresh();
    });
    super.initState();
  }
  void getProductsCategories(){
    widget._stateManager.getProductCategory(this,storeId??-1);
  }
  void createProduct(CreateProductRequest request){
    widget._stateManager.createProduct(this, request);
  }

  void updateProduct(UpdateProductRequest request) {
    widget._stateManager.updateProduct(this,request);
  }

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }
   bool flagArgs = true;
   int? storeId;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && flagArgs){
      if (args is int) {
        storeId = args;
        flagArgs = false;
        widget._stateManager.getProductCategory(this,storeId??-1);
      }
    }
    return Scaffold(
      appBar:
          CustomTwaslnaAppBar.appBar(context, title: S.current.storeProducts),
      body: currentState.getUI(context),
      floatingActionButton: ElevatedButton(
        onPressed: (){
          if (currentState is ProductStoreState){
            showDialog(context: context, builder:(_){
              return AddProductsForm(
                state: currentState as ProductStoreState,
                addProduct: (name,image,price,catID){
                  Navigator.of(context).pop();
                  createProduct(CreateProductRequest(
                    productName: name,
                    productImage: image,
                    productPrice: price,
                    storeProductCategoryID: catID.toInt(),
                    storeOwnerProfileID: storeId
                  ));
                },
              );
            });
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(S.current.addProducts,style: TextStyle(
            color: Colors.white
          ),),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          elevation: 3
        ),
      ),
    );
  }
}

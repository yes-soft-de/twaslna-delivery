import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_stores/state_manager/store_products_state_manager.dart';
import 'package:twaslna_delivery/module_stores/ui/state/store_products/store_products_loading_state.dart';
import 'package:twaslna_delivery/module_stores/ui/state/store_products/store_products_state.dart';
import 'package:twaslna_delivery/utils/models/store.dart';

@injectable
class StoreProductsScreen extends StatefulWidget {
  final StoreProductsStateManager stateManager;

  StoreProductsScreen(this.stateManager);

  @override
  StoreProductsScreenState createState() => StoreProductsScreenState();
}

class StoreProductsScreenState extends State<StoreProductsScreen> {
  late StoreProductsState currentState;
  late AsyncSnapshot snapshot = AsyncSnapshot.nothing();
  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }
  void getProductsByCategory(storeId , categoryId) async {
     widget.stateManager.getProductsByCategory(storeId, categoryId);
  }

  @override
  void initState() {
    super.initState();
    currentState = StoreProductsLoadingState(this);
    widget.stateManager.stateStream.listen((event) {
      currentState = event;
      if (mounted) setState(() {});
    });
    widget.stateManager.categoryStream.listen((event) {
      snapshot = event;
      if (mounted) setState(() {});
    });
  }
  bool flag = true;
  late String title;
  late String backgroundImage;
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments;
    if (flag && args is StoreModel) {
      widget.stateManager.getStoresProducts(args.id, this);
      flag = false;
    }
    return GestureDetector(
      onTap: () {
        var focus = FocusScope.of(context);
        if (focus.canRequestFocus) {
          focus.unfocus();
        }
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
        child: Scaffold(
          body: currentState.getUI(context),
        ),
      ),
    );
  }
}

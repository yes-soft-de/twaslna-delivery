import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_stores/ui/state/store_products/store_products_loaded_state.dart';
import 'package:twaslna_delivery/module_stores/ui/state/store_products/store_products_state.dart';

@injectable
class StoreProductsScreen extends StatefulWidget {

  @override
  StoreProductsScreenState createState() => StoreProductsScreenState();
}

class StoreProductsScreenState extends State<StoreProductsScreen> {
  late StoreProductsState currentState;

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    currentState = StoreProductsLoadedState(this);
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        var focus = FocusScope.of(context);
        if (focus.canRequestFocus){
          focus.unfocus();
        }
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light
        ),
        child: Scaffold(
          body: currentState.getUI(context),
        ),
      ),
    );
  }
}

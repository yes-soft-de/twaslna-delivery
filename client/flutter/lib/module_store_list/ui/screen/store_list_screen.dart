import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_store_list/manager/store_list_manager.dart';
import 'package:twaslna_delivery/module_store_list/ui/state/store_list_loaded_state.dart';
import 'package:twaslna_delivery/module_store_list/ui/state/store_list_state.dart';

@injectable
class StoreListScreen extends StatefulWidget {
  final StoreListManager _storeListManager;

  StoreListScreen(this._storeListManager);

  @override
  StoreListScreenState createState() => StoreListScreenState();
}

class StoreListScreenState extends State<StoreListScreen> {
  late StoreListState currentState;

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    currentState = StoreListLoadedState(this);
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

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/global_nav_key.dart';
import 'package:twaslna_dashboard/module_categories/request/update_store_request.dart';
import 'package:twaslna_dashboard/module_stores/request/create_store_request.dart';
import 'package:twaslna_dashboard/module_stores/state_manager/stores_state_manager.dart';
import 'package:twaslna_dashboard/module_stores/ui/state/store_categories/stores_loaded_state.dart';
import 'package:twaslna_dashboard/module_stores/ui/state/store_categories/stores_loading_state.dart';
import 'package:twaslna_dashboard/module_stores/ui/state/store_categories/stores_state.dart';
import 'package:twaslna_dashboard/module_stores/ui/widget/add_store_widget.dart';
import 'package:twaslna_dashboard/utils/components/custom_app_bar.dart';
import 'package:twaslna_dashboard/utils/components/floated_button.dart';
import 'package:twaslna_dashboard/utils/effect/hidder.dart';

@injectable
class StoresScreen extends StatefulWidget {
  final StoresStateManager _stateManager;

  StoresScreen(this._stateManager);

  @override
  StoresScreenState createState() => StoresScreenState();
}

class StoresScreenState extends State<StoresScreen> {
  late StoresState currentState;
  bool canAddCategories = true;

  @override
  void initState() {
    currentState = StoresLoadingState(this);
    widget._stateManager.stateStream.listen((event) {
      currentState = event;
      if (mounted) {
        refresh();
      }
    });
    widget._stateManager.getStores(this);
    super.initState();
  }

  void getStores() {
    widget._stateManager.getStores(this);
  }

  void addStore(CreateStoreRequest request) {
    widget._stateManager.createCategory(this, request);
  }

  void updateStore(UpdateStoreRequest request){
    widget._stateManager.updateStore(this, request);
  }

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTwaslnaAppBar.appBar(context,
          title: S.of(context).storesList, icon: Icons.menu, onTap: () {
        GlobalVariable.mainScreenScaffold.currentState?.openDrawer();
      }),
      body: currentState.getUI(context),
      floatingActionButton: Hider(
        active: canAddCategories,
        child: FloatedIconButton(
          text: S.current.addStore,
          icon: Icons.add_circle_rounded,
          onPressed: () {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (_) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Scaffold(
                      appBar: CustomTwaslnaAppBar.appBar(context,
                          title: S.current.addStore),
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      body: AddStoreWidget(
                        state: currentState is StoresLoadedState ? currentState as StoresLoadedState : null,
                        addStore:
                            (id,name,phone, image,location ,products, privateOrder) {
                          Navigator.of(context).pop();
                          addStore(CreateStoreRequest(
                              location: location,
                              storeOwnerName: name,
                              phone: phone,
                              storeCategoryId: int.parse(id),
                              image: image,
                              hasProducts: products ? 1 : 0,
                              privateOrders: privateOrder ? 1 : 0));
                        },
                      ),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}

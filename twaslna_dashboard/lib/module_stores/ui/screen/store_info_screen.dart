import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/abstracts/states/loading_state.dart';
import 'package:twaslna_dashboard/abstracts/states/state.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/module_categories/categories_routes.dart';
import 'package:twaslna_dashboard/module_stores/model/stores_model.dart';
import 'package:twaslna_dashboard/module_stores/state_manager/store_profile_state_manager.dart';
import 'package:twaslna_dashboard/utils/components/custom_app_bar.dart';
import 'package:twaslna_dashboard/utils/components/custom_list_view.dart';
import 'package:twaslna_dashboard/utils/components/progresive_image.dart';

@injectable
class StoreInfoScreen extends StatefulWidget {
  final StoreProfileStateManager stateManager;

  StoreInfoScreen(this.stateManager);

  @override
  StoreInfoScreenState createState() => StoreInfoScreenState();
}

class StoreInfoScreenState extends State<StoreInfoScreen> {
  bool flagArgs = true;
  late States currentState;
  StoresModel? model;

  void getStore(int id) {
    widget.stateManager.getStore(this, id);
  }

  @override
  void initState() {
    currentState = LoadingState(this);
    widget.stateManager.stateStream.listen((event) {
      currentState = event;
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }
  void refresh(){
    if (mounted) {
      setState(() {});
    }
  }
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute
        .of(context)
        ?.settings
        .arguments;
    if (args != null && flagArgs) {
      if (args is StoresModel) {
        model = args;
        flagArgs = false;
        getStore(model?.id ?? -1);
      }
    }

    return Scaffold(
      appBar: CustomTwaslnaAppBar.appBar(
          context, title: model?.storeOwnerName ?? S.current.storeName,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                customBorder: CircleBorder(),
                onTap: () {
                  showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(10))),
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  S
                                      .of(context)
                                      .storeManagment,
                                  style: TextStyle(fontSize: 16.5,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 25, right: 25),
                                child: Divider(
                                  thickness: 2.5,
                                ),
                              ),
                              Container(
                                width: double.maxFinite,
                                height: 55,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.of(context)
                                        .pushNamed(
                                        CategoriesRoutes.PRODUCT_CATEGORIES,
                                        arguments: model?.id);
                                  },
                                  child: Text(S
                                      .of(context)
                                      .addNewCategory,
                                      style: TextStyle(
                                          color: Theme
                                              .of(context)
                                              .textTheme
                                              .bodyText1
                                              ?.color)),
                                ),
                              ),
                              Container(
                                width: double.maxFinite,
                                height: 55,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.of(context)
                                        .pushNamed(CategoriesRoutes
                                        .PRODUCT_STORE_CATEGORIES,
                                        arguments: model?.id);
                                  },
                                  child: Text(
                                    S
                                        .of(context)
                                        .addProducts,
                                    style: TextStyle(
                                        color: Theme
                                            .of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.color),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme
                          .of(context)
                          .primaryColor,
                      shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.add_box_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ]
      ),
      body:currentState.getUI(context),
    );
  }

}

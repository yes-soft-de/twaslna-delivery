import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/module_categories/model/StoreCategoriesModel.dart';
import 'package:twaslna_dashboard/module_categories/request/update_store_request.dart';
import 'package:twaslna_dashboard/module_stores/model/stores_model.dart';
import 'package:twaslna_dashboard/module_stores/request/create_store_request.dart';
import 'package:twaslna_dashboard/module_stores/stores_routes.dart';
import 'package:twaslna_dashboard/module_stores/ui/screen/stores_screen.dart';
import 'package:twaslna_dashboard/module_stores/ui/state/store_categories/stores_state.dart';
import 'package:twaslna_dashboard/module_stores/ui/widget/add_store_widget.dart';
import 'package:twaslna_dashboard/utils/components/custom_app_bar.dart';
import 'package:twaslna_dashboard/utils/components/custom_list_view.dart';
import 'package:twaslna_dashboard/utils/components/empty_screen.dart';
import 'package:twaslna_dashboard/utils/components/error_screen.dart';
import 'package:twaslna_dashboard/utils/components/progresive_image.dart';

class StoresLoadedState extends StoresState {
  final StoresScreenState screenState;
  final String? error;
  final bool empty;
  final List<StoresModel>? model;
  final List<StoreCategoriesModel>? categories;

  StoresLoadedState(this.screenState, this.model, this.categories,
      {this.empty = false, this.error})
      : super(screenState) {
    if (error != null) {
      screenState.canAddCategories = false;
      screenState.refresh();
    }
  }

  String? id;

  @override
  Widget getUI(BuildContext context) {
    if (error != null) {
      return ErrorStateWidget(
        onRefresh: () {
          screenState.getStores();
        },
        error: error,
      );
    } else if (empty) {
      return EmptyStateWidget(
          empty: S.current.emptyStaff,
          onRefresh: () {
            screenState.getStores();
          });
    }
    return Container(
      width: double.maxFinite,
      child: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 600
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      //color: Theme.of(context).backgroundColor,
                      border: Border.all(
                          color: Theme.of(context).primaryColor, width: 4)),
                  child: Center(
                    child: DropdownButton(
                      value: id,
                      items: getChoices(),
                      onChanged: (v) {
                        id = v.toString();
                        screenState.refresh();
                      },
                      hint: Text(
                        S.current.chooseCategory,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      underline: SizedBox(),
                      icon: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(Icons.arrow_drop_down_rounded),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: CustomListView.custom(children: getStores()),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> getChoices() {
    List<DropdownMenuItem<String>> items = [];
    categories?.forEach((element) {
      items.add(DropdownMenuItem(
        value: element.id.toString(),
        child: Text(element.categoryName),
      ));
    });
    return items;
  }

  List<Widget> getStores() {
    List<Widget> widgets = [];
    if (model == null) {
      return widgets;
    }
    if (model!.isEmpty) return widgets;
    for (var element in model!) {
      if (element.categoryId != id && id != null) {
        continue;
      }
      widgets.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () {
            Navigator.of(screenState.context).pushNamed(StoresRoutes.STORE_INFO,
                arguments: StoresModel(
                    id: element.id,
                    storeOwnerName: element.storeOwnerName,
                    phone: element.phone,
                    deliveryCost: element.deliveryCost,
                    image: element.image,
                    privateOrders: element.privateOrders,
                    hasProducts: element.hasProducts,
                    categoryId:categories?.firstWhere((e) => e.id.toString() == element.categoryId).categoryName ?? S.current.categoryName
                ));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(screenState.context).primaryColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: SizedBox(
                      height: 75,
                      width: 75,
                      child: CustomNetworkImage(
                        imageSource: element.image,
                        width: 75,
                        height: 75,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: getTile(element.storeOwnerName),
                  ),
                ),
                InkWell(
                  onTap: (){
                    showDialog(
                        barrierDismissible: false,
                        context: screenState.context,
                        builder: (context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: Scaffold(
                              appBar: CustomTwaslnaAppBar.appBar(context,
                                  title: S.current.updateStore),
                              backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                              body: UpdateStoreWidget(
                                request: UpdateStoreRequest(
                                  id: element.categoryId,
                                  storeOwnerName: element.storeOwnerName,
                                  hasProducts: element.hasProducts ? 1 : 0,
                                  privateOrders: element.privateOrders ? 1 : 0,
                                  image: element.image,
                                  openingTime:element.openingTime?.toIso8601String(),
                                  closingTime:element.closingTime?.toIso8601String(),
                                ),
                                updateStore:
                                    (id,name,image,products, privateOrder,open,close) {
                                  Navigator.of(context).pop();
                                  screenState.updateStore(UpdateStoreRequest(
                                    status: 'active',
                                      id: element.id.toString(),
                                      storeOwnerName: name,
                                      storeCategoryId: int.parse(element.categoryId),
                                      image: image,
                                      hasProducts: products ? 1 : 0,
                                      privateOrders: privateOrder ? 1 : 0,
                                      openingTime: open,
                                      closingTime: close,
                                  ));
                                },
                              ),
                            ),
                          );
                        });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(screenState.context)
                            .backgroundColor
                            .withOpacity(0.2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
    }

    widgets.add(SizedBox(height: 75));
    return widgets;
  }

  Widget getTile(String text) {
    return Text(text,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold));
  }
}

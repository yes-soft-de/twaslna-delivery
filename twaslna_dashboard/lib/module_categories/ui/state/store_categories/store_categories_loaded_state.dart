import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/module_categories/model/StoreCategoriesModel.dart';
import 'package:twaslna_dashboard/module_categories/request/store_categories_request.dart';
import 'package:twaslna_dashboard/module_categories/ui/screen/store_categories_screen.dart';
import 'package:twaslna_dashboard/module_categories/ui/state/store_categories/store_categories_state.dart';
import 'package:twaslna_dashboard/module_stores/stores_routes.dart';
import 'package:twaslna_dashboard/utils/components/custom_list_view.dart';
import 'package:twaslna_dashboard/utils/components/empty_screen.dart';
import 'package:twaslna_dashboard/utils/components/error_screen.dart';
import 'package:twaslna_dashboard/utils/components/progresive_image.dart';
import 'package:twaslna_dashboard/utils/helpers/form_dialog.dart';

class StoreCategoriesLoadedState extends StoreCategoriesState {
  final StoreCategoriesScreenState screenState;
  final String? error;
  final bool empty;
  final List<StoreCategoriesModel>? model;

  StoreCategoriesLoadedState(this.screenState, this.model,
      {this.empty = false, this.error})
      : super(screenState) {
    if (error != null) {
      screenState.canAddCategories = false;
      screenState.refresh();
    }
  }

  @override
  Widget getUI(BuildContext context) {
    if (error != null) {
      return ErrorStateWidget(
        onRefresh: () {
          screenState.getStoreCategories();
        },
        error: error,
      );
    } else if (empty) {
      return EmptyStateWidget(
          empty: S.current.emptyStaff,
          onRefresh: () {
            screenState.getStoreCategories();
          });
    }
    return CustomListView.custom(children: getCategories());
  }

  List<Widget> getCategories() {
    List<Widget> widgets = [];
    if (model == null) {
      return widgets;
    }
    if (model!.isEmpty) return widgets;
    model?.forEach((element) {
      widgets.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          borderRadius:BorderRadius.circular(25),
          onTap: (){
         //   Navigator.of(screenState.context).pushNamed(StoresRoutes.STORES,arguments: element.id.toString());
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
                      height: 100,
                      width: 100,
                      child: CustomNetworkImage(
                        imageSource: element.image,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ),
                Text(
                  element.categoryName,
                  style: TextStyle(
                    color: Colors.white,
                  fontWeight: FontWeight.bold
                  ),
                ),
                InkWell(
                  customBorder: CircleBorder(),
                  onTap: (){
                    showDialog(
                        context: screenState.context,
                        builder: (context) {
                      return formDialog(
                          context, S.current.storeCategories, S.current.category,
                              (name, image) {
                            Navigator.of(context).pop();
                             screenState.updateCategory(UpdateStoreCategoriesRequest(
                                  id: element.id,
                                  description: '',
                                  storeCategoryName: name,
                                  image: image
                              ));
                          },storeCategoriesRequest:UpdateStoreCategoriesRequest(
                        id: element.id,
                        description: '',
                        storeCategoryName: element.categoryName,
                        image: element.image,
                      ));
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(screenState.context).backgroundColor.withOpacity(0.2),
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
    });
    return widgets;
  }
}

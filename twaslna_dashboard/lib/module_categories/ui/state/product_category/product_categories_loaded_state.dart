import 'package:flutter/material.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/module_categories/model/products_categories_model.dart';
import 'package:twaslna_dashboard/module_categories/request/update_product_category_request.dart';
import 'package:twaslna_dashboard/module_categories/ui/screen/product_categories_screen.dart';
import 'package:twaslna_dashboard/module_categories/ui/state/product_category/product_categories_state.dart';
import 'package:twaslna_dashboard/module_stores/stores_routes.dart';
import 'package:twaslna_dashboard/utils/components/custom_list_view.dart';
import 'package:twaslna_dashboard/utils/components/empty_screen.dart';
import 'package:twaslna_dashboard/utils/components/error_screen.dart';
import 'package:twaslna_dashboard/utils/components/fixed_container.dart';
import 'package:twaslna_dashboard/utils/helpers/form_dialog.dart';

class ProductCategoriesLoadedState extends ProductCategoriesState {
  final ProductCategoriesScreenState screenState;
  final String? error;
  final bool empty;
  final List<ProductsCategoryModel>? model;

  ProductCategoriesLoadedState(this.screenState, this.model,
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
    return FixedContainer(
      child: CustomListView.custom(children: getCategories()),
    );
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
          borderRadius: BorderRadius.circular(25),
          onTap: () {},
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
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: 24,
                  ),
                ),
                Text(
                  element.categoryName,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: screenState.context,
                        builder: (context) {
                          return formDialog(
                              context,
                              S.current.updateProductCategory,
                              S.current.category, (name, image) {
                            Navigator.of(context).pop();
                            screenState.updateProductCategory(
                                UpdateProductCategoryRequest(
                                    storeOwnerProfileId:screenState.storeId,
                                    productCategoryName: name,
                                    id: element.id.toString()));
                          },
                              image: false,
                              request: UpdateProductCategoryRequest(
                                  productCategoryName: element.categoryName));
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
    });
    widgets.add(SizedBox(
      height: 100,
    ));
    return widgets;
  }
}

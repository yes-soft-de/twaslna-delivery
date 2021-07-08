import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_home/response/products.dart';
import 'package:twaslna_delivery/module_stores/model/cart_model.dart';
import 'package:twaslna_delivery/module_stores/model/category_model.dart';
import 'package:twaslna_delivery/module_stores/response/store_products.dart';
import 'package:twaslna_delivery/module_stores/ui/screen/store_products_screen.dart';
import 'package:twaslna_delivery/module_stores/ui/state/store_products/store_products_state.dart';
import 'package:twaslna_delivery/module_stores/ui/widget/store_products/checkout_button.dart';
import 'package:twaslna_delivery/module_stores/ui/widget/store_products/custom_stores_products_app_bar.dart';
import 'package:twaslna_delivery/module_stores/ui/widget/store_card.dart';
import 'package:twaslna_delivery/module_stores/ui/widget/store_products/products_card.dart';
import 'package:twaslna_delivery/module_stores/ui/widget/store_products/products_chip.dart';
import 'package:twaslna_delivery/module_stores/ui/widget/store_products/store_products_title_bar.dart';
import 'package:twaslna_delivery/utils/components/costom_search.dart';
import 'package:twaslna_delivery/utils/models/product.dart';
import 'package:twaslna_delivery/utils/models/store.dart';
import 'package:twaslna_delivery/utils/models/store_category.dart';
import 'package:twaslna_delivery/utils/text_style/text_style.dart';

class StoreProductsLoadedState extends StoreProductsState {
  StoreProductsScreenState screenState;
  List<ProductModel> topWantedProducts;
  List<CategoryModel> productsCategory;

  StoreProductsLoadedState(
      this.screenState, this.topWantedProducts, this.productsCategory)
      : super(screenState);
  late String title;
  late String backgroundImage;
  String defaultValue = S.current.mostWanted;
  List<CartModel> carts = [];
  late int storeId;
  int categoryId = -1;

  @override
  Widget getUI(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var args = ModalRoute.of(context)?.settings.arguments;
    if (args is StoreModel) {
      title = args.storeOwnerName;
      backgroundImage = args.image;
      storeId = args.id;
    }
    return Stack(
      children: [
        Image.network(
          backgroundImage,
          height: height,
          width: width,
          fit: BoxFit.cover,
        ),
        CustomStoresProductsAppBar(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(right: 28.0, left: 28, bottom: 16),
                child: StoreProductsTitleBar(
                  title: title,
                  rate: 4.7,
                  views: 40,
                ),
              ),
              Container(
                height: height * 0.65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
                  color: Theme.of(context).cardColor,
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: ListView(
                        physics: BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 28.0, left: 28.0, bottom: 25),
                            child: CustomDeliverySearch(
                              hintText: S.of(context).searchFor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 25.0),
                            child: Container(
                              height: 44,
                              child: ListView(
                                physics: BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.horizontal,
                                children: getCategories(productsCategory),
                              ),
                            ),
                          ),
                          screenState.snapshot.connectionState !=
                                  ConnectionState.waiting
                              ? ListView(
                                  physics: ScrollPhysics(),
                                  shrinkWrap: true,
                                  children: getProducts(
                                      defaultValue == S.of(context).mostWanted
                                          ? topWantedProducts
                                          : screenState.snapshot.data),
                                )
                              : Container(
                                  height: 125,
                                  width: double.maxFinite,
                                  child: Align(
                                      alignment:
                                          AlignmentDirectional.bottomCenter,
                                      child: CircularProgressIndicator())),
                          SizedBox(
                            height: 75,
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CheckoutButton(
                        onPressed: () {},
                        total: getTotal(carts),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> getProducts(List<ProductModel> topWantedProducts) {
    if (topWantedProducts.isEmpty) return [];
    List<ProductsCard> prods = [];
    topWantedProducts.forEach((element) {
      prods.add(ProductsCard(
          title: element.title,
          image: element.image,
          price: element.price,
          defaultQuantity: getQuantity(element.id),
          quantity: (q) {
            if (q > 0) {
              carts.removeWhere((e) => e.id == element.id);
              carts.add(
                  CartModel(id: element.id, quantity: q, price: element.price));
            }
            if (q == 0) {
              carts.removeWhere((e) => e.id == element.id);
            }
            screenState.refresh();
          }));
    });
    return prods;
  }

  List<Widget> getCategories(List<CategoryModel> categoriesModel) {
    if (categoriesModel.isEmpty) {
      return [
        ProductsChips(
          id: -1,
          onChange: (value, id) {
            defaultValue = value;
            categoryId = id;
            screenState.refresh();
          },
          title: S.current.mostWanted,
          active: defaultValue == S.current.mostWanted,
        )
      ];
    }
    List<ProductsChips> cats = [];
    cats.add(ProductsChips(
      id: -1,
      onChange: (value, id) {
        defaultValue = value;
        categoryId = id;
        screenState.refresh();
      },
      title: S.current.mostWanted,
      active: defaultValue == S.current.mostWanted,
    ));
    categoriesModel.forEach((element) {
      cats.add(ProductsChips(
        id: element.id,
        title: element.label,
        active: defaultValue == element.label,
        onChange: (value, id) {
          defaultValue = value;
          categoryId = id;
          screenState.getProductsByCategory(storeId, categoryId);
          //screenState.refresh();
        },
      ));
    });
    return cats;
  }

  int getQuantity(int id) {
    if (carts.isEmpty) {
      return 0;
    } else {
      int quantity = 0;
      carts.forEach((element) {
        quantity = element.id == id ? element.quantity : quantity;
      });
      return quantity;
    }
  }
}

dynamic getTotal(List<CartModel> carts) {
  var total = 0;
  for (int i = 0; i < carts.length; i++) {
    total += carts[i].price * carts[i].quantity;
  }
  return total.toString();
}

import 'package:flutter/material.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_orders/orders_routes.dart';
import 'package:twaslna_delivery/module_orders/request/client_order_request.dart';
import 'package:twaslna_delivery/hive/objects/cart_model/cart_model.dart';
import 'package:twaslna_delivery/module_stores/model/category_model.dart';
import 'package:twaslna_delivery/module_stores/model/checkout_model.dart';
import 'package:twaslna_delivery/module_stores/presistance/cart_hive_box_helper.dart';
import 'package:twaslna_delivery/module_stores/ui/screen/store_products_screen.dart';
import 'package:twaslna_delivery/module_stores/ui/state/store_products/store_products_state.dart';
import 'package:twaslna_delivery/module_stores/ui/widget/store_products/checkout_button.dart';
import 'package:twaslna_delivery/module_stores/ui/widget/store_products/custom_stores_products_app_bar.dart';
import 'package:twaslna_delivery/module_stores/ui/widget/store_products/products_card.dart';
import 'package:twaslna_delivery/module_stores/ui/widget/store_products/products_chip.dart';
import 'package:twaslna_delivery/module_stores/ui/widget/store_products/products_zone.dart';
import 'package:twaslna_delivery/module_stores/ui/widget/store_products/store_products_title_bar.dart';
import 'package:twaslna_delivery/utils/components/costom_search.dart';
import 'package:twaslna_delivery/utils/components/progresive_image.dart';
import 'package:twaslna_delivery/utils/helpers/custom_flushbar.dart';
import 'package:twaslna_delivery/utils/models/product.dart';
import 'package:twaslna_delivery/utils/models/store.dart';

class StoreProductsLoadedState extends StoreProductsState {
  StoreProductsScreenState screenState;
  List<ProductModel> topWantedProducts;
  List<CategoryModel> productsCategory;
  List<CartModel>? orderCart;
  StoreProductsLoadedState(this.screenState,
      {required this.topWantedProducts, required this.productsCategory,required this.orderCart})
      : super(screenState){
    if (orderCart != null ){
      fromEditingOrder = true;
      carts = orderCart??[];
    }
  }
  late String title;
  late String backgroundImage;
  String defaultValue = S.current.mostWanted;
  List<CartModel> carts = [];
  late int storeId;
  int categoryId = -1;
  late double deliveryCost;
  bool fromEditingOrder = false;
  @override
  Widget getUI(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var args = ModalRoute
        .of(context)
        ?.settings
        .arguments;
    if (args is StoreModel) {
      title = args.storeOwnerName;
      backgroundImage = args.image;
      storeId = args.id;
      deliveryCost = args.deliveryCost;
    }
    return Stack(
      children: [
        CustomNetworkImage(
          image:backgroundImage,
          height: height,
          width: width,
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
                    deliveryCost: deliveryCost
                ),
              ),
              Container(
                height: height * 0.65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
                  color: Theme
                      .of(context)
                      .cardColor,
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
                              hintText: S
                                  .of(context)
                                  .searchFor,
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
                          ProductsZone(loading: screenState.snapshot
                              .connectionState == ConnectionState.waiting,
                              children: getProducts(defaultValue == S.current.mostWanted ? topWantedProducts : screenState.snapshot.data ?? <ProductModel>[]),
                              snapshot: screenState.snapshot),
                          SizedBox(
                            height: 75,
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CheckoutButton(
                        onPressed: carts.isNotEmpty ? () {
                          List<Products> items = [];
                          carts.forEach((element) {
                            items.add(Products(productID: element.id,
                                countProduct: element.quantity));
                          });
                          CheckoutModel checkoutModel = CheckoutModel(
                              ownerId: storeId,
                              cart: items,
                              orderCost: double.parse(getTotal(carts)),
                              deliveryCost: deliveryCost);
                          if (fromEditingOrder){
                            CartHiveHelper().setCart(carts);
                            Navigator.of(context).pop();
                          }
                          else {
                            Navigator.of(context).pushNamed(OrdersRoutes
                                .CLIENT_ORDER, arguments: checkoutModel);
                          }

                        } : () {
                          CustomFlushBarHelper.createError(title: S
                              .of(context)
                              .warnning, message: S
                              .of(context)
                              .yourCartEmpty)
                            ..show(context);
                        },
                        total: getTotal(carts),
                        currency: S
                            .of(context)
                            .sar,
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
          id:element.id,
          title: element.title,
          image: element.image,
          price: element.price,
          defaultQuantity: getQuantity(element.id),
          quantity: (cartModel) {
            if (cartModel.quantity > 0) {
              carts.removeWhere((e) => e.id == cartModel.id);
              carts.add(cartModel);
            }
            if (cartModel.quantity == 0) {
              carts.removeWhere((e) => e.id == cartModel.id);
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
  var total = 0.0;
  for (int i = 0; i < carts.length; i++) {
    total += carts[i].price * carts[i].quantity;
  }
  return total.toString();
}

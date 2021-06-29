import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_stores/ui/screen/store_products_screen.dart';
import 'package:twaslna_delivery/module_stores/ui/state/store_products/store_products_state.dart';
import 'package:twaslna_delivery/module_stores/ui/widget/store_products/custom_stores_products_app_bar.dart';
import 'package:twaslna_delivery/module_stores/ui/widget/store_card.dart';
import 'package:twaslna_delivery/module_stores/ui/widget/store_products/products_card.dart';
import 'package:twaslna_delivery/module_stores/ui/widget/store_products/products_chip.dart';
import 'package:twaslna_delivery/module_stores/ui/widget/store_products/store_products_title_bar.dart';
import 'package:twaslna_delivery/utils/components/costom_search.dart';
import 'package:twaslna_delivery/utils/text_style/text_style.dart';

class StoreProductsLoadedState extends StoreProductsState {
  StoreProductsScreenState screenState;

  StoreProductsLoadedState(this.screenState) : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Image.network(
          'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
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
                  title: 'Domainos pizza',
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
                                right: 28.0, left: 28.0,bottom: 25),
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
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 8.0, left: 8.0),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(8),
                                      child: ProductsChips(
                                        title: 'most demand',
                                        active: true,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 8.0, left: 8.0),
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(8),
                                      child: ProductsChips(
                                        title: 'pizza',
                                        active: false,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0,left: 8.0),
                            child: ListView.builder(
                              physics: ScrollPhysics(),
                              itemCount: 10,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return ProductsCard(
                                    title: 'Pizza',
                                    image:
                                        'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
                                    price: 20,
                                    currency: 'US',
                                    quantity: (quantity) {});
                              },
                            ),
                          ),
                          SizedBox(
                            height: 75,
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 65,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Theme.of(context).cardColor.withOpacity(0.2),
                                Theme.of(context).cardColor,
                                Theme.of(context).cardColor,
                                Theme.of(context).cardColor,
                                Theme.of(context).cardColor,
                                Theme.of(context).cardColor,
                              ]),
                        ),
                        child:Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 65,
                            width:double.maxFinite,
                            child:  Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Theme.of(context).primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                  )
                                ),
                                onPressed: () {},
                                child: Text('checkout (100 US)',style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16
                                ),),
                              ),
                            ),
                          ),
                        ),
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
}

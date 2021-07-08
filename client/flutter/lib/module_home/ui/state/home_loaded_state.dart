import 'package:flutter/material.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_home/ui/screen/home_screen.dart';
import 'package:twaslna_delivery/module_home/ui/state/home_state.dart';
import 'package:twaslna_delivery/module_home/ui/widget/home_app_bar.dart';
import 'package:twaslna_delivery/module_home/ui/widget/product_card.dart';
import 'package:twaslna_delivery/module_home/ui/widget/show_all.dart';
import 'package:twaslna_delivery/module_stores/store_routes.dart';
import 'package:twaslna_delivery/utils/customIcon/custom_icons.dart';
import 'package:twaslna_delivery/utils/images/images.dart';
import 'package:twaslna_delivery/utils/models/product.dart';
import 'package:twaslna_delivery/utils/models/store.dart';
import 'package:twaslna_delivery/utils/models/store_category.dart';
import 'package:twaslna_delivery/utils/text_style/text_style.dart';

class HomeLoadedState extends HomeState {
  HomeScreenState screenState;
  List<ProductModel> topProducts;
  List<StoreCategoryModel> categories;
  List<StoreModel> bestStores;
  HomeLoadedState(this.screenState,this.topProducts,this.categories,this.bestStores) : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      children: [
        CustomHomeAppBar(),
        ListTile(leading: Icon(CustomIcon.our_service,color: Theme.of(context).primaryColor,size: 18,),
          title: Text(S.of(context).ourService,style:StyleText.categoryStyle,),
        ),
        SizedBox(
          height: 125,
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [
              HomeCard(title:S.of(context).deliverForMe, image:ImageAsset.SEND_ON_ME),
              HomeCard(title: S.of(context).externalOrder, image:ImageAsset.LOGO),
            ],
          ),
        ),
        ListTile(leading: Icon(CustomIcon.top_product,color: Theme.of(context).primaryColor,size: 18,),
          title: Text(S.of(context).mostSoldProduct,style: StyleText.categoryStyle,),
          trailing:showAll(context),
        ),
        SizedBox(
          height: 125,
          child: ListView(
            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            scrollDirection: Axis.horizontal,
            children:_getTopProducts(topProducts),
          ),
        ),
        ListTile(leading: Icon(CustomIcon.top_store,color: Theme.of(context).primaryColor,size: 18,),
          title: Text(S.of(context).bestStore,style: StyleText.categoryStyle,),
          trailing:showAll(context),
        ),
        SizedBox(
          height: 125,
          child: ListView(
            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            scrollDirection: Axis.horizontal,
            children:getBestStores(bestStores),
          ),
        ),
        ListTile(leading: Icon(CustomIcon.near_me,color: Theme.of(context).primaryColor,size: 18,),
          title: Text(S.of(context).nearbyStore,style: StyleText.categoryStyle,),
          trailing:showAll(context),
        ),
        SizedBox(
          height: 125,
          child: ListView.builder(
            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (_, index) {
              return HomeCard(title:'متجر', image: 'https://media-cdn.tripadvisor.com/media/photo-s/17/75/3f/d1/restaurant-in-valkenswaard.jpg');
            },
          ),
        ),
        ListTile(leading: Icon(Icons.sort,color: Theme.of(context).primaryColor,),
          title: Text(S.of(context).categories,style:StyleText.categoryStyle,),
        ),
        GridView(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8.0,
              childAspectRatio: (MediaQuery.of(context).size.width / 2) / 135),
          children: getCategories(categories),
        ),
        SizedBox(
          height: 75,
        ),
      ],
    );
  }

  List<Widget> _getTopProducts(List<ProductModel> topProducts) {
    if (topProducts.isEmpty) return [];
    List<HomeCard> top = [];
    topProducts.forEach((element) {
      top.add(HomeCard(title:element.title,image: element.image,));
    });
    return top;
  }

  List<Widget> getCategories(List<StoreCategoryModel> categories) {
    if (categories.isEmpty) return [];
    List<HomeCard> cats = [];
    categories.forEach((element) {
      cats.add(HomeCard(title:element.storeCategoryName,image: element.image,
      onTap: () {
        Navigator.of(screenState.context).pushNamed(StoreRoutes.STORE_LIST_SCREEN,arguments:element);
      },
      ));
    });
    return cats;
  }
  List<Widget> getBestStores(List<StoreModel> stores) {
    if (stores.isEmpty) return [];
    List<HomeCard> bestStoresCards = [];
    stores.forEach((element) {
      bestStoresCards.add(HomeCard(title:element.storeOwnerName,image: element.image,
        onTap: () {
          Navigator.of(screenState.context).pushNamed(StoreRoutes.STORE_PRODUCTS,arguments:element);
        },
      ));
    });
    return bestStoresCards;
  }
}
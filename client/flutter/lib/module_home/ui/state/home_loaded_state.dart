import 'package:flutter/material.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_home/ui/screen/home_screen.dart';
import 'package:twaslna_delivery/module_home/ui/state/home_state.dart';
import 'package:twaslna_delivery/module_home/ui/widget/home_app_bar.dart';
import 'package:twaslna_delivery/module_home/ui/widget/product_card.dart';
import 'package:twaslna_delivery/module_home/ui/widget/show_all.dart';
import 'package:twaslna_delivery/utils/customIcon/custom_icons.dart';
import 'package:twaslna_delivery/utils/text_style/text_style.dart';

class HomeLoadedState extends HomeState {
  HomeScreenState screenState;

  HomeLoadedState(this.screenState) : super(screenState);

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
              ProductCard(title:S.of(context).deliverForMe, image:'assets/images/logo.png'),
              ProductCard(title: S.of(context).externalOrder, image:'assets/images/logo.png'),
            ],
          ),
        ),
        ListTile(leading: Icon(CustomIcon.top_product,color: Theme.of(context).primaryColor,size: 18,),
          title: Text(S.of(context).mostSoldProduct,style: StyleText.categoryStyle,),
          trailing:showAll(context),
        ),
        SizedBox(
          height: 125,
          child: ListView.builder(
            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (_, index) {
              return ProductCard(title: 'عنوان',image:'https://www.erdeundleben.com/wp-content/uploads/2021/02/folgendes-macht-unser-food-personal-wenn-es-fast-zu-mude-ist-um-zu-kochen-0-Yywyr8ju.jpg',);
            },
          ),
        ),
        ListTile(leading: Icon(CustomIcon.top_store,color: Theme.of(context).primaryColor,size: 18,),
          title: Text(S.of(context).bestStore,style: StyleText.categoryStyle,),
          trailing:showAll(context),
        ),
        SizedBox(
          height: 125,
          child: ListView.builder(
            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (_, index) {
              return ProductCard(title: 'ماركت',image: 'https://images.myguide-cdn.com/content/1/large/spanish-supermarket-shopping-511175.jpeg',);
            },
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
              return ProductCard(title:'متجر', image: 'https://media-cdn.tripadvisor.com/media/photo-s/17/75/3f/d1/restaurant-in-valkenswaard.jpg');
            },
          ),
        ),
        ListTile(leading: Icon(Icons.sort,color: Theme.of(context).primaryColor,),
          title: Text(S.of(context).categories,style:StyleText.categoryStyle,),
        ),
        GridView.builder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount: 8,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8.0,
              childAspectRatio: (MediaQuery.of(context).size.width / 2) / 135),
          itemBuilder: (_, index) {
            return ProductCard(title:'متجر ${index+1}', image: 'https://mk0kaleelao979sb1ktf.kinstacdn.com/wp-content/uploads/2020/03/Supermarket-conversation-in-Arabic.jpg');
          },
        ),
        SizedBox(
          height: 75,
        ),
      ],
    );
  }
}

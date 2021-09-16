import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/module_categories/categories_routes.dart';
import 'package:twaslna_dashboard/module_stores/model/stores_model.dart';
import 'package:twaslna_dashboard/utils/components/custom_app_bar.dart';
import 'package:twaslna_dashboard/utils/components/custom_list_view.dart';
import 'package:twaslna_dashboard/utils/components/progresive_image.dart';

@injectable
class StoreInfoScreen extends StatefulWidget {
  @override
  _StoreInfoScreenState createState() => _StoreInfoScreenState();
}

class _StoreInfoScreenState extends State<StoreInfoScreen> {
  bool flagArgs = true;
  StoresModel? model;
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && flagArgs){
      if (args is StoresModel) {
        model = args;
        flagArgs = false;
      }
    }

    return Scaffold(
      appBar: CustomTwaslnaAppBar.appBar(context, title:model?.storeOwnerName ?? S.current.storeName,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            customBorder: CircleBorder(),
            onTap:(){
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
                              S.of(context).storeManagment,
                              style: TextStyle(fontSize: 16.5, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25, right: 25),
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
                                    .pushNamed(CategoriesRoutes.PRODUCT_CATEGORIES,arguments:model?.id);
                              },
                              child: Text(S.of(context).addNewCategory,
                                  style: TextStyle(
                                      color: Theme.of(context).textTheme.bodyText1?.color)),
                            ),
                          ),
                          Container(
                            width: double.maxFinite,
                            height: 55,
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                 Navigator.of(context)
                                     .pushNamed(CategoriesRoutes.PRODUCT_STORE_CATEGORIES,arguments:model?.id);
                              },
                              child: Text(
                                S.of(context).addProducts,
                                style: TextStyle(
                                    color: Theme.of(context).textTheme.bodyText1?.color),
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
                  color:Theme.of(context).primaryColor,
                  shape: BoxShape.circle),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.add_box_rounded,
                  color:Colors.white,
                ),
              ),
            ),
          ),
        ),
      ]
      ),
      body: CustomListView.custom(children:[
        Container(
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height * 0.28,
          child: ClipRRect(
        //    borderRadius: BorderRadius.circular(25),
            child:CustomNetworkImage(
              imageSource: model?.image ?? '',
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height * 0.28,
            ),
          ),
        ),
        Container(
          width:double.maxFinite,
          color: Theme.of(context).backgroundColor,
          child: Padding(
            padding: const EdgeInsets.only(top:16.0,bottom: 16,left: 8,right: 8),
            child: Center(
              child: Text(S.current.storeInfo,style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).disabledColor,
              ),),
            ),
          ),
        ),
        CustomListTile(title:S.current.storeName ,subTitle:model?.storeOwnerName,),
        CustomListTile(title:S.current.categoryName ,subTitle:model?.categoryId,),
        CustomListTile(title:S.current.storePhone ,subTitle:model?.phone,),
        CustomListTile(title:S.current.deliverPrice ,subTitle:'${model?.deliveryCost.toString() ?? 0} ${S.current.sar}',),
        CustomListTile(title:S.current.products ,serve:model?.hasProducts??false),
        CustomListTile(title:S.current.privateOrder ,serve:model?.privateOrders??false),
        Container(
          width:double.maxFinite,
          color: Theme.of(context).backgroundColor,
          child: Padding(
            padding: const EdgeInsets.only(top:16.0,bottom: 16,left: 8,right: 8),
            child: Text(''),
          ),
        ),
      ]),
    );
  }

 Widget CustomListTile({required String title, String? subTitle,bool? serve}){
    if (serve != null) {
      return Flex(direction:Axis.horizontal,
        children: [
          Container(
            width: 130,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                border:Border.symmetric(horizontal: BorderSide(color: Theme.of(context).scaffoldBackgroundColor,width: 1),)
            ),
            child: Padding(
              padding: const EdgeInsets.only(top:16.0,bottom: 16,left: 8,right: 8),
              child: Text(title,style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
            ),
          ),
          Container(
            width: 4,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          Expanded(child:Container(
            color:serve ? Colors.green : Colors.red,
            child:Padding(
              padding: const EdgeInsets.only(top:16.0,bottom: 16,left: 8,right: 8),
              child: Center(
                child: Text(serve ? S.current.serve : S.current.notServe,style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),),
              ),
            ),
          ))
        ],
      );
    }
    return Flex(direction:Axis.horizontal,
    children: [
      Container(
        width: 130,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          border:Border.symmetric(horizontal: BorderSide(color: Theme.of(context).scaffoldBackgroundColor,width: 1),)
        ),
        child: Padding(
          padding: const EdgeInsets.only(top:16.0,bottom: 16,left: 8,right: 8),
          child: Text(title,style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),maxLines: 1,),
        ),
      ),
      Container(
        width: 4,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      Expanded(child:Container(
        color:Theme.of(context).backgroundColor,
        child:Padding(
          padding: const EdgeInsets.only(top:16.0,bottom: 16,left: 8,right: 8),
          child: Text(subTitle??'',style: TextStyle(
            color: Theme.of(context).disabledColor,
            fontWeight: FontWeight.w600,
          ),),
        ),
      ))
    ],
    );
  }
}

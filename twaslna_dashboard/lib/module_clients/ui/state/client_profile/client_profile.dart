import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twaslna_dashboard/abstracts/states/state.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/module_clients/model/porfile_model.dart';
import 'package:twaslna_dashboard/module_clients/ui/screen/clients_profile_screen.dart';
import 'package:twaslna_dashboard/utils/components/custom_list_view.dart';
import 'package:twaslna_dashboard/utils/components/empty_screen.dart';
import 'package:twaslna_dashboard/utils/components/error_screen.dart';
import 'package:twaslna_dashboard/utils/components/progresive_image.dart';

class ClientProfileLoadedState extends States {

  final ClientProfileScreenState screenState;
  final String? error;
  final bool empty;
  final ClientProfileModel? model;

  ClientProfileLoadedState(this.screenState, this.model,
      {this.empty = false, this.error})
      : super(screenState) {
    if (error != null) {
      screenState.refresh();
    }
  }
  @override
  Widget getUI(BuildContext context) {
    if (error != null) {
      return ErrorStateWidget(
        onRefresh: () {
          screenState.getClientProfile();
        },
        error: error,
      );
    } else if (empty) {
      return EmptyStateWidget(
          empty: S.current.emptyStaff,
          onRefresh: () {
            screenState.getClientProfile();
          });
    }
    return  CustomListView.custom(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: 175,
            height: 175,
            child: Center(
              child: ClipOval(
                //   borderRadius: BorderRadius.circular(25),
                child: Container(
                  width: 175,
                  height: 175,
                  child: CustomNetworkImage(
                    imageSource: model?.image ?? '',
                    width: double.maxFinite,
                    height: double.maxFinite,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Theme.of(context).primaryColor
            ),
            child: Column(
              children: [
                customListTile(
                    title: S.of(context).name,
                    subTitle: model?.name,
                    iconData: Icons.person_rounded),
                customListTile(
                    title: S.of(context).phoneNumber,
                    subTitle:model?.phone,
                    iconData:Icons.phone),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(S.current.orders,style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),),
                      SizedBox(height: 8,),
                      Text(model?.statistics?.clientOrdersCount.toString() ?? S.current.unknown,style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white,
                      ),),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(S.current.countOrdersDelivered,style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),),
                      SizedBox(height: 8,),
                      Text(model?.statistics?.clientOrdersDelivered.toString() ?? S.current.unknown,style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white,
                      ),),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(S.current.ordersCancel,style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),),
                      SizedBox(height: 8,),
                      Text(model?.statistics?.clientOrdersCancel.toString() ?? S.current.unknown,style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white,
                      ),),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(height: 75,)
      ],
    );
  }
  Widget customListTile(
      {required String title, String? subTitle, required IconData iconData}) {
    var context = screenState.context;
    Widget? icon;
    if (title == S.current.captainStatus || title == S.current.status) {
      icon = PhysicalModel(
          color: Theme.of(context).scaffoldBackgroundColor,
          elevation: 5,
          shape: BoxShape.circle,
          child: Icon(
            Icons.circle,
            color: subTitle == 'active' ? Colors.green : Colors.red,
            size: 30,
          ));
      subTitle = subTitle == 'active'
          ? S.current.captainStateActive
          : S.current.captainStateInactive;
    }
    return ListTile(
      leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(iconData, color:Theme.of(context).primaryColor),
          )),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      trailing: icon,
      subtitle: Text(
        subTitle ?? S.current.unknown,
        style: TextStyle(color: Colors.white),
        textDirection: S.current.phoneNumber == title &&
            Localizations.localeOf(context).languageCode == 'ar'
            ? TextDirection.ltr
            : null,
        textAlign: S.current.phoneNumber == title &&
            Localizations.localeOf(context).languageCode == 'ar'
            ? TextAlign.right
            : null,
      ),
    );
  }
Widget customMiniTile({required String title, String? subTitle, required IconData iconData}){
    var context = screenState.context;
    Widget? icon;
    if (title == S.current.captainStatus || title == S.current.status) {
      icon = PhysicalModel(
          color: Theme.of(context).scaffoldBackgroundColor,
          elevation: 5,
          shape: BoxShape.circle,
          child: Icon(
            Icons.circle,
            color: subTitle == 'active' ? Colors.green : Colors.red,
            size: 30,
          ));
      subTitle = subTitle == 'active'
          ? S.current.captainStateActive
          : S.current.captainStateInactive;
    }
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Row(
        crossAxisAlignment:CrossAxisAlignment.center,
        children: [
          Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(iconData, color:Theme.of(context).primaryColor),
              )),
          SizedBox(width: 16,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18
              ),overflow:TextOverflow.ellipsis,),
              Text('${subTitle}',style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),),
            ],
          ),
          Spacer(flex: 1,),
          SizedBox(child: icon,)
        ],
      ),
    );
}
Widget imageTile({required String title,required String image}){
    var context = screenState.context;
    return Flex(
      direction: Axis.vertical,
      children: [
        Padding(
          padding: const EdgeInsets.only(top:16.0,left: 8,right: 8),
          child: Container(
            width: 150,
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor.withOpacity(0.25),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(child:Text(title,style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),)),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16,top: 16),
          child: Container(
            width: 75,
            height: 75,
            child: Center(
              child: ClipOval(
                child: Container(
                  width: 75,
                  height: 75,
                  child: CustomNetworkImage(
                    imageSource: image,
                    width: double.maxFinite,
                    height: double.maxFinite,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
}

}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twaslna_dashboard/abstracts/states/state.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/module_captain/model/porfile_model.dart';
import 'package:twaslna_dashboard/module_captain/request/accept_captain_request.dart';
import 'package:twaslna_dashboard/module_captain/ui/screen/captain_profile_screen.dart';
import 'package:twaslna_dashboard/module_captain/ui/widget/update_profile_widget.dart';
import 'package:twaslna_dashboard/utils/components/custom_app_bar.dart';
import 'package:twaslna_dashboard/utils/components/custom_list_view.dart';
import 'package:twaslna_dashboard/utils/components/empty_screen.dart';
import 'package:twaslna_dashboard/utils/components/error_screen.dart';
import 'package:twaslna_dashboard/utils/components/fixed_container.dart';
import 'package:twaslna_dashboard/utils/components/progresive_image.dart';
import 'package:twaslna_dashboard/utils/components/stacked_form.dart';
import 'package:twaslna_dashboard/utils/helpers/form_dialog.dart';

class CaptainProfileLoadedState extends States {

  final CaptainProfileScreenState screenState;
  final String? error;
  final bool empty;
  final ProfileModel? model;

  CaptainProfileLoadedState(this.screenState, this.model,
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
          screenState.getCaptain();
        },
        error: error,
      );
    } else if (empty) {
      return EmptyStateWidget(
          empty: S.current.emptyStaff,
          onRefresh: () {
            screenState.getCaptain();
          });
    }
    return StackedForm(
        child: CustomListView.custom(
          // padding: EdgeInsets.only(left: 8,right: 8),
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Theme.of(context).primaryColor,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      ListTile(
                        leading:Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.person_rounded, color:Theme.of(context).primaryColor),
                            )),
                        title: Text(S.of(context).name,style: TextStyle(
                            color: Colors.white
                        ),) ,
                        subtitle: Text(model?.name ?? S.current.unknown,style: TextStyle(
                            color: Colors.white
                        ),) ,
                        trailing: customMiniTile(title: S.of(context).status,
                            subTitle: model?.isOnline,
                            iconData: Icons.wifi_rounded),
                      ),
                      ListTile(
                        leading:Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.calendar_today_rounded, color:Theme.of(context).primaryColor),
                            )),
                        title: Text(S.of(context).age,style: TextStyle(
                            color: Colors.white
                        ),) ,
                        subtitle: Text(model?.age?.toString() ?? S.current.unknown,style: TextStyle(
                            color: Colors.white
                        ),) ,
                        trailing: customMiniTile(title: S.of(context).captainStatus,
                            subTitle: model?.status,
                            iconData: Icons.account_box_rounded),
                      ),
                      ListTile(
                        leading:Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.phone, color:Theme.of(context).primaryColor),
                            )),
                        title: Text(S.of(context).phoneNumber,style: TextStyle(
                            color: Colors.white
                        ),) ,
                        subtitle: Text(model?.phone ?? S.current.unknown,style: TextStyle(
                            color: Colors.white
                        ),) ,
                        trailing: customMiniTile(
                            title: S.of(context).car,
                            subTitle: model?.car,
                            iconData: Icons.local_taxi_rounded),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).backgroundColor.withOpacity(0.25),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Center(child:Text(S.current.identity,style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),)),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right:16.0,left: 16,bottom: 16),
                        child: Container(
                          width: 175,
                          height: 175,
                          child: Center(
                            child: ClipOval(
                              child: Container(
                                width: 175,
                                height: 175,
                                child: CustomNetworkImage(
                                  imageSource: model?.identity ?? '',
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
                              color: Theme.of(context).backgroundColor.withOpacity(0.25),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Center(child:Text(S.current.mechanichLicence,style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),)),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right:16.0,left: 16,bottom: 16),
                        child: Container(
                          width: 175,
                          height: 175,
                          child: Center(
                            child: ClipOval(
                              child: Container(
                                width: 175,
                                height: 175,
                                child: CustomNetworkImage(
                                  imageSource: model?.mechanicLicense ?? '',
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
                              color: Theme.of(context).backgroundColor.withOpacity(0.25),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Center(child:Text(S.current.driverLicence,style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),)),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right:16.0,left: 16,bottom: 16),
                        child: Container(
                          width: 175,
                          height: 175,
                          child: Center(
                            child: ClipOval(
                              child: Container(
                                width: 175,
                                height: 175,
                                child: CustomNetworkImage(
                                  imageSource: model?.drivingLicence ?? '',
                                  width: double.maxFinite,
                                  height: double.maxFinite,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      customListTile(
                          title: S.of(context).bankName,
                          subTitle: model?.bankName,
                          iconData: Icons.monetization_on_rounded),
                      customListTile(
                          title: S.of(context).bankAccountNumber,
                          subTitle: model?.bankNumber,
                          iconData: Icons.password_rounded),
                      customListTile(
                          title: S.of(context).stcPayCode,
                          subTitle: model?.stcPay,
                          iconData: Icons.credit_card_rounded),
                      customListTile(
                          title: S.of(context).salary,
                          subTitle: model?.salary?.toString(),
                          iconData: Icons.money),
                      customListTile(
                          title: S.of(context).bounce,
                          subTitle: model?.bounce?.toString(),
                          iconData: Icons.wallet_giftcard_rounded),
                    ]),
              ),
            ),
            Container(height: 75,)
          ],
        ),
        label: S.current.updateProfile,
        onTap: () {
          showDialog(
              context: context,
              builder: (_) {
                return Scaffold(
                  appBar: CustomTwaslnaAppBar.appBar(context, title: S.current.updateProfile),
                  body: UpdateProfile(updateProfile: (salary,bounce,status){
                    Navigator.of(context).pop();
                    screenState.enableCaptain(AcceptCaptainRequest(bounce:double.tryParse(bounce.isEmpty ? '0' : bounce),salary: double.parse(salary),
                    captainID: screenState.captainId.toString(),
                      status: status
                    ));
                  },salary:model?.salary.toString(),bounce:model?.bounce.toString(),status: model?.status,),
                );
              });
        });
  }
  Widget customListTile(
      {required String title, String? subTitle, required IconData iconData}) {
    var context = screenState.context;
    Widget? icon;
    if (title == S.current.captainStatus || title == S.current.status) {
      print(subTitle);
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
}

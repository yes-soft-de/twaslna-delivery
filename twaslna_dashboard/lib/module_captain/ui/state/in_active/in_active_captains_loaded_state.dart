import 'package:flutter/material.dart';
import 'package:twaslna_dashboard/abstracts/states/state.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/module_captain/captains_routes.dart';
import 'package:twaslna_dashboard/module_captain/model/inActiveModel.dart';
import 'package:twaslna_dashboard/module_captain/ui/screen/in_active_captains_screen.dart';
import 'package:twaslna_dashboard/utils/components/custom_list_view.dart';
import 'package:twaslna_dashboard/utils/components/empty_screen.dart';
import 'package:twaslna_dashboard/utils/components/error_screen.dart';
import 'package:twaslna_dashboard/utils/components/progresive_image.dart';

class InCaptainActiveLoadedState extends States {
  final InActiveCaptainsScreenState screenState;
  final String? error;
  final bool empty;
  final List<InActiveModel>? model;

  InCaptainActiveLoadedState(this.screenState, this.model,
      {this.empty = false, this.error})
      : super(screenState) {
    if (error != null) {
      screenState.refresh();
    }
  }
  String? id ;
  @override
  Widget getUI(BuildContext context) {
    if (error != null) {
      return ErrorStateWidget(
        onRefresh: () {
          screenState.getCaptains();
        },
        error: error,
      );
    } else if (empty) {
      return EmptyStateWidget(
          empty: S.current.emptyStaff,
          onRefresh: () {
            screenState.getCaptains();
          });
    }
    return CustomListView.custom(children:getCaptains(context));
  }

  List<Widget> getCaptains(BuildContext context) {
    List<Widget> widgets = [];
    model?.forEach((element) {
      widgets.add(Padding(
        padding: const EdgeInsets.all(16.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: (){
           Navigator.of(context).pushNamed(CaptainsRoutes.CAPTAIN_PROFILE,arguments: int.parse(element.captainID));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Theme.of(context).primaryColor,
            ),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0,right: 16,bottom: 8,top: 8),
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: ClipOval(
                     // borderRadius: BorderRadius.circular(25),
                      child:CustomNetworkImage(
                        width: 50,
                        height: 50,
                        imageSource: element.image,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(element.captainName,style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),),
                ),
                Padding(
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
                        Icons.arrow_forward,
                        color: Colors.white,
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

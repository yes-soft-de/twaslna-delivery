import 'package:flutter/material.dart';
import 'package:twaslna_dashboard/abstracts/states/state.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/module_captain/captains_routes.dart';
import 'package:twaslna_dashboard/module_filters/model/captain_filter_model.dart';
import 'package:twaslna_dashboard/module_filters/model/store_filter_model.dart';
import 'package:twaslna_dashboard/module_filters/ui/screen/captain_filter_screen.dart';
import 'package:twaslna_dashboard/module_filters/ui/screen/store_filter_screen.dart';
import 'package:twaslna_dashboard/module_logs/logs_routes.dart';
import 'package:twaslna_dashboard/utils/components/costom_search.dart';
import 'package:twaslna_dashboard/utils/components/custom_list_view.dart';
import 'package:twaslna_dashboard/utils/components/error_screen.dart';
import 'package:twaslna_dashboard/utils/components/fixed_container.dart';
import 'package:twaslna_dashboard/utils/components/progresive_image.dart';

class StoresFilterLoadedState extends States {
  final StoresFilterScreenState screenState;
  final String? error;
  final bool empty;
  final List<StoresFilterModel>? model;

  StoresFilterLoadedState(this.screenState, this.model,
      {this.empty = false, this.error})
      : super(screenState);

  String? id;
  String? search;

  @override
  Widget getUI(BuildContext context) {
    if (error != null) {
      return ErrorStateWidget(
        onRefresh: () {
          screenState.initFilterState();
        },
        error: error,
      );
    }
    return FixedContainer(child:CustomListView.custom(children: getCaptains(context)));
  }

  List<Widget> getCaptains(BuildContext context) {
    List<Widget> widgets = [];
    for (var element in model ?? <StoresFilterModel>[]) {
      widgets.add(Padding(
        padding: const EdgeInsets.only(
            right: 16.0, left: 16.0, bottom: 8.0, top: 8.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {
            Navigator.of(context).pushNamed(LogsRoutes.STORE_LOGS,
                arguments: element.id);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Theme.of(context).primaryColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16, bottom: 8, top: 8),
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: ClipOval(
                      // borderRadius: BorderRadius.circular(25),
                      child: CustomNetworkImage(
                        width: 50,
                        height: 50,
                        imageSource: element.image,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    element.storeOwnerName,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
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
    }

    widgets.insert(
        0,
        Padding(
          padding: EdgeInsets.only(left: 18.0, right: 18.0, bottom: 16,top: 16),
          child: CustomDeliverySearch(
            hintText: S.current.searchForStore,
            onChanged: (s) {
              if (s == '' || s.isEmpty) {
                search = null;
                screenState.refresh();
              } else {
                search = s;
                screenState.refresh();
              }
            },
          ),));
    widgets.insert(
        1,
        Padding(
          padding: EdgeInsets.only(left: 18.0, right: 18.0, bottom: 16,top: 16),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                )
            ),
            onPressed:search != null ? () => screenState.getFilters(search!): null,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(S.current.search,style: TextStyle(color:search != null ? Colors.white : null),),
            ),
          ),));
    widgets.insert(
        2,
        Padding(
          padding: EdgeInsets.only(left: 36.0, right: 36.0),
          child: Divider(color: Theme.of(context).disabledColor.withOpacity(0.1),thickness: 2.0,),));

    return widgets;

  }
}

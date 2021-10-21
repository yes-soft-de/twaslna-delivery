import 'package:flutter/material.dart';
import 'package:twaslna_dashboard/abstracts/states/state.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/module_filters/model/store_filter_model.dart';
import 'package:twaslna_dashboard/module_filters/ui/screen/store_filter_screen.dart';
import 'package:twaslna_dashboard/module_filters/ui/widget/store_card_filter.dart';
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
      widgets.add(StoreFilterCard(
        storeName: element.storeOwnerName,
        storeId: element.id.toString(),
        image: element.image,
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

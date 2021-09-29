import 'package:twaslna_dashboard/abstracts/states/state.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/module_stores/model/store_profile_model.dart';
import 'package:twaslna_dashboard/module_stores/ui/screen/store_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:twaslna_dashboard/utils/components/custom_list_view.dart';
import 'package:twaslna_dashboard/utils/components/empty_screen.dart';
import 'package:twaslna_dashboard/utils/components/error_screen.dart';
import 'package:twaslna_dashboard/utils/components/fixed_container.dart';
import 'package:twaslna_dashboard/utils/components/progresive_image.dart';

class StoreProfileLoadedState extends States {
  final StoreInfoScreenState screenState;
  final StoreProfileModel? profile;
  final String? error;
  final bool empty;

  StoreProfileLoadedState(this.screenState, this.profile,
      {this.error, this.empty = false})
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    if (error != null) {
      return ErrorStateWidget(
        onRefresh: () {
          screenState.getStore(screenState.model?.id ?? -1);
        },
        error: error,
      );
    } else if (empty) {
      return EmptyStateWidget(
          empty: S.current.emptyStaff,
          onRefresh: () {
            screenState.getStore(screenState.model?.id ?? -1);
          });
    }
    return FixedContainer(
        child: CustomListView.custom(children: [
      Container(
        width: double.maxFinite,
        height: MediaQuery.of(context).size.height * 0.30,
        child: CustomNetworkImage(
          imageSource: profile?.image ?? '',
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height * 0.30,
        ),
      ),
      Container(
        width: double.maxFinite,
        color: Theme.of(context).backgroundColor,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 16.0, bottom: 16, left: 8, right: 8),
          child: Center(
            child: Text(
              S.current.storeInfo,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).disabledColor,
              ),
            ),
          ),
        ),
      ),
      CustomListTile(
        title: S.current.storeName,
        subTitle: profile?.storeOwnerName,
      ),
      CustomListTile(
        title: S.current.categoryName,
        subTitle: screenState.model?.categoryId,
      ),
      CustomListTile(
        title: S.current.storePhone,
        subTitle: profile?.phone,
      ),
      CustomListTile(
        title: S.current.deliverPrice,
        subTitle:
            '${screenState.model?.deliveryCost.toString() ?? 0} ${S.current.sar}',
      ),
      CustomListTile(
        title: S.current.openingTime,
        subTitle: profile?.openingTime,
      ),
      CustomListTile(
        title: S.current.closingTime,
        subTitle: profile?.closingTime,
      ),
      CustomListTile(title: S.current.products, serve: profile?.hasProducts),
      CustomListTile(
          title: S.current.privateOrder, serve: profile?.privateOrders),
      Container(
        width: double.maxFinite,
        color: Theme.of(context).backgroundColor,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 16.0, bottom: 16, left: 8, right: 8),
          child: Text(''),
        ),
      ),
    ]));
  }

  Widget CustomListTile(
      {required String title, String? subTitle, bool? serve}) {
    var context = screenState.context;
    if (serve != null) {
      return Flex(
        direction: Axis.horizontal,
        children: [
          Container(
            width: 130,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                border: Border.symmetric(
                  horizontal: BorderSide(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      width: 1),
                )),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, bottom: 16, left: 8, right: 8),
              child: Text(title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
          Container(
            width: 4,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          Expanded(
              child: Container(
            color: serve ? Colors.green : Colors.red,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 16.0, bottom: 16, left: 8, right: 8),
              child: Center(
                child: Text(
                  serve ? S.current.serve : S.current.notServe,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ))
        ],
      );
    }
    return Flex(
      direction: Axis.horizontal,
      children: [
        Container(
          width: 130,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              border: Border.symmetric(
                horizontal: BorderSide(
                    color: Theme.of(context).scaffoldBackgroundColor, width: 1),
              )),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 16.0, bottom: 16, left: 8, right: 8),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
            ),
          ),
        ),
        Container(
          width: 4,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        Expanded(
            child: Container(
          color: Theme.of(context).backgroundColor,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 16.0, bottom: 16, left: 8, right: 8),
            child: Text(
              subTitle ?? '',
              style: TextStyle(
                color: Theme.of(context).disabledColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ))
      ],
    );
  }
}

import 'package:twaslna_dashboard/abstracts/states/state.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/module_captain/captains_routes.dart';
import 'package:twaslna_dashboard/module_captain/model/captain_model_payment_model.dart';
import 'package:twaslna_dashboard/module_captain/ui/screen/catpains_payment_screen.dart';
import 'package:twaslna_dashboard/module_payments/payments_routes.dart';
import 'package:twaslna_dashboard/utils/components/costom_search.dart';
import 'package:twaslna_dashboard/utils/components/custom_list_view.dart';
import 'package:twaslna_dashboard/utils/components/empty_screen.dart';
import 'package:twaslna_dashboard/utils/components/error_screen.dart';
import 'package:twaslna_dashboard/utils/components/fixed_container.dart';
import 'package:twaslna_dashboard/utils/components/progresive_image.dart';
import 'package:flutter/material.dart';

class CaptainsPaymentsLoadedState extends States {
  final CaptainsPaymentsScreenState screenState;
  final String? error;
  final bool empty;
  final List<CaptainPaymentModel>? model;

  CaptainsPaymentsLoadedState(this.screenState, this.model,
      {this.empty = false, this.error})
      : super(screenState) {
    if (error != null) {
      screenState.refresh();
    }
  }

  String? id;
  String? search;

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
    return FixedContainer(child: CustomListView.custom(children: getCaptains(context)));
  }

  List<Widget> getCaptains(BuildContext context) {
    List<Widget> widgets = [];
    for (var element in model ?? <CaptainPaymentModel>[]) {

      if (!element.captainName!.contains(search ?? '') && search != null) {
        continue;
      }

      widgets.add(Padding(
        padding: const EdgeInsets.only(left:16.0,right: 16.0,bottom: 8.0,top:8.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {
            Navigator.of(context).pushNamed(PaymentsRoutes.PAYMENTS_TO_CAPTAIN,
                arguments: int.parse(element.captainID));
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
                        imageSource: element.image ?? '',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    element.captainName ?? '',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: element.remainingAmountForCaptain! > 0
                          ? Colors.green
                          : Colors.red),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 8, left: 16.0, right: 16),
                    child: Text(
                      element.remainingAmountForCaptain.toString() +
                          ' ' +
                          S.current.sar,
                      style: TextStyle(color: Colors.white),
                    ),
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

    if (model != null) {
      widgets.insert(
          0,
          Padding(
            padding: EdgeInsets.only(left: 18.0, right: 18.0, bottom: 16),
            child: CustomDeliverySearch(
              hintText: S.current.searchingForCaptain,
              onChanged: (s) {
                if (s == '' || s.isEmpty) {
                  search = null;
                  screenState.refresh();
                } else {
                  search = s;
                  screenState.refresh();
                }
              },
            ),
          ));
    }

    return widgets;
  }
}

import 'package:intl/intl.dart' as intl;
import 'package:twaslna_dashboard/abstracts/states/state.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/module_captain/model/balance_model.dart';
import 'package:twaslna_dashboard/module_captain/model/porfile_model.dart';
import 'package:twaslna_dashboard/module_payments/request/captain_payments_request.dart';
import 'package:twaslna_dashboard/module_payments/ui/screen/paymen_from_captain_screen.dart';
import 'package:twaslna_dashboard/utils/components/custom_feild.dart';
import 'package:twaslna_dashboard/utils/components/empty_screen.dart';
import 'package:twaslna_dashboard/utils/components/error_screen.dart';
import 'package:flutter/material.dart';
import 'package:twaslna_dashboard/utils/components/fixed_container.dart';
import 'package:twaslna_dashboard/utils/effect/hidder.dart';

class PaymentsForCaptainLoadedState extends States {
  final PaymentsFromCaptainScreenState screenState;
  final String? error;
  final bool empty;
  final ProfileModel? model;
  final BalanceModel? balanceModel;

  PaymentsForCaptainLoadedState(this.screenState, this.model, this.balanceModel,
      {this.empty = false, this.error})
      : super(screenState) {
    if (error != null) {
      screenState.refresh();
    }
    accountBalance = balanceModel?.data;
  }

  final _amount = TextEditingController();
  String? id;

  AccountBalance? accountBalance;

  @override
  Widget getUI(BuildContext context) {
    if (error != null) {
      return ErrorStateWidget(
        onRefresh: () {
          screenState.getPayments();
        },
        error: error,
      );
    } else if (empty) {
      return EmptyStateWidget(
          empty: S.current.emptyStaff,
          onRefresh: () {
            screenState.getPayments();
          });
    }
    return FixedContainer(
      child:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16),
          child: Flex(
            direction: Axis.vertical,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 12.0, bottom: 8, right: 12, top: 16.0),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    S.current.paymentAmount,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              CustomFormField(
                controller: _amount,
                hintText: S.current.paymentAmount,
                last: true,
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    screenState.pay(CaptainPaymentsRequest(
                        captainId: screenState.captainId,
                        amount: num.parse(_amount.text.trim())));
                  },
                  style: ElevatedButton.styleFrom(
                    onSurface: Theme.of(context).primaryColor,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        S.current.pay,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 32.0, left: 32),
                child: Divider(
                  thickness: 2.5,
                  color: Theme.of(context).backgroundColor,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              // Center(
              //   child: Padding(
              //     padding: const EdgeInsets.all(16.0),
              //     child: Text(
              //       S.current.captainInfo,
              //       style: TextStyle(
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ),
              // ),
              // Container(
              //   decoration: BoxDecoration(
              //     color: Theme.of(context).backgroundColor,
              //     borderRadius: BorderRadius.circular(25),
              //   ),
              //   child: Column(
              //     children: [
              //       customListTile(
              //           title: S.of(context).name,
              //           subTitle: model?.name,
              //           iconData: Icons.person),
              //       customListTile(
              //           title: S.of(context).phone,
              //           subTitle: model?.phone,
              //           iconData: Icons.phone),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 16,
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(right: 32.0, left: 32),
              //   child: Divider(
              //     thickness: 2.5,
              //     color: Theme.of(context).backgroundColor,
              //   ),
              // ),
              SizedBox(
                height: 16,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    S.current.captainInfoBalance,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    // customListTile(
                    //     title: S.of(context).salary,
                    //     subTitle: accountBalance?.salary.toString(),
                    //     iconData: Icons.money),
                    customListTile(
                        title: S.of(context).remainingAmountForCompany,
                        subTitle:
                        accountBalance?.remainingAmountForCompany.toString(),
                        iconData: Icons.monetization_on_rounded),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 32.0, left: 32),
                child: Divider(
                  thickness: 2.5,
                  color: Theme.of(context).backgroundColor,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              getCaptainPaymentFrom(),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      )
    );
  }

  Widget getCaptainPaymentFrom() {
    List<Widget> widgets = [];
    widgets.add(Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          S.current.paymentsFromCaptain,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),);
    accountBalance?.paymentsFromCaptain.forEach((element) {
      widgets.add(Padding(
        padding: const EdgeInsets.only(top:8.0,bottom: 8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Theme.of(screenState.context).backgroundColor,
          ),
          child: ListTile(
            leading: Icon(Icons.credit_card_rounded),
            title:Text(S.current.paymentAmount),
            subtitle:Text(element.amount.toString()),
            trailing: Text(intl.DateFormat.yMMMMEEEEd().format(element.paymentDate)),
          ),
        ),
      ));
    });
    return Hider(
      active: accountBalance?.paymentsFromCaptain.isNotEmpty ?? false,
      child: Column(
        children: widgets,
      ),
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
            child: Icon(iconData, color: Theme.of(context).disabledColor),
          )),
      title: Text(
        title,
        style: TextStyle(),
      ),
      trailing: icon,
      subtitle: Text(
        subTitle ?? S.current.unknown,
        style: TextStyle(),
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
}

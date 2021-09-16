import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/module_orders/ui/screen/order_details_screen.dart';
import 'package:twaslna_dashboard/module_orders/ui/state/order_details_state/order_details_state.dart';
import 'package:twaslna_dashboard/utils/components/custom_app_bar.dart';
import 'package:twaslna_dashboard/utils/images/images.dart';


class OrderDetailsErrorState extends OrderDetailsState {
  final String error;
  OrderDetailsScreenState screenState;
  final int id;
  OrderDetailsErrorState(this.screenState, this.error,this.id) : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Scaffold(
      appBar: CustomTwaslnaAppBar.appBar(context, title:S.of(context).orderDetails,buttonBackground:Colors.red),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Flex(
            direction: Axis.vertical,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Flushbar(
                  title:S.of(context).thisErrorHappened,
                  message:error,
                  icon: Icon(
                    Icons.info,
                    size: 28.0,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                  flushbarStyle: FlushbarStyle.FLOATING,
                ),
              ),
              Container(height: 24,),
              SvgPicture.asset(
                SvgAsset.ERROR_SVG,
                height: MediaQuery.of(context).size.height * 0.5,
              ),
              Container(height: 32,),
              Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 0),
                      onPressed: () async {
                        screenState.getOrderDetails(id);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          S.of(context).refresh,
                          style: TextStyle(color: Colors.white),
                        ),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}

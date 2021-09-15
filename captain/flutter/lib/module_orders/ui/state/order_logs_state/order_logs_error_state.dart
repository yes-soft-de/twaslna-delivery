import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twaslna_captain/generated/l10n.dart';
import 'package:twaslna_captain/module_orders/ui/screens/order_logs_screen.dart';
import 'package:twaslna_captain/module_orders/ui/state/order_logs_state/order_logs_state.dart';
import 'package:twaslna_captain/utils/images/images.dart';



class OrderLogsErrorState extends OrderLogsState {
  final String error;
  OrderLogsScreenState screenState;

  OrderLogsErrorState(this.screenState, this.error) : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return SingleChildScrollView(
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
              height: MediaQuery.of(context).size.height * 0.45,
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
                    await  screenState.getOrders();
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
    );
  }
}

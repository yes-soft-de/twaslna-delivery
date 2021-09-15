import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:twaslna_captain/generated/l10n.dart';
import 'package:twaslna_captain/module_orders/ui/screens/order_status/order_status_screen.dart';
import 'package:twaslna_captain/module_orders/ui/state/order_status/order_status.state.dart';
import 'package:twaslna_captain/utils/components/custom_app_bar.dart';
import 'package:twaslna_captain/utils/images/images.dart';

class OrderDetailsEmptyState extends OrderDetailsState {
  final String empty;
  final int id;
  OrderStatusScreenState screenState;

  OrderDetailsEmptyState(this.screenState, this.empty,this.id) : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: Flex(
        direction: Axis.vertical,
        children: [
          Container(height: 50,),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Text(
                empty,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ),
          ),
          SvgPicture.asset(
            SvgAsset.EMPTY_SVG,
            height: MediaQuery.of(context).size.height * 0.45,
          ),
          Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
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
    );
  }
}

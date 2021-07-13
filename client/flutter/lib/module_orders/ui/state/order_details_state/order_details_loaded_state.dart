import 'package:dotted_line/dotted_line.dart';
import 'package:twaslna_delivery/consts/order_status.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_orders/model/order_details_model.dart';
import 'package:twaslna_delivery/module_orders/orders_routes.dart';
import 'package:twaslna_delivery/module_orders/ui/screen/order_details_screen.dart';
import 'package:twaslna_delivery/module_orders/ui/state/order_details_state/order_details_state.dart';
import 'package:flutter/material.dart';
import 'package:twaslna_delivery/module_orders/ui/widget/order_details/bill.dart';
import 'package:twaslna_delivery/module_orders/ui/widget/order_details/order_chip.dart';
import 'package:twaslna_delivery/module_orders/ui/widget/order_details/order_details_app_bar.dart';
import 'package:twaslna_delivery/module_orders/ui/widget/order_details/order_details_title_bar.dart';
import 'package:twaslna_delivery/utils/helpers/order_status_helper.dart';

class OrderDetailsLoadedState extends OrderDetailsState {
  OrderDetailsScreenState screenState;
  OrderDetailsModel orderDetails;

  OrderDetailsLoadedState(this.screenState, this.orderDetails)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Image.network(
          'https://www.gannett-cdn.com/media/2020/03/23/USATODAY/usatsports/247WallSt.com-247WS-657876-imageforentry9-vp7.jpg?width=660&height=371&fit=crop&format=pjpg&auto=webp',
          height: height,
          width: width,
          fit: BoxFit.cover,
        ),
        CustomOrderDetailsAppBar(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(right: 28.0, left: 28, bottom: 16),
                child: OrderDetailsTitleBar(
                  title: orderDetails.storeInfo.storeOwnerName,
                  rate: 4.7,
                ),
              ),
              Container(
                height: height * 0.70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
                  color: Theme.of(context).cardColor,
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: ListView(
                        physics: BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 12.0,
                                left: 12.0,
                                bottom: 25.0,
                                top: 25.0),
                            child: Text(
                              '${S.of(context).orderDetails} #${orderDetails.order.id}',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Theme.of(context).primaryColor),
                              child: ListTile(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(OrdersRoutes.ORDER_STATUS,arguments:orderDetails.order.id.toString());
                                },
                                title: Text(
                                  S.of(context).orderStatus,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                subtitle: Text(
                                  StatusHelper.getOrderStatusMessages(
                                      orderDetails.order.state),
                                  style: TextStyle(color: Colors.white),
                                ),
                                leading: Icon(
                                  StatusHelper.getOrderStatusIcon(
                                      orderDetails.order.state),
                                  color: Colors.white,
                                  size: 35,
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                         orderDetails.carts.isNotEmpty?Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: ListTile(
                              leading: Icon(
                                Icons.shopping_cart_rounded,
                                color: Theme.of(context).disabledColor,
                                size: 25,
                              ),
                              title: Text(
                                S.of(context).orderList,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                          ):Container(),
                          orderDetails.carts.isNotEmpty? ListView(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            children: getOrdersList(orderDetails.carts),
                          ):Container(),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: BillCard(id: orderDetails.order.id,deliveryCost: orderDetails.order.deliveryCost,orderCost: orderDetails.order.orderCost,),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> getOrdersList(List<Item> carts) {
    List<Widget> orderChips = [];
    carts.forEach((element) {
      orderChips.add(OrderChip(
        title: element.productName,
        image: element.productImage,
        price: element.productPrice,
        currency: S.current.sar,
        quantity: (q) {},
        editable: false,
        defaultQuantity: element.countProduct,
      ));
      orderChips.add(Padding(
        padding: const EdgeInsets.only(right: 8.0, left: 8.0),
        child: DottedLine(
          dashColor: Theme.of(screenState.context).backgroundColor,
          lineThickness: 2.5,
          dashLength: 6,
        ),
      ));
    });
    return orderChips;
  }
}

import 'package:dotted_line/dotted_line.dart';
import 'package:twaslna_delivery/consts/order_status.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_main/main_routes.dart';
import 'package:twaslna_delivery/module_orders/model/order_details_model.dart';
import 'package:twaslna_delivery/module_orders/orders_routes.dart';
import 'package:twaslna_delivery/module_orders/ui/screen/order_details_screen.dart';
import 'package:twaslna_delivery/module_orders/ui/state/order_details_state/order_details_edit_state.dart';
import 'package:twaslna_delivery/module_orders/ui/state/order_details_state/order_details_state.dart';
import 'package:flutter/material.dart';
import 'package:twaslna_delivery/module_orders/ui/widget/order_details/bill.dart';
import 'package:twaslna_delivery/module_orders/ui/widget/order_details/order_chip.dart';
import 'package:twaslna_delivery/module_orders/ui/widget/order_details/order_details_app_bar.dart';
import 'package:twaslna_delivery/module_orders/ui/widget/order_details/order_details_title_bar.dart';
import 'package:twaslna_delivery/module_our_services/ui/widget/custom_field_send_it.dart';
import 'package:twaslna_delivery/module_our_services/ui/widget/label_text.dart';
import 'package:twaslna_delivery/module_stores/presistance/cart_hive_box_helper.dart';
import 'package:twaslna_delivery/utils/components/progresive_image.dart';
import 'package:twaslna_delivery/utils/helpers/order_status_helper.dart';

class OrderDetailsLoadedState extends OrderDetailsState {
  OrderDetailsScreenState screenState;
  OrderDetailsModel orderDetails;

  OrderDetailsLoadedState(this.screenState, this.orderDetails)
      : super(screenState);
  bool get edit => screenState.edit;
  @override
  Widget getUI(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        await Navigator.of(context).pushNamedAndRemoveUntil(MainRoutes.MAIN_SCREEN, (route) => false,arguments: 1);
        return !edit ;
      },
      child: Stack(
        children: [
          orderDetails.order.orderType != 3 ? CustomNetworkImage(
           image: orderDetails.storeInfo.image,
            height: height,
            width: width,
          
          ) : Container(color: Theme.of(context).primaryColor,height:height,width:width,),
          CustomOrderDetailsAppBar(
            editTap:orderDetails.order.state == OrderStatus.WAITING || orderDetails.order.state == OrderStatus.GOT_CAPTAIN ? () {
              screenState.edit = true;
              screenState.currentState =
                  OrderDetailsEditState(screenState, orderDetails);
              screenState.refresh();
            }:null,
            deleteTap:orderDetails.order.removable! && orderDetails.order.state == OrderStatus.WAITING ? () {
              screenState.deleteOrder(screenState.orderNumber ?? -1);
            }:null,
           collapsed:orderDetails.order.orderType == 3,
            edit:edit,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                orderDetails.order.orderType == 3 ?Container(): Padding(
                  padding:
                      const EdgeInsets.only(right: 28.0, left: 28, bottom: 16),
                  child: OrderDetailsTitleBar(
                    title: orderDetails.storeInfo.storeOwnerName,
                    rate: 4.7,
                  ),
                ) ,
                Container(
                  height:orderDetails.order.orderType == 3 ? height * 0.875 : height * 0.70,
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
                                '${S.of(context).orderDetails} #${screenState.orderNumber}',
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
                                    Navigator.of(context).pushNamed(
                                        OrdersRoutes.ORDER_STATUS,
                                        arguments:
                                            screenState.orderNumber.toString());
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
                            getOrderTypeWidget(orderDetails.order.orderType),
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
      ),
    );
  }

  Widget getOrderTypeWidget(int orderType) {
    var context = screenState.context;
    String note = orderDetails.order.note ?? '';
    if (orderType == 1) {
      return Flex(
        direction: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: ListTile(
              leading: Icon(
                Icons.shopping_cart_rounded,
                color: Theme.of(context).disabledColor,
                size: 25,
              ),
              title: Text(
                S.of(context).orderList,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
          ListView(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            children: getOrdersList(orderDetails.carts),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: BillCard(
              id: screenState.orderNumber!,
              deliveryCost: orderDetails.order.deliveryCost,
              orderCost: orderDetails.order.orderCost,
            ),
          )
        ],
      );
    } else if (orderType == 2) {
      return Flex(
        direction: Axis.vertical,
        children: [
          ListTile(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(S.current.orderDetails),
            ),
            subtitle: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(screenState.context).backgroundColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  orderDetails.order.orderDetails ?? '',
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ),
          note.isNotEmpty ? ListTile(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(S.current.note),
            ),
            subtitle: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(screenState.context).backgroundColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  orderDetails.order.note ?? '',
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ):Container(),
        ],
      );
    } else if (orderType == 3) {
      return Flex(
        direction: Axis.vertical,
        children: [
          ListTile(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(S.current.orderDetails),
            ),
            subtitle: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(screenState.context).backgroundColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  orderDetails.order.orderDetails ?? '',
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ),
          note.isNotEmpty ? ListTile(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(S.current.note),
            ),
            subtitle: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(screenState.context).backgroundColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  orderDetails.order.note ?? '',
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ):Container(),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(S.current.recipientName),
            ),
            subtitle: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(screenState.context).backgroundColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  orderDetails.order.recipientName ?? '',
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(S.current.recipientPhoneNumber),
            ),
            subtitle: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(screenState.context).backgroundColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  orderDetails.order.recipientPhoneNumber ?? '',
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ),
        ],
      );
    }
    return Container();
  }

  List<Widget> getOrdersList(List<Item> carts) {
    List<Widget> orderChips = [];
    carts.forEach((element) {
      orderChips.add(OrderChip(
        productID: element.productID,
        title: element.productName,
        image: element.productImage,
        price: element.productPrice,
        currency: S.current.sar,
        quantity: (p) {},
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

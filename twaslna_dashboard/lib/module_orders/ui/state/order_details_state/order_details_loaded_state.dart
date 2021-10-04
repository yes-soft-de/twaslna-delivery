import 'package:dotted_line/dotted_line.dart';
import 'package:twaslna_dashboard/consts/order_status.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/module_chat/chat_routes.dart';
import 'package:twaslna_dashboard/module_orders/model/order_details_model.dart';
import 'package:twaslna_dashboard/module_orders/ui/screen/order_details_screen.dart';
import 'package:twaslna_dashboard/module_orders/ui/state/order_details_state/order_details_state.dart';
import 'package:flutter/material.dart';
import 'package:twaslna_dashboard/module_orders/ui/widget/invoice.dart';
import 'package:twaslna_dashboard/module_orders/ui/widget/order_details/bill.dart';
import 'package:twaslna_dashboard/module_orders/ui/widget/order_details/order_chip.dart';
import 'package:twaslna_dashboard/utils/components/fixed_container.dart';
import 'package:twaslna_dashboard/utils/components/progresive_image.dart';
import 'package:twaslna_dashboard/utils/effect/hidder.dart';
import 'package:twaslna_dashboard/utils/helpers/order_status_helper.dart';

class OrderDetailsLoadedState extends OrderDetailsState {
  OrderDetailsScreenState screenState;
  OrderDetailsModel orderDetails;

  OrderDetailsLoadedState(this.screenState, this.orderDetails)
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return FixedContainer(child: ListView(
      physics: BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics()),
      children: [
        Hider(
          active: orderDetails.order.orderType != 3,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0,bottom: 8),
            child: CustomNetworkImage(
              imageSource: orderDetails.storeInfo.image,
              height: height*0.3,
              width: width,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              '${orderDetails.order.orderType != 3 ? orderDetails.storeInfo.storeOwnerName : S.current.deliverForMe}',
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Hider(
          active:orderDetails.order.invoiceImage != null && orderDetails.order.invoiceAmount != null,
          child: CustomInvoiceAlert(
            image:orderDetails.order.invoiceImage.toString(),
            cost: orderDetails.order.invoiceAmount.toString(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: StatusHelper.getOrderStatusColor(
                    orderDetails.order.state)),
            child: ListTile(
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
            ),
          ),
        ),
        orderDetails.order.roomID.isNotEmpty && orderDetails.order.state != OrderStatusEnum.WAITING ? Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Theme.of(context).primaryColor),
            child: ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(
                    ChatRoutes.chatRoute,
                    arguments:orderDetails.order.roomID);
              },
              title: Text(
                S.of(context).chatWithClient,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              subtitle: Text(
                S.of(context).openChatRoom,
                style: TextStyle(color: Colors.white),
              ),
              leading: Icon(
                Icons.sms,
                color: Colors.white,
                size: 35,
              ),
              trailing: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
          ),
        ) :SizedBox(),
        getOrderTypeWidget(orderDetails.order.orderType),
        SizedBox(
          height: 35,
        ),
      ],
    ),);
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

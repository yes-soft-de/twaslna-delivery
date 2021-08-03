import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_orders/model/order_details_model.dart';
import 'package:twaslna_delivery/module_orders/request/client_order_request.dart';
import 'package:twaslna_delivery/module_orders/ui/screen/order_details_screen.dart';
import 'package:twaslna_delivery/module_orders/ui/state/order_details_state/order_details_loaded_state.dart';
import 'package:twaslna_delivery/module_orders/ui/state/order_details_state/order_details_state.dart';
import 'package:twaslna_delivery/module_orders/ui/widget/order_details/bill.dart';
import 'package:twaslna_delivery/module_orders/ui/widget/order_details/custom_order_details_app_bar.dart';
import 'package:twaslna_delivery/module_orders/ui/widget/order_details/order_chip.dart';
import 'package:twaslna_delivery/module_our_services/ui/widget/custom_field_send_it.dart';
import 'package:twaslna_delivery/module_our_services/ui/widget/label_text.dart';

class OrderDetailsEditState extends OrderDetailsState {
  OrderDetailsScreenState screenState;
  OrderDetailsModel orderDetails;

  OrderDetailsEditState(this.screenState, this.orderDetails)
      : super(screenState) {
    screenState.clientOrderRequest = ClientOrderRequest(
      ownerID: orderDetails.order.ownerID,
      payment: orderDetails.order.payment,
      note: orderDetails.order.note,
      orderNumber: screenState.orderNumber,
      destination: GeoJson(
          long: orderDetails.order.destination?.long,
          lat: orderDetails.order.destination?.lat),
      deliveryDate: orderDetails.order.deliveryDate,
      deliveryCost: orderDetails.order.deliveryCost,
      orderCost: orderDetails.order.orderCost,
      products: toProducts(orderDetails.carts),
      detail: orderDetails.order.orderDetails,
      recipientName: orderDetails.order.recipientName,
      recipientPhone: orderDetails.order.recipientPhoneNumber,
      orderType: orderDetails.order.orderType
    );
    total = orderDetails.order.orderCost;
    orderDetailsController.text = orderDetails.order.orderDetails ?? '';
    noteController.text = orderDetails.order.note ?? '';
    receiptNameController.text = orderDetails.order.recipientName ?? '';
    phoneNumberController.text = orderDetails.order.recipientPhoneNumber ?? '';
  }

  double total = 0;
  TextEditingController orderDetailsController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController receiptNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  final GlobalKey<FormState> _edit = GlobalKey<FormState>();

  @override
  Widget getUI(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        screenState.currentState =
            OrderDetailsLoadedState(screenState, orderDetails);
        screenState.refresh();
        return false;
      },
      child: Stack(
        children: [
          Container(
            height: height,
            width: width,
            color: Theme.of(context).primaryColor,
          ),
          CustomOrderDetailsAppBar(
            onTap: () {
              screenState.currentState =
                  OrderDetailsLoadedState(screenState, orderDetails);
              screenState.refresh();
            },
            onSave: () {
              if (orderDetails.order.orderType != 1){
                screenState.clientOrderRequest?.products = null;
                screenState.clientOrderRequest?.detail = orderDetailsController.text.isEmpty ? null : orderDetailsController.text;
                screenState.clientOrderRequest?.note =noteController.text.isEmpty ? null : noteController.text;
                screenState.clientOrderRequest?.recipientName =receiptNameController.text.isEmpty ? null : receiptNameController.text;
                screenState.clientOrderRequest?.recipientPhone = phoneNumberController.text.isEmpty ? null : phoneNumberController.text;
              if (orderDetails.order.orderType == 3){
                screenState.clientOrderRequest?.ownerID = null;
              }
              if (_edit.currentState!.validate()){
                screenState.updateClientOrder();
              }
              }
              else {
                screenState.updateClientOrder();
              }
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height * 0.89,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
                color: Theme.of(context).cardColor,
              ),
              child: Stack(
                children: [
                  ListView(
                    padding: EdgeInsets.all(8),
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    children: [
                      ListTile(
                        leading: Icon(Icons.info),
                        title: Text(S.of(context).updateOrderNote),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                        child: Divider(
                          color: Theme.of(context).backgroundColor,
                          thickness: 2.5,
                        ),
                      ),
                      getOrderTypeWidget(orderDetails.order.orderType),
                      SizedBox(
                        height: 75,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getOrderTypeWidget(int orderType) {
    var context = screenState.context;
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
              orderCost: total,
            ),
          ),
        ],
      );
    } else if (orderType == 2) {
      return Flex(
        direction: Axis.vertical,
        children: [
          Form(
            key:_edit,
            child: ListTile(
              title: LabelText(S.of(context).orderDetails),
              subtitle: CustomSendItFormField(
                maxLines: 7,
                hintText: S.of(context).orderDetailHint,
                controller: orderDetailsController,
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          ListTile(
            title: LabelText(S.of(context).note),
            subtitle: CustomSendItFormField(
              maxLines: 7,
              hintText: S.of(context).note,
              controller: noteController,
            ),
          ),
        ],
      );
    } else if (orderType == 3) {
      return Form(
        key:_edit,
        child: Flex(
          direction: Axis.vertical,
          children: [
            ListTile(
              title: LabelText(S.of(context).orderDetails),
              subtitle: CustomSendItFormField(
                maxLines: 7,
                hintText: S.of(context).orderDetailHint,
                controller: orderDetailsController,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ListTile(
              title: LabelText(S.of(context).note),
              subtitle: CustomSendItFormField(
                maxLines: 7,
                hintText: S.of(context).note,
                controller: noteController,
                validator: false,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ListTile(
              title: LabelText(S.of(context).recipientName),
              subtitle: CustomSendItFormField(
                hintText: S.of(context).nameHint,
                controller: receiptNameController,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ListTile(
              title: LabelText(S.of(context).recipientPhoneNumber),
              subtitle: CustomSendItFormField(
                hintText: S.of(context).pleaseInputPhoneNumber,
                numbers: true,
                controller: phoneNumberController,
                maxLines: 1,
              ),
            ),
          ],
        ),
      );
    }
    return Container();
  }

  List<Widget> getOrdersList(List<Item> carts) {
    List<Widget> orderChips = [];
    carts.forEach((element) {
      orderChips.add(OrderChip(
        title: element.productName,
        image: element.productImage,
        price: element.productPrice,
        currency: S.current.sar,
        quantity: (q, price) {
          if (q == 0) {
            screenState.clientOrderRequest?.products
                ?.removeWhere((item) => item.productID == element.productID);
          } else {
            screenState.clientOrderRequest?.products
                ?.removeWhere((item) => item.productID == element.productID);
            screenState.clientOrderRequest?.products?.add(Products(
                productID: element.productID, countProduct: q, price: price));
          }
          updateTotal();
          screenState.refresh();
        },
        editable: true,
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

  List<Products> toProducts(List<Item> carts) {
    List<Products> products = [];
    carts.forEach((element) {
      products.add(Products(
          productID: element.productID,
          countProduct: element.countProduct,
          price: element.productPrice));
    });
    return products;
  }

  void updateTotal() {
    double currentTotal = 0;
    screenState.clientOrderRequest?.products?.forEach((element) {
      currentTotal =
          (element.countProduct!.toDouble() * element.price!) + currentTotal;
    });
    total = currentTotal;
    screenState.clientOrderRequest?.orderCost = total;
  }
}

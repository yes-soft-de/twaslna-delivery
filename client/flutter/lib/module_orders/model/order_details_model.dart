import 'package:intl/intl.dart';
import 'package:twaslna_delivery/consts/order_status.dart';
import 'package:twaslna_delivery/module_orders/response/order_details_response.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/utils/helpers/order_status_helper.dart';

class OrderDetailsModel {
  List<Item> carts;
  StoreOwnerInfo storeInfo;
  OrderInfo order;

  OrderDetailsModel(
      {required this.carts, required this.storeInfo, required this.order});
}

class Item {
  int productID;
  String productName;
  String productImage;
  double productPrice;
  int countProduct;
  int storeOwnerProfileID;
  int productCategoryID;
  String orderNumber;

  Item(
      {required this.productID,
      required this.productName,
      required this.productImage,
      required this.productPrice,
      required this.countProduct,
      required this.storeOwnerProfileID,
      required this.productCategoryID,
      required this.orderNumber});
}

class StoreOwnerInfo {
  String storeOwnerName;
  String storeOwnerID;
  String image;
  String imageURL;

  StoreOwnerInfo(
      {required this.storeOwnerName,
      required this.storeOwnerID,
      required this.image,
      required this.imageURL});
}

class OrderInfo {
  int id;
  OrderStatus state;
  String roomID;
  String ownerID;
  String deliveryDate;
  double deliveryCost;
  double orderCost;

  OrderInfo(
      {required this.id,
      required this.state,
      required this.roomID,
      required this.ownerID,
      required this.deliveryDate,
      required this.orderCost,
      required this.deliveryCost});
}

List<Item> toCartList(List<OrderDetails> ordersItems) {
  if (ordersItems.isEmpty) return <Item>[];
  List<Item> items = [];
  ordersItems.forEach((element) {
    items.add(Item(
        productID: element.productID ?? -1,
        productName: element.productName ?? S.current.product,
        productImage: element.productImage ??
            'https://cdn.vox-cdn.com/thumbor/R9xKyUPdU1ZVmGa6EQeh7FcPa_o=/0x0:4047x3035/1200x900/filters:focal(1700x1194:2346x1840):no_upscale()/cdn.vox-cdn.com/uploads/chorus_image/image/62343549/20150915-_Upland_Burger_3.0.0.0.0.jpg',
        productPrice: element.productPrice ?? 0,
        countProduct: element.countProduct ?? 1,
        storeOwnerProfileID: element.storeOwnerProfileID ?? -1,
        productCategoryID: element.productCategoryID ?? -1,
        orderNumber: element.orderNumber ?? '-1'));
  });
  return items;
}

OrderInfo toOrder(Order? order) {
  if (order != null) {
    return OrderInfo(
        id: order.id ?? -1,
        state: StatusHelper.getStatusEnum(order.state),
        roomID: order.roomID ?? 'roomID',
        ownerID: order.ownerID ?? '-1',
        deliveryDate: DateFormat('dd-MM-yyyy').format(
            DateTime.fromMillisecondsSinceEpoch(order.deliveryDate?.timestamp ??
                DateTime.now().millisecondsSinceEpoch * 1000)),
        orderCost: order.orderCost??0,
        deliveryCost: order.deliveryCost??0);
  } else {
    return OrderInfo(
        id: -1,
        state: OrderStatus.WAITING,
        roomID: 'roomID',
        ownerID: '-1',
        deliveryDate: DateFormat('dd-MM-yyyy').format(DateTime.now()),
        orderCost: 0,
        deliveryCost: 0);
  }
}

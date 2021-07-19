import 'package:twaslna_delivery/module_stores/model/cart_model.dart';
import 'package:twaslna_delivery/module_orders/request/client_order_request.dart';
class CheckoutModel {
  String? ownerId;
  List<Products>? cart;
  double? orderCost;
  double? deliveryCost;

  CheckoutModel({this.ownerId, this.cart, this.orderCost, this.deliveryCost});
}
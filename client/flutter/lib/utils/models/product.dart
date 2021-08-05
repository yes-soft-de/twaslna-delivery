import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_stores/response/products_by_category.dart';
import 'package:twaslna_delivery/module_stores/response/store_products.dart';

class ProductModel {
  late String title;
  late String image;
  late double price;
  late int id;
  int? quantity;

  ProductModel(
      {required this.title,
      required this.image,
      required this.price,
      required this.id,
      this.quantity = 0});

  List<ProductModel> models = [];

  bool empty = false;

  ProductModel.Empty() {
    empty = true;
  }

  String? error;

  ProductModel.Error(this.error);

  ProductModel.Data(ProductsByCategory productsByCategory) {
    productsByCategory.data?.forEach((element) {
      models.add(ProductModel(
          title: element.productName ?? S.current.product,
          image:
              'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
          price: element.productPrice ?? 0,
          id: element.id ?? -1));
    });
  }
  ProductModel.topWantedData(StoreProducts storeProducts) {
    storeProducts.data?.forEach((element) {
      models.add(ProductModel(
          title: element.productName ?? S.current.product,
          image:
          'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
          id: element.id ?? -1,
          price: element.productPrice ?? 0));
    });
  }


  bool get isEmpty => empty;

  bool get hasError => error != null;

  List<ProductModel> get data => models;
}

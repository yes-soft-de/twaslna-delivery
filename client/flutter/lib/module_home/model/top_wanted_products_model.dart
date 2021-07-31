import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_home/response/products.dart';

class TopWantedProductsModel {
  late String title;
  late String image;
  late double price;
  late int id;
  late int quantity;
  late int ownerId;
  late String storeName;
  late String storeImage;
  late String phone;
  late double deliveryCost;
  String? error;
  bool empty = false;
  List<TopWantedProductsModel> models = [];

  TopWantedProductsModel(
      {required this.title,
      required this.image,
      required this.price,
      required this.id,
      this.quantity = 0,
      required this.ownerId,
      required this.storeName,
      required this.storeImage,
      required this.phone,
      required this.deliveryCost});

  TopWantedProductsModel.Empty() {
    this.empty = true;
  }
  TopWantedProductsModel.Error(this.error);

  TopWantedProductsModel.Data(ProductsResponse topProducts) {
    var data = topProducts.data;
    data!.forEach((element) {
      models.add(TopWantedProductsModel(
          title: element.productName ?? S.current.product,
          image:
          'https://www.erdeundleben.com/wp-content/uploads/2021/02/folgendes-macht-unser-food-personal-wenn-es-fast-zu-mude-ist-um-zu-kochen-0-Yywyr8ju.jpg',
          price: element.productPrice ?? 0,
          id: element.id ?? -1,
          ownerId: element.storeOwnerProfileID ?? -1,
          storeImage: 'https://www.gannett-cdn.com/media/2020/03/23/USATODAY/usatsports/247WallSt.com-247WS-657876-imageforentry9-vp7.jpg?width=660&height=371&fit=crop&format=pjpg&auto=webp',
          storeName: element.storeOwnerName ?? S.current.storeOwner,
          phone: element.phone ?? '0',
          deliveryCost: element.deliveryCost??0
      ));});
  }

  bool get hasError => error != null;

  bool get isEmpty => empty;

  List<TopWantedProductsModel> get data {
    return models;
  }

}

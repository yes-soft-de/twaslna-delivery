import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_home/response/best_store.dart';
import 'package:twaslna_delivery/module_stores/response/store_category_list.dart';

class StoreModel {
  late int id;
  late String storeOwnerName;
  late String image;
  dynamic phone;
  dynamic location;
  late double deliveryCost;
  late bool hasProducts;
  late bool privateOrders;
  String? error;
  bool empty = false;
  List<StoreModel> models = [];

  StoreModel(
      {required this.deliveryCost,
      required this.id,
      required this.storeOwnerName,
      required this.image,
      this.phone,
      this.location,
      required this.hasProducts,
      required this.privateOrders});

  StoreModel.Empty() {
    this.empty = true;
  }

  StoreModel.Error(this.error);

  StoreModel.Data(StoreCategoryList bestStores) {
    var data = bestStores.data;
    data!.forEach((element) {
      models.add(StoreModel(
          id: element.id ?? -1,
          storeOwnerName: element.storeOwnerName ?? S.current.store,
          deliveryCost: element.deliveryCost ?? 0,
          hasProducts: element.hasProducts ?? false,
          privateOrders: element.privateOrders ?? false,
          image:
              'https://www.gannett-cdn.com/media/2020/03/23/USATODAY/usatsports/247WallSt.com-247WS-657876-imageforentry9-vp7.jpg?width=660&height=371&fit=crop&format=pjpg&auto=webp'));
    });
  }

  bool get hasError => error != null;

  bool get isEmpty => empty;

  List<StoreModel> get data {
    return models;
  }
}

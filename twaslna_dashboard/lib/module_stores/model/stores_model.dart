import 'dart:math';

import 'package:twaslna_dashboard/abstracts/data_model/data_model.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/module_stores/response/stores_response.dart';
import 'package:twaslna_dashboard/utils/images/images.dart';


class StoresModel extends DataModel {
  int id = -1;
  String storeOwnerName = '';
  String categoryId = '';
  String phone ='';
  num deliveryCost = 0;
  String image = '';
  bool privateOrders = false;
  bool hasProducts = false;

  List<StoresModel> _models = [];

  StoresModel({required this.id, required this.storeOwnerName,
      required this.phone, required this.deliveryCost, required this.image, required this.privateOrders,
      required this.hasProducts,required this.categoryId});

  StoresModel.withData(List<Data> data) : super.withData() {
    _models = [];
    for (var element in data) {
      if (element.image != null && (element.image?.contains('original-image') ?? false) == false) {
        int f = Random().nextInt(1600);
        int s = Random().nextInt(900);
        element.image = 'https://source.unsplash.com/${f}x${s}/?store';
      }
      _models.add(StoresModel(
          id: element.id ?? -1,
          categoryId: element.categoryId?.toString() ?? '-1',
          storeOwnerName: element.storeOwnerName ?? S.current.store,
          deliveryCost: element.deliveryCost ?? 0,
          hasProducts: element.hasProducts ?? false,
          privateOrders: element.privateOrders ?? false,
          image:element.image ?? ImageAsset.PLACEHOLDER ,phone:element.phone??''));
    }
  }

  List<StoresModel> get data => _models;
}

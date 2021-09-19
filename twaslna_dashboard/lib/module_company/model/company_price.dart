import 'dart:math';

import 'package:twaslna_dashboard/abstracts/data_model/data_model.dart';
import 'package:twaslna_dashboard/module_company/response/company_delivery_price_response.dart';

class CompanyDeliveryPriceModel extends DataModel {
  int id = -1;
  num deliveryPrice = 0;


  CompanyDeliveryPriceModel({required this.id,
    required this.deliveryPrice,
  });
  CompanyDeliveryPriceModel? _model;
  CompanyDeliveryPriceModel.withData(Data data) : super.withData() {
    _model = CompanyDeliveryPriceModel(
        id: data.id ?? -1,
        deliveryPrice:data.deliveryCost ?? 0
    );
  }

  CompanyDeliveryPriceModel get data {
    if (_model != null) {
      return _model!;
    }
    else {
      throw Exception('There is no data');
    }
  }
}

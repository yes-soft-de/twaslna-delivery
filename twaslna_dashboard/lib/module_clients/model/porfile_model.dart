import 'package:twaslna_dashboard/abstracts/data_model/data_model.dart';
import 'package:twaslna_dashboard/module_clients/response/client_profile_response.dart';

class ClientProfileModel extends DataModel{

  String? image;
  String? name;
  String? phone;

  ClientProfileModel(
      {this.image,
        this.name,
        this.phone,
      });

  ClientProfileModel? _models;

  ClientProfileModel.withData(Data data) : super.withData() {

    _models = ClientProfileModel(
        image: data.image,
        name: data.clientName,
        phone:  data.phone,
    );
  }

  ClientProfileModel get data => _models ?? ClientProfileModel();
}
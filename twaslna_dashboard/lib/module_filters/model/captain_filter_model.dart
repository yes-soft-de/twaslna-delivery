import 'package:twaslna_dashboard/abstracts/data_model/data_model.dart';
import 'package:twaslna_dashboard/module_filters/response/captain_filter_response.dart';
class CaptainFilterModel extends DataModel {
  String captainID = '';
  String captainName = '';
  String image = '';

  List <CaptainFilterModel> _model = [];

  CaptainFilterModel({
    required this.captainID,
    required this.image,
    required this.captainName,
  });

  CaptainFilterModel.withData(Data data) : super.withData() {
    _model = [];
    for (var element in data.stores!) {
      _model.add(
          CaptainFilterModel(captainID:element.captainID ?? '-1', image: element.image ?? '', captainName: element.captainName ?? '')
      );
    }
  }
  List<CaptainFilterModel> get data => _model;
}
import 'package:twaslna_dashboard/abstracts/data_model/data_model.dart';
import 'package:twaslna_dashboard/module_main/response/report_response.dart';

class ReportModel extends DataModel {

  int countCompletedOrders = 0;
  int countOngoingOrders = 0;
  int countCaptains = 0;
  int countClients = 0;
  int countStores = 0;
  int countProducts = 0;

  ReportModel(
      {required this.countCompletedOrders,
      required this.countOngoingOrders,
      required this.countCaptains,
      required this.countClients,
      required this.countStores,
      required this.countProducts});

  ReportModel.withData(Data data) : super.withData() {
     countCompletedOrders =data.countCompletedOrders?.count ?? 0;
     countOngoingOrders =data.countOngoingOrders?.count ?? 0;
     countCaptains = data.countCaptains?.count ?? 0;
     countClients = data.countClients?.count ?? 0;
     countStores =data.countStores?.count ?? 0;
     countProducts =data.countProducts?.count ?? 0;
  }

}

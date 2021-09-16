import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:twaslna_dashboard/abstracts/data_model/data_model.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/module_orders/manager/my_orders_manager.dart';
import 'package:twaslna_dashboard/module_orders/model/order_details_model.dart';
import 'package:twaslna_dashboard/module_orders/model/order_model.dart';
import 'package:twaslna_dashboard/module_orders/response/my_orders_response.dart';
import 'package:twaslna_dashboard/module_orders/response/order_details_response.dart';
import 'package:twaslna_dashboard/utils/helpers/status_code_helper.dart';

@injectable
class OrdersService {
  final MyOrdersManager _myOrdersManager;

  OrdersService(this._myOrdersManager);

  Future<DataModel> getOrders() async {
    MyOrdersResponse? _ordersResponse = await _myOrdersManager.getOrders();
    if (_ordersResponse == null) {
      return DataModel.withError(S.current.networkError);
    }
    if (_ordersResponse.statusCode != '200') {
      return DataModel.withError(
          StatusCodeHelper.getStatusCodeMessages(_ordersResponse.statusCode));
    }
    if (_ordersResponse.data == null) return DataModel.empty();
    return OrderModel.withData(_ordersResponse);
  }
  Future<DataModel> getOngoingOrders() async {
    MyOrdersResponse? _ordersResponse = await _myOrdersManager.getOngoingOrders();
    if (_ordersResponse == null) {
      return DataModel.withError(S.current.networkError);
    }
    if (_ordersResponse.statusCode != '200') {
      return DataModel.withError(
          StatusCodeHelper.getStatusCodeMessages(_ordersResponse.statusCode));
    }
    if (_ordersResponse.data == null) return DataModel.empty();
    return OrderModel.withData(_ordersResponse);
  }

  Future<DataModel> getOrdersDetails(int id) async {
    OrderDetailsResponse? _ordersResponse =
        await _myOrdersManager.getOrderDetails(id);
    if (_ordersResponse == null) {
      return DataModel.withError(S.current.networkError);
    }
    if (_ordersResponse.statusCode != '200') {
      return DataModel.withError(
          StatusCodeHelper.getStatusCodeMessages(_ordersResponse.statusCode));
    }
    if (_ordersResponse.data == null) return DataModel.empty();
    return OrderDetailsModel.Data(_ordersResponse);
  }

}

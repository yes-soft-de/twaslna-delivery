import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_orders/service/my_orders_service.dart';

@injectable
class MyOrdersStateManager {
  MyOrdersService _myOrdersService;

  MyOrdersStateManager(this._myOrdersService);
}

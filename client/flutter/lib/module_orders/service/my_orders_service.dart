import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_orders/manager/my_orders_manager.dart';

@injectable
class MyOrdersService {
MyOrdersManager _myOrdersManager;

MyOrdersService(this._myOrdersManager);
}

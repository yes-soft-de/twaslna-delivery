import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_orders/repository/my_orders_repository.dart';

@injectable
class MyOrdersManager {
  MyOrdersRepository _myOrdersRepository;

  MyOrdersManager(this._myOrdersRepository);
}

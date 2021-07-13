import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:twaslna_delivery/module_orders/service/orders_service.dart';
import 'package:twaslna_delivery/module_orders/ui/screen/order_details_screen.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_orders/ui/state/order_details_state/order_details_loaded_state.dart';
import 'package:twaslna_delivery/module_orders/ui/state/order_details_state/order_details_state.dart';
import 'package:twaslna_delivery/module_orders/ui/state/order_details_state/orders_details_error_state.dart';
import 'package:twaslna_delivery/module_orders/ui/state/order_details_state/orders_details_loading_state.dart';

@injectable
class OrderDetailsStateManager {
  final OrdersService _OrdersService;
  final PublishSubject<OrderDetailsState> _stateSubject = PublishSubject();
  Stream<OrderDetailsState> get stateStream => _stateSubject.stream;
  OrderDetailsStateManager(this._OrdersService);
  void getOrderDetails(int id,OrderDetailsScreenState screenState){
    _stateSubject.add(OrderDetailsLoadingState(screenState));
    _OrdersService.getOrdersDetails(id).then((value){
      if (value != null){
        if (value is int) {
          _stateSubject.add(OrderDetailsErrorState(screenState,S.current.networkError));
        }
        else {
          _stateSubject.add(OrderDetailsLoadedState(screenState,value));
        }
      }
      else {
        _stateSubject.add(OrderDetailsErrorState(screenState,S.current.networkError));
      }
    });
  }
}

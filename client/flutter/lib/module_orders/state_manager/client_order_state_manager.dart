import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:twaslna_delivery/module_orders/request/client_order_request.dart';
import 'package:twaslna_delivery/module_orders/service/orders_service.dart';
import 'package:twaslna_delivery/module_orders/ui/screen/client_order_screen.dart';
import 'package:twaslna_delivery/module_orders/ui/state/client_order/client_order_loaded_state.dart';
import 'package:twaslna_delivery/module_orders/ui/state/client_order/client_order_loading_state.dart';
import 'package:twaslna_delivery/module_orders/ui/state/client_order/client_order_state.dart';
import 'package:twaslna_delivery/utils/helpers/status_code_helper.dart';

@injectable
class ClientOrderStateManager {
  final OrdersService _OrdersService;
  final PublishSubject<ClientOrderState> _stateSubject = PublishSubject();
  Stream<ClientOrderState> get stateStream => _stateSubject.stream;
  ClientOrderStateManager(this._OrdersService);
  void postClientOrder(ClientOrderRequest request,ClientOrderScreenState screenState){
    _stateSubject.add(ClientLoadingState(screenState));
    _OrdersService.postClientOrder(request).then((value){
      if (value != null){
        if (value == 201) {
         screenState.moveDecision(true);
        }
        else {
          _stateSubject.add(ClientOrderLoadedState(screenState));
          screenState.moveDecision(false,StatusCodeHelper.getStatusCodeMessages(value));
        }
      }
      else {
        screenState.moveDecision(false,StatusCodeHelper.getStatusCodeMessages(500));
      }
    });
  }
}

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_orders/service/orders_service.dart';
import 'package:twaslna_delivery/module_orders/ui/screen/my_orders_screen.dart';
import 'package:twaslna_delivery/module_orders/ui/state/my_orders/my_orders_error_state.dart';
import 'package:twaslna_delivery/module_orders/ui/state/my_orders/my_orders_loaded_state.dart';
import 'package:twaslna_delivery/module_orders/ui/state/my_orders/my_orders_loading_state.dart';
import 'package:twaslna_delivery/module_orders/ui/state/my_orders/my_orders_state.dart';

@injectable
class MyOrdersStateManager {
  final OrdersService _myOrdersService;
  final PublishSubject<MyOrdersState> _stateSubject = PublishSubject();
  Stream<MyOrdersState> get stateStream => _stateSubject.stream;
  MyOrdersStateManager(this._myOrdersService);
   void getOrders(MyOrdersScreenState screenState){
     _stateSubject.add(MyOrdersLoadingState(screenState));
     _myOrdersService.getOrders().then((value){
       if (value != null){
        if (value is String) {
          _stateSubject.add(MyOrdersErrorState(screenState,S.current.networkError));
        }
        else {
          _stateSubject.add(MyOrdersLoadedState(screenState,value));
        }
       }
       else {
         _stateSubject.add(MyOrdersErrorState(screenState,S.current.networkError));
       }
     });
   }
}

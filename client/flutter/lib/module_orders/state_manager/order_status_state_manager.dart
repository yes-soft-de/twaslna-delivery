import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:twaslna_delivery/module_orders/service/orders_service.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_orders/ui/screen/order_status_screen.dart';
import 'package:twaslna_delivery/module_orders/ui/state/order_status/order_status_empty_state.dart';
import 'package:twaslna_delivery/module_orders/ui/state/order_status/order_status_loaded_state.dart';
import 'package:twaslna_delivery/module_orders/ui/state/order_status/order_status_loading_state.dart';
import 'package:twaslna_delivery/module_orders/ui/state/order_status/order_status_state.dart';
import 'package:twaslna_delivery/module_orders/ui/state/order_status/orders_status_error_state.dart';
import 'package:twaslna_delivery/utils/helpers/fire_store_helper.dart';

@injectable
class OrderStatusStateManager {
  final OrdersService _ordersService;
  final FireStoreHelper _fireStoreHelper;
  final PublishSubject<OrderStatusState> _stateSubject = PublishSubject();
  Stream<OrderStatusState> get stateStream => _stateSubject.stream;
  OrderStatusStateManager(this._ordersService,this._fireStoreHelper);
  StreamSubscription? newActionSubscription;

  void getOrderDetails(int id,OrderStatusScreenState screenState){
    _stateSubject.add(OrderStatusLoadingState(screenState));
    _ordersService.getOrdersDetails(id).then((value){
      if (value.hasError){
        _stateSubject.add(OrderStatusErrorState(screenState,value.error!,id));
      }
      else if (value.isEmpty){
        _stateSubject.add(OrderStatusEmptyState(screenState,S.current.homeDataEmpty,id));
      }
      else {
        _stateSubject.add(OrderStatusLoadedState(screenState,value.data));
        initListening(screenState,id);
      }
    });
  }

  void initListening(OrderStatusScreenState screenState,int id) {
    newActionSubscription =
        _fireStoreHelper.onInsertChangeWatcher()?.listen((event) {
          _ordersService.getOrdersDetails(id).then((value){
            if (value.hasError){
              _stateSubject.add(OrderStatusErrorState(screenState,value.error!,id));
            }
            else if (value.isEmpty){
              _stateSubject.add(OrderStatusEmptyState(screenState,S.current.homeDataEmpty,id));
            }
            else {
              _stateSubject.add(OrderStatusLoadedState(screenState,value.data));
            }
          });
        });
  }

}

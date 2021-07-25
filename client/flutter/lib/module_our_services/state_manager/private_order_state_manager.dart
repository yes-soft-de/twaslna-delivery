import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';
import 'package:rxdart/rxdart.dart';
import 'package:twaslna_delivery/module_deep_links/service/deep_links_service.dart';
import 'package:twaslna_delivery/module_our_services/request/private_order_request.dart';
import 'package:twaslna_delivery/module_our_services/service/services_service.dart';
import 'package:twaslna_delivery/module_our_services/ui/screen/private_order_screen.dart';
import 'package:twaslna_delivery/module_our_services/ui/state/private_order_states/private_order_Loaded_state.dart';
import 'package:twaslna_delivery/module_our_services/ui/state/private_order_states/private_order_finish_order_state.dart';
import 'package:twaslna_delivery/module_our_services/ui/state/private_order_states/private_order_loading_state.dart';
import 'package:twaslna_delivery/module_our_services/ui/state/private_order_states/private_order_state.dart';
import 'package:twaslna_delivery/utils/helpers/status_code_helper.dart';

@injectable
class PrivateOrderStateManager{
  final ServicesService _servicesService;
  PrivateOrderStateManager(this._servicesService);
  final PublishSubject<PrivateOrderState> _stateSubject = PublishSubject();
  Stream<PrivateOrderState> get stateStream => _stateSubject.stream;

  void getLocation(PrivateOrderScreenState screenState) {
   _stateSubject.add(PrivateOrderLoadingState(screenState));
   DeepLinksService.defaultLocation().then((value){
     if (value != null){
       _stateSubject.add(PrivateFinishOrderStateState(screenState,value));
     }
     else {
       _stateSubject.add(PrivateFinishOrderStateState(screenState,null));
     }
   });
  }

  void postPrivateOrder(PrivateOrderRequest request,PrivateOrderScreenState screenState){
    _stateSubject.add(PrivateOrderLoadingState(screenState));
    _servicesService.postPrivateOrder(request).then((value){
      if (value != null){
        if (value == 201) {
          screenState.moveDecision(true);
        }
        else {
          _stateSubject.add(PrivateOrderLoadedState(screenState));
          screenState.moveDecision(false,StatusCodeHelper.getStatusCodeMessages(value));
        }
      }
      else {
        screenState.moveDecision(false,StatusCodeHelper.getStatusCodeMessages(500));
      }
    });
  }
}
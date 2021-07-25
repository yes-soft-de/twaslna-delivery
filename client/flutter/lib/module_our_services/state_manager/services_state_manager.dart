import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:twaslna_delivery/module_our_services/request/send_it_request.dart';
import 'package:twaslna_delivery/module_our_services/service/services_service.dart';
import 'package:twaslna_delivery/module_our_services/ui/screen/send_it_screen.dart';
import 'package:twaslna_delivery/module_our_services/ui/state/send_it_states/send_it_Loaded_state.dart';
import 'package:twaslna_delivery/module_our_services/ui/state/send_it_states/send_it_loading_state.dart';
import 'package:twaslna_delivery/module_our_services/ui/state/send_it_states/send_it_state.dart';
import 'package:twaslna_delivery/utils/helpers/status_code_helper.dart';

@injectable
class ServicesStateManager{
  final ServicesService _servicesService;

  ServicesStateManager(this._servicesService);
  final PublishSubject<SendItState> _stateSubject = PublishSubject();
  Stream<SendItState> get stateStream => _stateSubject.stream;
  void SendItClientOrder(SendItRequest request,SendItScreenState screenState){
   _stateSubject.add(SendItLoadingState(screenState));
   _servicesService.sendItClintOrder(request).then((value){
     print(value);
     if (value != null){
       if (value == 201) {
         screenState.moveDecision(true);
       }
       else {
         _stateSubject.add(SendItLoadedState(screenState));
         screenState.moveDecision(false,StatusCodeHelper.getStatusCodeMessages(value));
       }
     }
     else {
       screenState.moveDecision(false,StatusCodeHelper.getStatusCodeMessages(500));
     }
   });
  }

}
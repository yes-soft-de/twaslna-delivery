import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:twaslna_dashboard/abstracts/states/loading_state.dart';
import 'package:twaslna_dashboard/abstracts/states/state.dart';
import 'package:twaslna_dashboard/module_captain/model/inActiveModel.dart';
import 'package:twaslna_dashboard/module_clients/service/clients_service.dart';
import 'package:twaslna_dashboard/module_clients/ui/screen/captains_list_screen.dart';
import 'package:twaslna_dashboard/module_clients/ui/state/client_list/clients_loaded_state.dart';

@injectable
class ClientsStateManager {
  final ClientsService _clientsService;
  final PublishSubject<States> _stateSubject = PublishSubject();
  Stream<States> get stateStream => _stateSubject.stream;

  ClientsStateManager(this._clientsService);

  void getClients(ClientsScreenState screenState){

    _clientsService.getClients().then((value){
      if (value.hasError){
        _stateSubject.add(ClientsLoadedState(screenState,null,error: value.error));
      }
      else if (value.isEmpty) {
        _stateSubject.add(ClientsLoadedState(screenState,null,empty: value.isEmpty));
      }
      else {
        InActiveModel _model = value as InActiveModel;
        _stateSubject.add(ClientsLoadedState(screenState,_model.data));
      }
    });
  }
  void getClientsFiltered(ClientsScreenState screenState,String searchKey){

    _clientsService.getClientsFilter(searchKey).then((value){
      if (value.hasError){
        _stateSubject.add(ClientsLoadedState(screenState,null,error: value.error));
      }
      else if (value.isEmpty) {
        _stateSubject.add(ClientsLoadedState(screenState,null,empty: value.isEmpty));
      }
      else {
        InActiveModel _model = value as InActiveModel;
        _stateSubject.add(ClientsLoadedState(screenState,_model.data));
      }
    });
  }

}

import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/module_clients/repository/clients_repository.dart';
import 'package:twaslna_dashboard/module_clients/response/client_profile_response.dart';
import 'package:twaslna_dashboard/module_clients/response/clients_list_profile.dart';


@injectable
class ClientsManager {

  final ClientsRepository _clientsRepository;

  ClientsManager(this._clientsRepository);

  Future<ClientsListProfileResponse?> getClients() => _clientsRepository.getClients();
  Future<ClientProfileResponse?> getClientProfile(int captainId) => _clientsRepository.getClientProfile(captainId);
  Future<ClientsListProfileResponse?> getClientsFilter(String searchKey) => _clientsRepository.getClientFilters(searchKey);

}

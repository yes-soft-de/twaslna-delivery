import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/module_captain/repository/captain_repository.dart';
import 'package:twaslna_dashboard/module_captain/response/captain_profile_response.dart';
import 'package:twaslna_dashboard/module_captain/response/in_active_captain_response.dart';
import 'package:twaslna_dashboard/module_clients/repository/clients_repository.dart';
import 'package:twaslna_dashboard/module_filters/response/stores_filter_response.dart';


@injectable
class ClientsManager {

  final ClientsRepository _clientsRepository;

  ClientsManager(this._clientsRepository);

  Future<InActiveCaptainResponse?> getClients() => _clientsRepository.getClients();
  Future<CaptainProfileResponse?> getClientProfile(int captainId) => _clientsRepository.getClientProfile(captainId);
  Future<StoresFilterResponse?> getClientsFilter(String searchKey) => _clientsRepository.getClientFilters(searchKey);

}

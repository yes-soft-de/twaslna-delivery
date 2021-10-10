import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/abstracts/data_model/data_model.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/module_captain/model/porfile_model.dart';
import 'package:twaslna_dashboard/module_captain/response/captain_profile_response.dart';
import 'package:twaslna_dashboard/module_clients/manager/clients_manager.dart';
import 'package:twaslna_dashboard/module_clients/model/client_list_model.dart';
import 'package:twaslna_dashboard/module_clients/model/porfile_model.dart';
import 'package:twaslna_dashboard/module_clients/response/client_profile_response.dart';
import 'package:twaslna_dashboard/module_clients/response/clients_list_profile.dart';
import 'package:twaslna_dashboard/utils/helpers/status_code_helper.dart';

@injectable
class ClientsService {

  final ClientsManager _clientsManager;

  ClientsService(this._clientsManager);

  Future<DataModel> getClients() async {

    ClientsListProfileResponse? _clientsListResponse = await _clientsManager.getClients();
    if (_clientsListResponse == null) {
      return DataModel.withError(S.current.networkError);
    }
    if (_clientsListResponse.statusCode != '200') {
      return DataModel.withError(
          StatusCodeHelper.getStatusCodeMessages(_clientsListResponse.statusCode));
    }
    if (_clientsListResponse.data == null) return DataModel.empty();
    return ClientsListModel.withData(_clientsListResponse.data!);
  }

  Future<DataModel> getClientProfile(int captainId) async {

    ClientProfileResponse? _clientProfileResponse = await _clientsManager.getClientProfile(captainId);
    if (_clientProfileResponse == null) {
      return DataModel.withError(S.current.networkError);
    }
    if (_clientProfileResponse.statusCode != '200') {
      return DataModel.withError(
          StatusCodeHelper.getStatusCodeMessages(_clientProfileResponse.statusCode));
    }
    if (_clientProfileResponse.data == null) return DataModel.empty();
    return ClientProfileModel.withData(_clientProfileResponse.data!);
  }
  Future<DataModel> getClientsFilter(String key) async {

    ClientsListProfileResponse? _captainFilter = await _clientsManager.getClientsFilter(key);
    if (_captainFilter == null) {
      return DataModel.withError(S.current.networkError);
    }
    if (_captainFilter.statusCode != '200') {
      return DataModel.withError(
          StatusCodeHelper.getStatusCodeMessages(_captainFilter.statusCode));
    }
    if (_captainFilter.data == null) return DataModel.empty();
    return ClientsListModel.withData(_captainFilter.data!);
  }
}

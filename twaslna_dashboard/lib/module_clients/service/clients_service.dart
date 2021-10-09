import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/abstracts/data_model/data_model.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/module_captain/model/inActiveModel.dart';
import 'package:twaslna_dashboard/module_captain/model/porfile_model.dart';
import 'package:twaslna_dashboard/module_captain/response/captain_profile_response.dart';
import 'package:twaslna_dashboard/module_captain/response/in_active_captain_response.dart';
import 'package:twaslna_dashboard/module_clients/manager/clients_manager.dart';
import 'package:twaslna_dashboard/module_filters/model/store_filter_model.dart';
import 'package:twaslna_dashboard/module_filters/response/stores_filter_response.dart';
import 'package:twaslna_dashboard/utils/helpers/status_code_helper.dart';

@injectable
class ClientsService {

  final ClientsManager _clientsManager;

  ClientsService(this._clientsManager);

  Future<DataModel> getClients() async {

    InActiveCaptainResponse? _inActiveCaptainResponse = await _clientsManager.getClients();
    if (_inActiveCaptainResponse == null) {
      return DataModel.withError(S.current.networkError);
    }
    if (_inActiveCaptainResponse.statusCode != '200') {
      return DataModel.withError(
          StatusCodeHelper.getStatusCodeMessages(_inActiveCaptainResponse.statusCode));
    }
    if (_inActiveCaptainResponse.data == null) return DataModel.empty();
    return InActiveModel.withData(_inActiveCaptainResponse.data!);
  }

  Future<DataModel> getCaptainProfile(int captainId) async {

    CaptainProfileResponse? _captainProfileResponse = await _clientsManager.getClientProfile(captainId);
    if (_captainProfileResponse == null) {
      return DataModel.withError(S.current.networkError);
    }
    if (_captainProfileResponse.statusCode != '200') {
      return DataModel.withError(
          StatusCodeHelper.getStatusCodeMessages(_captainProfileResponse.statusCode));
    }
    if (_captainProfileResponse.data == null) return DataModel.empty();
    return ProfileModel.withData(_captainProfileResponse.data!);
  }
  Future<DataModel> getClientsFilter(String key) async {

    StoresFilterResponse? _captainFilter = await _clientsManager.getClientsFilter(key);
    if (_captainFilter == null) {
      return DataModel.withError(S.current.networkError);
    }
    if (_captainFilter.statusCode != '200') {
      return DataModel.withError(
          StatusCodeHelper.getStatusCodeMessages(_captainFilter.statusCode));
    }
    if (_captainFilter.data == null) return DataModel.empty();
    return StoresFilterModel.withData(_captainFilter.data!);
  }
}

import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/abstracts/data_model/data_model.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/module_captain/model/balance_model.dart';
import 'package:twaslna_dashboard/module_captain/response/captain_account_balance_response.dart';
import 'package:twaslna_dashboard/module_logs/manager/logs_manager.dart';
import 'package:twaslna_dashboard/module_logs/model/captain_logs_model.dart';
import 'package:twaslna_dashboard/module_logs/response/captain_logs_response.dart';
import 'package:twaslna_dashboard/utils/helpers/status_code_helper.dart';

@injectable
class LogsService {

  final LogsManager _logsManager;

  LogsService(this._logsManager);

  Future<DataModel> getCaptainLogs(int captainId) async {

    CaptainLogsResponse? _captainProfileResponse = await _logsManager.getCaptainLogs(captainId);
    if (_captainProfileResponse == null) {
      return DataModel.withError(S.current.networkError);
    }
    if (_captainProfileResponse.statusCode != '200') {
      return DataModel.withError(
          StatusCodeHelper.getStatusCodeMessages(_captainProfileResponse.statusCode));
    }
    if (_captainProfileResponse.data == null) return DataModel.empty();
    return CaptainLogsModel.withData(_captainProfileResponse.data!);
  }

  Future<DataModel> getStoreLogs(int storeId) async {

    CaptainAccountBalanceResponse? _captainProfileResponse = await _logsManager.getStoreLogs(storeId);
    if (_captainProfileResponse == null) {
      return DataModel.withError(S.current.networkError);
    }
    if (_captainProfileResponse.statusCode != '200') {
      return DataModel.withError(
          StatusCodeHelper.getStatusCodeMessages(_captainProfileResponse.statusCode));
    }
    if (_captainProfileResponse.data == null) return DataModel.empty();
    return BalanceModel.withData(_captainProfileResponse.data!.first);
  }

}

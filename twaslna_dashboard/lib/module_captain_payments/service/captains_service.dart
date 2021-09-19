import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/abstracts/data_model/data_model.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/module_captain/manager/captains_manager.dart';
import 'package:twaslna_dashboard/module_captain/model/balance_model.dart';
import 'package:twaslna_dashboard/module_captain/model/captain_model_payment_model.dart';
import 'package:twaslna_dashboard/module_captain/model/inActiveModel.dart';
import 'package:twaslna_dashboard/module_captain/model/porfile_model.dart';
import 'package:twaslna_dashboard/module_captain/request/accept_captain_request.dart';
import 'package:twaslna_dashboard/module_captain/response/captain_account_balance_response.dart';
import 'package:twaslna_dashboard/module_captain/response/captain_profile_response.dart';
import 'package:twaslna_dashboard/module_captain/response/captain_unfinished_pyments_response.dart';
import 'package:twaslna_dashboard/module_captain/response/in_active_captain_response.dart';
import 'package:twaslna_dashboard/module_categories/response/response.dart';
import 'package:twaslna_dashboard/utils/helpers/status_code_helper.dart';

@injectable
class CaptainsService {

  final CaptainManager _captainManager;

  CaptainsService(this._captainManager);

  Future<DataModel> getInActiveCaptains() async {

    InActiveCaptainResponse? _inActiveCaptainResponse = await _captainManager.getInActiveCaptain();
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

  Future<DataModel> getCaptains() async {

    InActiveCaptainResponse? _inActiveCaptainResponse = await _captainManager.getCaptains();
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

    CaptainProfileResponse? _captainProfileResponse = await _captainManager.getCaptainProfile(captainId);
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
  Future<DataModel> getCaptainBalance(int captainId) async {

    CaptainAccountBalanceResponse? _captainProfileResponse = await _captainManager.getAccountBalance(captainId);
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
  Future<DataModel> getCaptainBalanceLastMonth(int captainId) async {

    CaptainAccountBalanceResponse? _captainProfileResponse = await _captainManager.getAccountBalance(captainId);
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
  Future<DataModel> getPayments() async {

    CaptainUnfinishedPaymentsResponse? _paymentResponse = await _captainManager.getPayments();
    if (_paymentResponse == null) {
      return DataModel.withError(S.current.networkError);
    }
    if (_paymentResponse.statusCode != '200') {
      return DataModel.withError(
          StatusCodeHelper.getStatusCodeMessages(_paymentResponse.statusCode));
    }
    if (_paymentResponse.data == null) return DataModel.empty();
    return CaptainPaymentModel.withData(_paymentResponse.data!);
  }

  Future<DataModel> enableCaptain(AcceptCaptainRequest request) async {
    ActionResponse? actionResponse = await _captainManager.enableCaptain(request);

    if (actionResponse == null) {
      return DataModel.withError(S.current.networkError);
    }
    if (actionResponse.statusCode != '204') {
      return DataModel.withError(
          StatusCodeHelper.getStatusCodeMessages(actionResponse.statusCode));
    }
    return DataModel.empty();
  }

}

import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/abstracts/data_model/data_model.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/module_captain/manager/captains_manager.dart';
import 'package:twaslna_dashboard/module_captain/request/accept_captain_request.dart';
import 'package:twaslna_dashboard/module_categories/response/response.dart';
import 'package:twaslna_dashboard/module_payments/manager/payments_manager.dart';
import 'package:twaslna_dashboard/module_payments/request/captain_payments_request.dart';
import 'package:twaslna_dashboard/utils/helpers/status_code_helper.dart';

@injectable
class PaymentsService {

  final PaymentsManager _paymentsManager;

  PaymentsService(this._paymentsManager);

  Future<DataModel> paymentFromCaptain(CaptainPaymentsRequest request) async {
    ActionResponse? actionResponse = await _paymentsManager.paymentFromCaptain(request);

    if (actionResponse == null) {
      return DataModel.withError(S.current.networkError);
    }
    if (actionResponse.statusCode != '201') {
      return DataModel.withError(
          StatusCodeHelper.getStatusCodeMessages(actionResponse.statusCode));
    }
    return DataModel.empty();
  }
  Future<DataModel> paymentToCaptain(CaptainPaymentsRequest request) async {
    ActionResponse? actionResponse = await _paymentsManager.paymentToCaptain(request);

    if (actionResponse == null) {
      return DataModel.withError(S.current.networkError);
    }
    if (actionResponse.statusCode != '201') {
      return DataModel.withError(
          StatusCodeHelper.getStatusCodeMessages(actionResponse.statusCode));
    }
    return DataModel.empty();
  }

}

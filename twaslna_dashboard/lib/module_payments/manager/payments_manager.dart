import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/module_categories/response/response.dart';
import 'package:twaslna_dashboard/module_payments/repository/payments_repository.dart';
import 'package:twaslna_dashboard/module_payments/request/captain_payments_request.dart';


@injectable
class PaymentsManager {

  final PaymentsRepository _paymentsRepository;

  PaymentsManager(this._paymentsRepository);

  Future<ActionResponse?> paymentFromCaptain(CaptainPaymentsRequest request) => _paymentsRepository.paymentFromCaptain(request);
  Future<ActionResponse?> paymentToCaptain(CaptainPaymentsRequest request) => _paymentsRepository.paymentToCaptain(request);


}

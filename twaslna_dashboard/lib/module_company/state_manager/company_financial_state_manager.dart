import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:twaslna_dashboard/abstracts/states/loading_state.dart';
import 'package:twaslna_dashboard/abstracts/states/state.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/module_auth/service/auth_service/auth_service.dart';
import 'package:twaslna_dashboard/module_company/model/company_finance_model.dart';
import 'package:twaslna_dashboard/module_company/model/company_price.dart';
import 'package:twaslna_dashboard/module_company/request/delivery_company_financial.dart';
import 'package:twaslna_dashboard/module_company/request/financial_compensation_request.dart';
import 'package:twaslna_dashboard/module_company/service/company_service.dart';
import 'package:twaslna_dashboard/module_company/ui/screen/company_finance_screen.dart';
import 'package:twaslna_dashboard/module_company/ui/state/company_finance/company_finance_state.dart';
import 'package:twaslna_dashboard/utils/helpers/custom_flushbar.dart';

@injectable
class CompanyFinanceStateManager {
  final CompanyService _companyService;
  final AuthService _authService;
  final PublishSubject<States> _stateSubject = PublishSubject();

  Stream<States> get stateStream => _stateSubject.stream;

  CompanyFinanceStateManager(this._authService, this._companyService);

  void getFinance(CompanyFinanceScreenState screenState) {
    CompanyDeliveryPriceModel? deliveryPrice;
    CompanyFinanceModel? financeModel;
    _stateSubject.add(LoadingState(screenState));
    Future.wait([
      _companyService.getFinancialCompany(),
      _companyService.getDeliveryPrice()
    ]).then((value) {
      if (value[0].hasError || value[1].hasError) {
        if (value[0].hasError && value[1].hasError) {
          _stateSubject.add(CompanyFinanceLoadedState(screenState, financeModel:null , model: null,
              errors: [value[0].error ?? '', value[1].error ?? '']));
        } else if (value[0].hasError) {
          financeModel = value[0] as CompanyFinanceModel;
          financeModel = financeModel?.data;
          _stateSubject.add(CompanyFinanceLoadedState(screenState, financeModel:financeModel, model: null,
              error: value[0].error ?? ''));
        } else if (value[1].hasError) {
          deliveryPrice = value[1] as CompanyDeliveryPriceModel;
          deliveryPrice = deliveryPrice?.data;
          _stateSubject.add(CompanyFinanceLoadedState(screenState, financeModel:null,model: deliveryPrice,
              error: value[1].error ?? ''));
        }
      } else if (value[0].isEmpty || value[1].isEmpty) {
        if (value[0].isEmpty && value[1].isEmpty) {
          _stateSubject.add(CompanyFinanceLoadedState(screenState, financeModel:null, model: null,));
        } else if (value[0].isEmpty) {
          deliveryPrice = value[1] as CompanyDeliveryPriceModel;
          deliveryPrice = deliveryPrice?.data;
          _stateSubject.add(CompanyFinanceLoadedState(screenState, financeModel:null, model: deliveryPrice,));
        } else if (value[1].isEmpty) {
          financeModel = value[0] as CompanyFinanceModel;
          financeModel = financeModel?.data;
          _stateSubject.add(CompanyFinanceLoadedState(screenState, financeModel:financeModel, model: null,));
        }
      } else {
        deliveryPrice = value[1] as CompanyDeliveryPriceModel;
        deliveryPrice = deliveryPrice?.data;
        financeModel = value[0] as CompanyFinanceModel;
        financeModel = financeModel?.data;
        _stateSubject.add(CompanyFinanceLoadedState(screenState, financeModel:financeModel, model: deliveryPrice,));
      }
    });
  }

  void updateFinancial(
      CompanyFinanceScreenState screenState,
      FinancialCompensationRequest compensationRequest,
      DeliveryCompanyFinancialRequest deliveryRequest) {
    _stateSubject.add(LoadingState(screenState));
    Future.wait([
      deliveryRequest.id == null
          ? _companyService.createDeliveryPrice(deliveryRequest)
          : _companyService.updateDeliveryPrice(deliveryRequest),
      compensationRequest.id == null
          ? _companyService.createCompanyFinancial(compensationRequest)
          : _companyService.updateCompanyFinancial(compensationRequest)
    ]).then((value) {
      if (value[0].hasError && value[1].hasError) {
        CustomFlushBarHelper.createSuccess(title: S.current.warnning, message:value[0].error??'').show(screenState.context);
        getFinance(screenState);
      } else {
        getFinance(screenState);
        CustomFlushBarHelper.createSuccess(title: S.current.warnning, message:S.current.financeProfileUpdateSuccessfully).show(screenState.context);
      }
    });
  }
}

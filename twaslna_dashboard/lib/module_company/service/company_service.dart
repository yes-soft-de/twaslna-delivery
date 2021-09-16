import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/abstracts/data_model/data_model.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/module_categories/response/response.dart';
import 'package:twaslna_dashboard/module_company/manager/company_manager.dart';
import 'package:twaslna_dashboard/module_company/model/company_model.dart';
import 'package:twaslna_dashboard/module_company/request/create_company_profile.dart';
import 'package:twaslna_dashboard/module_company/response/company_profile_response.dart';
import 'package:twaslna_dashboard/module_stores/model/stores_model.dart';
import 'package:twaslna_dashboard/module_stores/response/stores_response.dart';
import 'package:twaslna_dashboard/utils/helpers/status_code_helper.dart';

@injectable
class CompanyService {
  final CompanyManager _companyManager;

  CompanyService(this._companyManager);

  Future<DataModel> getCompanyProfile() async {
    CompanyProfileResponse? _companyResponse = await _companyManager.getCompanyProfile();
    if (_companyResponse == null) {
      return DataModel.withError(S.current.networkError);
    }
    if (_companyResponse.statusCode != '200') {
      return DataModel.withError(
          StatusCodeHelper.getStatusCodeMessages(_companyResponse.statusCode));
    }
    if (_companyResponse.data == null) return DataModel.empty();
    return CompanyProfileModel.withData(_companyResponse.data!);
  }

  Future<DataModel> createCompanyProfile(CreateCompanyProfile request) async {
    ActionResponse? actionResponse = await _companyManager.createCompanyProfile(request);

    if (actionResponse == null) {
      return DataModel.withError(S.current.networkError);
    }
    if (actionResponse.statusCode != '201') {
      return DataModel.withError(
          StatusCodeHelper.getStatusCodeMessages(actionResponse.statusCode));
    }
    return DataModel.empty();
  }

  Future<DataModel> UpdateCompanyProfile(CreateCompanyProfile request) async {
    ActionResponse? actionResponse = await _companyManager.updateCompanyProfile(request);

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

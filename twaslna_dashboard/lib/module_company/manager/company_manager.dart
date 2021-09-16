import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/module_categories/response/response.dart';
import 'package:twaslna_dashboard/module_company/repository/company_repository.dart';
import 'package:twaslna_dashboard/module_company/request/create_company_profile.dart';
import 'package:twaslna_dashboard/module_company/response/company_profile_response.dart';
import 'package:twaslna_dashboard/module_stores/response/stores_response.dart';

@injectable
class CompanyManager {

  final CompanyRepository _companyRepository;

  CompanyManager(this._companyRepository);

  Future<CompanyProfileResponse?> getCompanyProfile() => _companyRepository.getProfileCompany();
  Future<ActionResponse?> createCompanyProfile(CreateCompanyProfile request) => _companyRepository.createCompanyProfile(request);
  Future<ActionResponse?> updateCompanyProfile(CreateCompanyProfile request) => _companyRepository.updateCompanyProfile(request);


}

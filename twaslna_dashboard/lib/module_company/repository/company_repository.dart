import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/consts/urls.dart';
import 'package:twaslna_dashboard/module_auth/service/auth_service/auth_service.dart';
import 'package:twaslna_dashboard/module_categories/response/response.dart';
import 'package:twaslna_dashboard/module_company/request/create_company_profile.dart';
import 'package:twaslna_dashboard/module_company/response/company_profile_response.dart';
import 'package:twaslna_dashboard/module_network/http_client/http_client.dart';
import 'package:twaslna_dashboard/module_stores/response/stores_response.dart';

@injectable
class CompanyRepository {

  final ApiClient _apiClient;
  final AuthService _authService;

  CompanyRepository(this._apiClient,this._authService);

  Future<CompanyProfileResponse?> getProfileCompany() async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.get(Urls.GET_PROFILE_COMPANY,
        headers: {'Authorization': 'Bearer ' + token.toString()});
    if (response == null) return null;
    return CompanyProfileResponse.fromJson(response);
  }

  Future<ActionResponse?> createCompanyProfile(CreateCompanyProfile request) async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.post(Urls.CREATE_COMPANY_PROFILE,request.toJson(),
        headers: {'Authorization': 'Bearer ' + token.toString()});
    if (response == null) return null;
    return ActionResponse.fromJson(response);
  }

  Future<ActionResponse?> updateCompanyProfile(CreateCompanyProfile request) async {
    var token = await _authService.getToken();
    dynamic response = await _apiClient.put(Urls.CREATE_COMPANY_PROFILE,request.toJson(),
        headers: {'Authorization': 'Bearer ' + token.toString()});
    if (response == null) return null;
    return ActionResponse.fromJson(response);
  }

}

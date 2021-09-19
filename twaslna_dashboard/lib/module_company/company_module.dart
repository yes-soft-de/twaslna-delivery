import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/abstracts/module/yes_module.dart';
import 'package:twaslna_dashboard/module_company/company_routes.dart';
import 'package:twaslna_dashboard/module_company/ui/screen/company_finance_screen.dart';
import 'package:twaslna_dashboard/module_company/ui/screen/company_profile_screen.dart';

@injectable
class CompanyModule extends YesModule {
 final CompanyProfileScreen _companyProfileScreen;
 final CompanyFinanceScreen _companyFinanceScreen;
  CompanyModule(this._companyProfileScreen,this._companyFinanceScreen){
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      CompanyRoutes.COMPANY_PROFILE_SCREEN : (context) => _companyProfileScreen,
      CompanyRoutes.COMPANY_FINANCE_SCREEN : (context) => _companyFinanceScreen
    };
  }
}
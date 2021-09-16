import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/abstracts/module/yes_module.dart';
import 'package:twaslna_dashboard/module_company/company_routes.dart';
import 'package:twaslna_dashboard/module_company/ui/screen/company_profile_screen.dart';

@injectable
class CompanyModule extends YesModule {
 final CompanyProfileScreen _companyProfileScreen;
  CompanyModule(this._companyProfileScreen){
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      CompanyRoutes.COMPANY_PROFILE_SCREEN : (context) => _companyProfileScreen
    };
  }
}
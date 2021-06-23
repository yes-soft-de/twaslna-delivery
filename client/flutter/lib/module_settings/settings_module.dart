import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/abstracts/module/yes_module.dart';
import 'package:twaslna_delivery/module_settings/setting_routes.dart';
import 'package:twaslna_delivery/module_settings/ui/settings_page/settings_page.dart';

@injectable
class SettingsModule extends YesModule {
  final SettingsScreen _settingsScreen;
  SettingsModule(this._settingsScreen) {
    YesModule.RoutesMap.addAll({
      SettingRoutes.ROUTE_SETTINGS: (context) => _settingsScreen,
    });
  }
}
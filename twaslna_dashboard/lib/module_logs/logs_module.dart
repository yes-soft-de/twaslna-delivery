import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/abstracts/module/yes_module.dart';
import 'package:twaslna_dashboard/module_logs/logs_routes.dart';
import 'package:twaslna_dashboard/module_logs/ui/screen/captain_logs_screen.dart';
import 'package:twaslna_dashboard/module_logs/ui/screen/store_logs_screen.dart';

@injectable
class LogsModule extends YesModule {
  final CaptainLogsScreen captainLogsScreen;
  final StoreLogsScreen storeLogsScreen;
  LogsModule(this.captainLogsScreen,this.storeLogsScreen){
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      LogsRoutes.CAPTAIN_LOGS: (context) => captainLogsScreen,
      LogsRoutes.STORE_LOGS: (context) => storeLogsScreen
    };
  }
}
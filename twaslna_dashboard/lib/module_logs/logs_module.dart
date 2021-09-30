import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/abstracts/module/yes_module.dart';
import 'package:twaslna_dashboard/module_logs/logs_routes.dart';
import 'package:twaslna_dashboard/module_logs/ui/screen/captain_logs_screen.dart';

@injectable
class LogsModule extends YesModule {
  final CaptainLogsScreen _captainLogsScreen;
  LogsModule(this._captainLogsScreen){
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      LogsRoutes.CAPTAIN_LOGS: (context) => _captainLogsScreen,
    };
  }
}
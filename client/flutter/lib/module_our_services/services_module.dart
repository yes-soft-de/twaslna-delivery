import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/abstracts/module/yes_module.dart';
import 'package:twaslna_delivery/module_our_services/services_routes.dart';
import 'package:twaslna_delivery/module_our_services/ui/screen/send_it_screen.dart';

@injectable
class ServicesModule extends YesModule {
  final SendItScreen _sendItScreen;
  ServicesModule(this._sendItScreen){
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      ServicesRoutes.SEND_IT : (context) => _sendItScreen,
    };
  }
}
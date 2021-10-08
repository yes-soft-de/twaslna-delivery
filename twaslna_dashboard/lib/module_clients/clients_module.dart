import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/abstracts/module/yes_module.dart';
import 'package:twaslna_dashboard/module_clients/clients_routes.dart';
import 'package:twaslna_dashboard/module_clients/ui/screen/captain_profile_screen.dart';
import 'package:twaslna_dashboard/module_clients/ui/screen/captains_list_screen.dart';

@injectable
class ClientsModule extends YesModule {
  final ClientProfileScreen _clientProfileScreen;
  final ClientsScreen _clientsScreen;
  ClientsModule(this._clientProfileScreen,this._clientsScreen){
    YesModule.RoutesMap.addAll(getRoutes());
  }
  Map<String, WidgetBuilder> getRoutes() {
    return {
      ClientsRoutes.CLIENTS_LIST: (context) => _clientsScreen,
      ClientsRoutes.CLIENT_PROFILE: (context) => _clientProfileScreen,
    };
  }
}
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/abstracts/states/loading_state.dart';
import 'package:twaslna_dashboard/abstracts/states/state.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/module_captain/captains_routes.dart';
import 'package:twaslna_dashboard/module_captain/request/accept_captain_request.dart';
import 'package:twaslna_dashboard/module_clients/state_manager/captain_profile_state_manager.dart';
import 'package:twaslna_dashboard/utils/components/custom_app_bar.dart';

@injectable
class ClientProfileScreen extends StatefulWidget {
  final ClientProfileStateManager _stateManager;

  ClientProfileScreen(this._stateManager);

  @override
  ClientProfileScreenState createState() => ClientProfileScreenState();
}

class ClientProfileScreenState extends State<ClientProfileScreen> {
  late States currentState;

  @override
  void initState() {
    currentState = LoadingState(this);
    widget._stateManager.stateStream.listen((event) {
      currentState = event;
      refresh();
    });
    super.initState();
  }

  void getClientProfile() {
    widget._stateManager.getClientProfile(this, clientId);
  }


  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  int clientId = -1;

  @override
  Widget build(BuildContext context) {
    if (clientId == -1) {
      var arg = ModalRoute.of(context)?.settings.arguments;
      if (arg != null && arg is int) {
        clientId = arg;
        widget._stateManager.getClientProfile(this, clientId);
      }
    }
    return Scaffold(
      appBar: CustomTwaslnaAppBar.appBar(context,
          title: S.current.profile,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: InkWell(
                  customBorder: CircleBorder(),
                  onTap: () {
                    Navigator.pushNamed(
                        context, CaptainsRoutes.CAPTAIN_BALANCE,arguments: clientId);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.account_balance,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
      body: currentState.getUI(context),
    );
  }
}

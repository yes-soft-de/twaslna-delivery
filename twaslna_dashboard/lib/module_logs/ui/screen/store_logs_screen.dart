import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/abstracts/states/loading_state.dart';
import 'package:twaslna_dashboard/abstracts/states/state.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/module_logs/state_manager/captain_logs_state_manager.dart';
import 'package:twaslna_dashboard/module_logs/state_manager/store_logs_state_manager.dart';
import 'package:twaslna_dashboard/utils/components/custom_app_bar.dart';

@injectable
class StoreLogsScreen extends StatefulWidget {
  final StoreLogsStateManager _stateManager;

  StoreLogsScreen(this._stateManager);

  @override
  StoreLogsScreenState createState() => StoreLogsScreenState();
}

class StoreLogsScreenState extends State<StoreLogsScreen> {
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

  void getCaptain() {
    widget._stateManager.getStoreLogs(this, captainId);
  }


  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  int captainId = -1;

  @override
  Widget build(BuildContext context) {
    if (captainId == -1) {
      var arg = ModalRoute.of(context)?.settings.arguments;
      if (arg != null && arg is int) {
        captainId = arg;
        widget._stateManager.getStoreLogs(this, captainId);
      }
    }
    return Scaffold(
      appBar: CustomTwaslnaAppBar.appBar(context, title: S.current.storeLogs,),
      body: currentState.getUI(context),
    );
  }
}

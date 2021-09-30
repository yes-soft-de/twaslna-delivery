import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/abstracts/states/loading_state.dart';
import 'package:twaslna_dashboard/abstracts/states/state.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/module_logs/state_manager/captain_logs_state_manager.dart';
import 'package:twaslna_dashboard/utils/components/custom_app_bar.dart';

@injectable
class CaptainLogsScreen extends StatefulWidget {
  final CaptainLogsStateManager _stateManager;

  CaptainLogsScreen(this._stateManager);

  @override
  CaptainLogsScreenState createState() => CaptainLogsScreenState();
}

class CaptainLogsScreenState extends State<CaptainLogsScreen> {
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
    widget._stateManager.getCaptainLogs(this, captainId);
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
        widget._stateManager.getCaptainLogs(this, captainId);
      }
    }
    return Scaffold(
      appBar: CustomTwaslnaAppBar.appBar(context, title: S.current.balanceDetails,),
      body: currentState.getUI(context),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/abstracts/states/loading_state.dart';
import 'package:twaslna_dashboard/abstracts/states/state.dart';
import 'package:twaslna_dashboard/di/di_config.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/global_nav_key.dart';
import 'package:twaslna_dashboard/module_reports/state_manager/captains_report_state_manager.dart';
import 'package:twaslna_dashboard/module_reports/state_manager/products_report_state_manager.dart';
import 'package:twaslna_dashboard/utils/components/custom_app_bar.dart';
import 'package:twaslna_dashboard/utils/global/global_state_manager.dart';

@injectable
class ProductsReportScreen extends StatefulWidget {
  final ProductsReportStateManager _stateManager;

  ProductsReportScreen(this._stateManager);

  @override
  ProductsReportScreenState createState() => ProductsReportScreenState();
}

class ProductsReportScreenState extends State<ProductsReportScreen> {
  late States currentState;

  @override
  void initState() {
    currentState = LoadingState(this);
    widget._stateManager.stateStream.listen((event) {
      currentState = event;
      refresh();
    });
    widget._stateManager.getReports(this);
    getIt<GlobalStateManager>().stateStream.listen((event) {
      getCaptains();
    });
    super.initState();
  }

  void getCaptains() {
    widget._stateManager.getReports(this);
  }

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTwaslnaAppBar.appBar(context,
          title: S.of(context).reportSent, icon: Icons.menu, onTap: () {
            GlobalVariable.mainScreenScaffold.currentState?.openDrawer();
          }),
      body: currentState.getUI(context),
    );
  }
}

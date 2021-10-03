import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_dashboard/abstracts/states/loading_state.dart';
import 'package:twaslna_dashboard/abstracts/states/state.dart';
import 'package:twaslna_dashboard/generated/l10n.dart';
import 'package:twaslna_dashboard/global_nav_key.dart';
import 'package:twaslna_dashboard/module_filters/state_manager/captain_filter_state_manager.dart';
import 'package:twaslna_dashboard/module_filters/state_manager/store_filter_state_manager.dart';
import 'package:twaslna_dashboard/module_filters/ui/state/filter_captain/captains_filter_loaded_state.dart';
import 'package:twaslna_dashboard/module_filters/ui/state/filter_store/stores_filter_loaded_state.dart';
import 'package:twaslna_dashboard/module_payments/request/captain_payments_request.dart';
import 'package:twaslna_dashboard/module_payments/state_manager/payments_from_state_manager.dart';
import 'package:twaslna_dashboard/utils/components/custom_app_bar.dart';


@injectable
class StoresFilterScreen extends StatefulWidget {

  final StoresFilterStateManager _stateManager;

  StoresFilterScreen(this._stateManager);

  @override
  StoresFilterScreenState createState() => StoresFilterScreenState();

}

class StoresFilterScreenState extends State<StoresFilterScreen> {
  late States currentState;
  @override
  void initState() {
    currentState = StoresFilterLoadedState(this,null);
    widget._stateManager.stateStream.listen((event) {
      currentState = event;
      refresh();
    });
    super.initState();
  }

  void getFilters(String key) {
    widget._stateManager.getStores(this,key);
  }
  void initFilterState(){
    currentState = StoresFilterLoadedState(this,null);
    refresh();
  }

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        if (GlobalVariable.navState.currentContext != null){
          var focus = FocusScope.of(context);
          if (focus.canRequestFocus){
            focus.unfocus();
          }
        }
      },
      child: Scaffold(
        appBar: CustomTwaslnaAppBar.appBar(context,
            title: S.of(context).storeLogs,icon: Icons.menu, onTap: () {
              GlobalVariable.mainScreenScaffold.currentState?.openDrawer();
            }),
        body: currentState.getUI(context),
      ),
    );
  }
}

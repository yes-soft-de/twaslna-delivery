import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_account/ui/state/account/account_state.dart';
import 'package:twaslna_delivery/module_account/ui/state/account/account_loaded_state.dart';

@injectable
class AccountScreen extends StatefulWidget {

  AccountScreen();

  @override
  AccountScreenState createState() => AccountScreenState();
}

class AccountScreenState extends State<AccountScreen> {
  late AccountState currentState;

  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    currentState = AccountLoadedState(this);
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        var focus = FocusScope.of(context);
        if (focus.canRequestFocus){
          focus.unfocus();
        }
      },
      child: Scaffold(
        body: currentState.getUI(context),
      ),
    );
  }
}

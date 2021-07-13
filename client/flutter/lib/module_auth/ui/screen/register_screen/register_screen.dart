import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_auth/enums/user_type.dart';
import 'package:twaslna_delivery/module_auth/state_manager/register_state_manager/register_state_manager.dart';
import 'package:twaslna_delivery/module_auth/ui/states/register_states/register_state.dart';
import 'package:twaslna_delivery/module_auth/ui/states/register_states/register_state_init.dart';
import 'package:flutter/material.dart';

@injectable
class RegisterScreen extends StatefulWidget {
  final RegisterStateManager _stateManager;

  RegisterScreen(this._stateManager);

  @override
  State<StatefulWidget> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  late RegisterState _currentState;
  @override
  void initState() {
    super.initState();

    _currentState = RegisterStateInit(this);
    widget._stateManager.stateStream.listen((event) {
      if (this.mounted) {
        setState(() {
          _currentState = event;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var focus = FocusScope.of(context);
        if (focus.canRequestFocus) {
          focus.unfocus();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: _currentState.getUI(context),
        ),
      ),
    );
  }

  void refresh() {
    if (mounted) setState(() {});
  }

  void registerCaptain(String phoneNumber) {
    widget._stateManager.registerCaptain(phoneNumber, this);
  }

  void registerOwner(String email, String username, String password) {
        widget._stateManager.registerOwner(email, username, password, this);
  }

  void confirmCaptainSMS(String smsCode) {
    widget._stateManager.confirmCaptainCode(smsCode);
  }

  void retryPhone() {
    _currentState = RegisterStateInit(this);
  }

  void moveToNext() {
   //move to init screen
  }
}

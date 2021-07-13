import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_auth/state_manager/login_state_manager/login_state_manager.dart';
import 'package:twaslna_delivery/module_auth/ui/states/login_states/login_state.dart';
import 'package:twaslna_delivery/module_auth/ui/states/login_states/login_state_init.dart';
import 'package:flutter/material.dart';

@injectable
class LoginScreen extends StatefulWidget {
  final LoginStateManager _stateManager;

  LoginScreen(this._stateManager);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {

  late LoginState _currentStates;

  late StreamSubscription _stateSubscription;
  bool deepLinkChecked = false;
  void refresh() {
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _currentStates = LoginStateInit(this);
    _stateSubscription = widget._stateManager.stateStream.listen((event) {
      if (mounted) {
        setState(() {
          _currentStates = event;
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
          child: _currentStates.getUI(context),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _stateSubscription.cancel();
    super.dispose();
  }

  void loginCaptain(String phoneNumber) {
    widget._stateManager.loginCaptain(phoneNumber, this);
  }

  void loginOwner(String email, String password) {
    widget._stateManager.loginOwner(email, password, this);
  }

  void confirmCaptainSMS(String smsCode) {
    widget._stateManager.confirmCaptainCode(smsCode, this);
  }

  void retryPhone() {
    _currentStates = LoginStateInit(this);
    if (mounted) setState(() {});
  }
}

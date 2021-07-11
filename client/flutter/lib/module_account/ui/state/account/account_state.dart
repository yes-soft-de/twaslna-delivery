import 'package:flutter/material.dart';
import 'package:twaslna_delivery/module_account/ui/screen/account_screen.dart';

abstract class AccountState {
  final AccountScreenState accountScreenState;

  AccountState(this.accountScreenState);

  Widget getUI(BuildContext context);
}

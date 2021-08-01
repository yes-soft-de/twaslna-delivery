import 'package:twaslna_delivery/module_auth/enums/user_type.dart';
import 'package:twaslna_delivery/module_auth/ui/screen/register_screen/register_screen.dart';
import 'package:twaslna_delivery/module_auth/ui/states/register_states/register_state.dart';
import 'package:twaslna_delivery/module_auth/ui/widget/email_password_register/email_password_register.dart';
import 'package:twaslna_delivery/module_auth/ui/widget/phone_login/phone_login.dart';
import 'package:twaslna_delivery/module_auth/ui/widget/user_type_selector/user_type_selector.dart';
import 'package:flutter/material.dart';

class RegisterStateError extends RegisterState {
  String errorMsg;
  RegisterStateError(RegisterScreenState screen, this.errorMsg) : super(screen);

  @override
  Widget getUI(BuildContext context) {
return Container();
  }
}

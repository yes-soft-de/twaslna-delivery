import 'package:twaslna_delivery/module_auth/enums/user_type.dart';
import 'package:twaslna_delivery/module_auth/ui/screen/login_screen/login_screen.dart';
import 'package:twaslna_delivery/module_auth/ui/states/login_states/login_state.dart';
import 'package:twaslna_delivery/module_auth/ui/widget/email_password_login/email_password_login.dart';
import 'package:twaslna_delivery/module_auth/ui/widget/phone_login/phone_login.dart';
import 'package:twaslna_delivery/module_auth/ui/widget/user_type_selector/user_type_selector.dart';
import 'package:flutter/material.dart';

import '../../../authorization_routes.dart';

class LoginStateError extends LoginState {
  String errorMsg;
  UserRole userType = UserRole.ROLE_OWNER;
  var loginTypeController =
      PageController(initialPage: UserRole.ROLE_OWNER.index);
  bool loading = false;
  bool flag = true;
  String email;
  String password;

  LoginStateError(
      LoginScreenState screen, this.errorMsg, this.email, this.password)
      : super(screen);

  @override
  Widget getUI(BuildContext context) {
    return Container();
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:twaslna_captain/generated/l10n.dart';
import 'package:twaslna_captain/module_profile/ui/screen/edit_profile/edit_profile.dart';
import 'package:twaslna_captain/module_profile/ui/states/profile_state/profile_state.dart';

class ProfileStateLoading extends ProfileState {
  ProfileStateLoading(EditProfileScreenState screenState) : super(screenState);
  @override
  Widget getUI(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
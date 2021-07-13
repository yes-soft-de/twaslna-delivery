import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_account/account_routes.dart';
import 'package:twaslna_delivery/module_account/ui/screen/account_screen.dart';
import 'package:flutter/material.dart';
import 'package:twaslna_delivery/module_account/ui/state/account/account_state.dart';
import 'package:twaslna_delivery/module_account/ui/widget/account_app_bar.dart';
import 'package:twaslna_delivery/module_account/ui/widget/account_tile.dart';
import 'package:twaslna_delivery/module_account/ui/widget/account_unsigned_app_bar.dart';
import 'package:twaslna_delivery/module_settings/setting_routes.dart';
import 'package:twaslna_delivery/utils/text_style/text_style.dart';

class AccountLoadedState extends AccountState {
  AccountScreenState screenState;
  bool signIn;
  AccountLoadedState(this.screenState,{this.signIn = true}) : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: ListView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: [
          signIn?AccountAppBar():AccountUnsignedAppBar(),
          Padding(
            padding: const EdgeInsets.only(right: 25.0, left: 25),
            child: Divider(
              color: Theme.of(context).backgroundColor,
              thickness: 2,
            ),
          ),
          signIn?AccountTile(text:S.of(context).personalData,icon:Icons.person,onTap: (){
            Navigator.of(context).pushNamed(AccountRoutes.PERSONAL_DATA);
          },):Container(),
          AccountTile(text:S.of(context).settings,icon:Icons.settings,onTap: (){
            Navigator.of(context).pushNamed(SettingRoutes.ROUTE_SETTINGS);
          },),
          AccountTile(text:S.of(context).orderLog,icon:Icons.history,),
          Padding(
            padding: const EdgeInsets.only(right: 25.0, left: 25),
            child: Divider(
              color: Theme.of(context).backgroundColor,
              thickness: 2,
            ),
          ),
          AccountTile(text:S.of(context).community,icon:Icons.people,),
          AccountTile(text:S.of(context).termsOfService,icon:Icons.sticky_note_2_rounded,),
          AccountTile(text:S.of(context).about,icon:Icons.info,),

        ],
      ),
    );
  }
}
import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:twaslna_delivery/module_auth/authorization_routes.dart';
import 'package:twaslna_delivery/module_notifications/service/fire_notification_service/fire_notification_service.dart';
import 'package:flutter/material.dart';
import 'package:twaslna_delivery/generated/l10n.dart';
import 'package:twaslna_delivery/module_auth/service/auth_service/auth_service.dart';
import 'package:twaslna_delivery/module_localization/service/localization_service/localization_service.dart';
import 'package:twaslna_delivery/module_theme/service/theme_service/theme_service.dart';

@injectable
class SettingsScreen extends StatefulWidget {
  final AuthService _authService;
  final LocalizationService _localizationService;
  final AppThemeDataService _themeDataService;
  final FireNotificationService _notificationService;

  SettingsScreen(
    this._authService,
    this._localizationService,
    this._themeDataService,
    this._notificationService,
  );

  @override
  State<StatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(S.of(context).personalData,style: TextStyle(
          color: Theme.of(context).textTheme.bodyText1!.color
        ),),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_back,
                    color: Theme.of(context).brightness != Brightness.dark ? Theme.of(context).disabledColor : Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 8.0, left: 8.0),
        child: ListView(
          physics:
              BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          children: [
            Container(
              height: 16,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).backgroundColor,
              ),
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  ListTileSwitch(
                    value: Theme.of(context).brightness == Brightness.dark,
                    leading: Icon(
                        Theme.of(context).brightness == Brightness.dark
                            ? Icons.nightlight_round_rounded
                            : Icons.wb_sunny),
                    onChanged: (mode) {
                      widget._themeDataService
                          .switchDarkMode(mode)
                          .then((value) {});
                    },
                    visualDensity: VisualDensity.comfortable,
                    switchType: SwitchType.cupertino,
                    switchActiveColor: Theme.of(context).primaryColor,
                    title: Text(S.of(context).darkMode),
                  ),
                  ListTile(
                    leading: Icon(Icons.language),
                    title: Text(S.of(context).language),
                    trailing: DropdownButton(
                        value: Localizations.localeOf(context).languageCode,
                        underline: Container(),
                        icon: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(Icons.arrow_drop_down_rounded),
                        ),
                        items: [
                          DropdownMenuItem(
                            child: Text('العربية'),
                            value: 'ar',
                          ),
                          DropdownMenuItem(
                            child: Text('English'),
                            value: 'en',
                          ),
                        ],
                        onChanged: (newLang) {
                          widget._localizationService
                              .setLanguage(newLang.toString());
                        }),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  // Flex(
                  //   direction: Axis.horizontal,
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(S.of(context).language),
                  //     FutureBuilder(
                  //       initialData: Platform.localeName.substring(0, 2),
                  //       future: widget._localizationService.getLanguage(),
                  //       builder: (BuildContext context,
                  //           AsyncSnapshot<String> snapshot) {
                  //         return DropdownButton(
                  //             value: snapshot.data ??
                  //                 Platform.localeName.substring(0, 2),
                  //             items: [
                  //               DropdownMenuItem(
                  //                 child: Text('العربية'),
                  //                 value: 'ar',
                  //               ),
                  //               DropdownMenuItem(
                  //                 child: Text('English'),
                  //                 value: 'en',
                  //               ),
                  //             ],
                  //             onChanged: (newLang) {
                  //               widget._localizationService
                  //                   .setLanguage(newLang.toString());
                  //             });
                  //       },
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Container(
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.all(Radius.circular(8)),
            //       color: Colors.black12,
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: FutureBuilder(
            //         future: widget._authService.isLoggedIn,
            //         initialData: false,
            //         builder:
            //             (BuildContext context, AsyncSnapshot<bool> snapshot) {
            //           if (snapshot.data!) {
            //             return Flex(
            //               direction: Axis.horizontal,
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Text(S.of(context).signOut),
            //                 IconButton(
            //                     icon: Icon(Icons.logout),
            //                     onPressed: () {
            //                       widget._authService.logout().then((value) {
            //                         Navigator.pushNamedAndRemoveUntil(
            //                             context,
            //                             AuthorizationRoutes.LOGIN_SCREEN,
            //                             (route) => false);
            //                       });
            //                     })
            //               ],
            //             );
            //           } else {
            //             return Flex(
            //               direction: Axis.horizontal,
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Text(S.of(context).login),
            //                 IconButton(
            //                     icon: Icon(Icons.login),
            //                     onPressed: () {
            //                       Navigator.of(context).pushNamed(
            //                           AuthorizationRoutes.LOGIN_SCREEN);
            //                     })
            //               ],
            //             );
            //           }
            //         },
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

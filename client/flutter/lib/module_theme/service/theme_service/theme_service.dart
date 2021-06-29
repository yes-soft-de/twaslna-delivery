import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:twaslna_delivery/module_theme/pressistance/theme_preferences_helper.dart';

@injectable
class AppThemeDataService {
  static final PublishSubject<ThemeData> _darkModeSubject =
      PublishSubject<ThemeData>();

  Stream<ThemeData> get darkModeStream => _darkModeSubject.stream;

  final ThemePreferencesHelper _preferencesHelper;

  AppThemeDataService(this._preferencesHelper);

  static Color get PrimaryColor {
    return Colors.orange;
  }

  static Color get PrimaryDarker {
    return Color(0xFF665EFF);
  }

  static Color get AccentColor {
    return Color(0xFFBE1E2D);
  }

  Future<ThemeData> getActiveTheme() async {
    var dark = await _preferencesHelper.isDarkMode();
    if (dark == true) {
      return ThemeData(
        brightness: Brightness.dark,
        primaryColor: PrimaryColor,
        primaryColorDark: PrimaryDarker,
        accentColor: AccentColor,
        cardColor: Colors.grey[150],
        appBarTheme: AppBarTheme(
          centerTitle: true,
          textTheme: TextTheme(),
          brightness: Brightness.dark,
          color: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
        ),
      );
    }
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: PrimaryColor,
      primaryColorDark: PrimaryDarker,
      accentColor: AccentColor,
      focusColor: PrimaryColor,
      primarySwatch: Colors.orange,
      cardColor: Color.fromRGBO(245, 245, 245, 1),
      backgroundColor: Color.fromRGBO(235, 235, 235, 1),
      fontFamily: GoogleFonts.almarai().fontFamily,
      fixTextFieldOutlineLabel:true,
      appBarTheme: AppBarTheme(centerTitle: true, color: Colors.white),
    );
  }

  Future<void> switchDarkMode(bool darkMode) async {
    if (darkMode) {
      await _preferencesHelper.setDarkMode();
    } else {
      await _preferencesHelper.setDayMode();
    }
    var activeTheme = await getActiveTheme();
    _darkModeSubject.add(activeTheme);
  }
}

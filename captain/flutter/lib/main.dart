import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:twaslna_captain/abstracts/module/yes_module.dart';
import 'package:twaslna_captain/di/di_config.dart';
import 'package:twaslna_captain/hive/hive_init.dart';
import 'package:twaslna_captain/module_auth/authoriazation_module.dart';
import 'package:twaslna_captain/module_chat/chat_module.dart';
import 'package:twaslna_captain/module_localization/service/localization_service/localization_service.dart';
import 'package:twaslna_captain/module_notifications/service/fire_notification_service/fire_notification_service.dart';
import 'package:twaslna_captain/module_settings/settings_module.dart';
import 'package:twaslna_captain/module_splash/splash_module.dart';
import 'package:twaslna_captain/module_theme/service/theme_service/theme_service.dart';
import 'package:twaslna_captain/utils/logger/logger.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'module_notifications/service/local_notification_service/local_notification_service.dart';
import 'module_splash/splash_routes.dart';
import 'package:timeago/timeago.dart' as timeago;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  timeago.setLocaleMessages('ar', timeago.ArMessages());
  timeago.setLocaleMessages('en', timeago.EnMessages());
  await HiveSetUp.init();
  await Firebase.initializeApp();
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = (FlutterErrorDetails details) {
    FirebaseCrashlytics.instance.recordFlutterError(details);
  };

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) async {
    FlutterError.onError = (FlutterErrorDetails details) async {
      Logger().error('Main', details.toString(), StackTrace.current);
    };
    await runZonedGuarded(() {
      configureDependencies();
      // Your App Here
      runApp(getIt<MyApp>());
    }, (error, stackTrace) {
      new Logger().error(
          'Main', error.toString() + stackTrace.toString(), StackTrace.current);
    });
  });
}

@injectable
class MyApp extends StatefulWidget {
  final AppThemeDataService _themeDataService;
  final LocalizationService _localizationService;
  final FireNotificationService _fireNotificationService;
  final LocalNotificationService _localNotificationService;
  final SplashModule _splashModule;
  final AuthorizationModule _authorizationModule;
  final SettingsModule _settingsModule;
  final ChatModule _chatModule;
  MyApp(
      this._themeDataService,
      this._localizationService,
      this._fireNotificationService,
      this._localNotificationService,
      this._splashModule,
      this._authorizationModule,
      this._chatModule,
      this._settingsModule,
      );

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  //Initialisation of local notification

  //end
  late String lang;
  late ThemeData activeTheme;
  bool authorized = false;
  late StreamSubscription streamSubscription;

  @override
  void initState() {
    super.initState();
    widget._fireNotificationService.init();
    widget._localNotificationService.init();
    widget._localizationService.localizationStream.listen((event) {
      timeago.setDefaultLocale(event);
      setState(() {});
    });
    widget._fireNotificationService.onNotificationStream.listen((event) {
      widget._localNotificationService.showNotification(event);
    });
    widget._localNotificationService.onLocalNotificationStream
        .listen((event) {});

    widget._themeDataService.darkModeStream.listen((event) {
      activeTheme = event;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return getConfiguratedApp(YesModule.RoutesMap);
  }

  Widget getConfiguratedApp(
    Map<String, WidgetBuilder> fullRoutesList,
  ) {
    var activeLanguage = widget._localizationService.getLanguage();
    var theme = widget._themeDataService.getActiveTheme();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorObservers: <NavigatorObserver>[observer],
      locale: Locale.fromSubtags(
        languageCode: activeLanguage,
      ),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: theme,
      supportedLocales: S.delegate.supportedLocales,
      title: 'Twaslna Captain',
      routes: fullRoutesList,
      initialRoute: SplashRoutes.SPLASH_SCREEN,
    );
  }
}
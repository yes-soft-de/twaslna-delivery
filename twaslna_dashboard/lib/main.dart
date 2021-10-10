import 'dart:async';
import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:simple_moment/simple_moment.dart';
import 'package:twaslna_dashboard/abstracts/module/yes_module.dart';
import 'package:twaslna_dashboard/di/di_config.dart';
import 'package:twaslna_dashboard/global_nav_key.dart';
import 'package:twaslna_dashboard/hive/hive_init.dart';
import 'package:twaslna_dashboard/module_auth/authoriazation_module.dart';
import 'package:twaslna_dashboard/module_captain/captains_module.dart';
import 'package:twaslna_dashboard/module_categories/categories_module.dart';
import 'package:twaslna_dashboard/module_chat/chat_module.dart';
import 'package:twaslna_dashboard/module_company/company_module.dart';
import 'package:twaslna_dashboard/module_filters/filters_module.dart';
import 'package:twaslna_dashboard/module_localization/service/localization_service/localization_service.dart';
import 'package:twaslna_dashboard/module_logs/logs_module.dart';
import 'package:twaslna_dashboard/module_main/main_module.dart';
import 'package:twaslna_dashboard/module_notifications/service/fire_notification_service/fire_notification_service.dart';
import 'package:twaslna_dashboard/module_orders/orders_module.dart';
import 'package:twaslna_dashboard/module_payments/payments_module.dart';
import 'package:twaslna_dashboard/module_settings/settings_module.dart';
import 'package:twaslna_dashboard/module_splash/splash_module.dart';
import 'package:twaslna_dashboard/module_stores/stores_module.dart';
import 'package:twaslna_dashboard/module_theme/service/theme_service/theme_service.dart';
import 'package:twaslna_dashboard/utils/logger/logger.dart';
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
import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  timeago.setLocaleMessages('ar', timeago.ArMessages());
  timeago.setLocaleMessages('en', timeago.EnMessages());
  await HiveSetUp.init();
  await Firebase.initializeApp();
  if (kIsWeb) {
  } else {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    FlutterError.onError = (FlutterErrorDetails details) {
      FirebaseCrashlytics.instance.recordFlutterError(details);
    };
  }
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
  final MainModule _mainModule;
  final CategoriesModule _categoriesModule;
  final StoresModule _storesModule;
  final CaptainsModule _productsModule;
  final CompanyModule _companyModule;
  final OrdersModule _ordersModule;
  final PaymentsModule _paymentsModule;
  final FiltersModule _filtersModule;
  final LogsModule _logsModule;

  MyApp(
      this._themeDataService,
      this._localizationService,
      this._fireNotificationService,
      this._localNotificationService,
      this._splashModule,
      this._authorizationModule,
      this._chatModule,
      this._settingsModule,
      this._mainModule,
      this._categoriesModule,
      this._storesModule,
      this._productsModule,
      this._companyModule,
      this._ordersModule,
      this._paymentsModule,
      this._filtersModule,
      this._logsModule);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);
  late String lang;
  late ThemeData activeTheme;
  bool authorized = false;

  @override
  void initState() {
    super.initState();
    lang = widget._localizationService.getLanguage();
    activeTheme = widget._themeDataService.getActiveTheme();
    timeago.setDefaultLocale(lang);
    Moment.setLocaleGlobally(lang == 'en' ? LocaleEn() : LocaleAr());
    //widget._fireNotificationService.init();
    //widget._localNotificationService.init();
    widget._localizationService.localizationStream.listen((event) {
      timeago.setDefaultLocale(event);
      Moment.setLocaleGlobally(event == 'en' ? LocaleEn() : LocaleAr());
      lang = event;
      setState(() {});
    });
    // widget._fireNotificationService.onNotificationStream.listen((event) {
    //   widget._localNotificationService.showNotification(event);
    // });
    // widget._localNotificationService.onLocalNotificationStream
    //     .listen((event) {});
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
    return FeatureDiscovery(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorObservers: <NavigatorObserver>[observer],
        navigatorKey: GlobalVariable.navState,
        locale: Locale.fromSubtags(
          languageCode: lang,
        ),
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: activeTheme,
        supportedLocales: S.delegate.supportedLocales,
        title: 'Twaslna Dashboard',
        routes: fullRoutesList,
        initialRoute: SplashRoutes.SPLASH_SCREEN,
      ),
    );
  }
}

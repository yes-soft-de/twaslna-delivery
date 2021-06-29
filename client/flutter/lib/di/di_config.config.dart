// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i73;
import '../module_account/account_module.dart' as _i22;
import '../module_account/manager/account_manager.dart' as _i21;
import '../module_account/repository/account_repository.dart' as _i3;
import '../module_account/service/account_service.dart' as _i23;
import '../module_account/state_manager/account_state_manager.dart' as _i24;
import '../module_account/ui/screen/account_screen.dart' as _i4;
import '../module_auth/authoriazation_module.dart' as _i67;
import '../module_auth/manager/auth_manager/auth_manager.dart' as _i39;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i5;
import '../module_auth/repository/auth/auth_repository.dart' as _i27;
import '../module_auth/service/auth_service/auth_service.dart' as _i40;
import '../module_auth/service/auth_service_without_fire_base/auth_service_api.dart'
    as _i41;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i47;
import '../module_auth/state_manager/register_state_manager/register_state_manager.dart'
    as _i49;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i59;
import '../module_auth/ui/screen/register_screen/register_screen.dart' as _i60;
import '../module_chat/bloc/chat_page/chat_page.bloc.dart' as _i68;
import '../module_chat/chat_module.dart' as _i72;
import '../module_chat/manager/chat/chat_manager.dart' as _i55;
import '../module_chat/repository/chat/chat_repository.dart' as _i42;
import '../module_chat/service/chat/char_service.dart' as _i56;
import '../module_chat/ui/screens/chat_page/chat_page.dart' as _i71;
import '../module_home/home_module.dart' as _i69;
import '../module_home/manager/home_manager.dart' as _i43;
import '../module_home/repository/home_repository.dart' as _i28;
import '../module_home/service/home_service.dart' as _i44;
import '../module_home/state_manager/home_state_manager.dart' as _i45;
import '../module_home/ui/screen/home_screen.dart' as _i58;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i7;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i8;
import '../module_main/main_module.dart' as _i29;
import '../module_main/ui/screen/main_screen.dart' as _i10;
import '../module_my_notifications/manager/my_notifications_manager.dart'
    as _i30;
import '../module_my_notifications/my_notifications_module.dart' as _i31;
import '../module_my_notifications/repository/my_notifications_repository.dart'
    as _i11;
import '../module_my_notifications/service/my_notification_service.dart'
    as _i32;
import '../module_my_notifications/state_manager/my_notifications_state_manager.dart'
    as _i33;
import '../module_my_notifications/ui/screen/my_notifications_screen.dart'
    as _i12;
import '../module_network/http_client/http_client.dart' as _i25;
import '../module_notifications/preferences/notification_preferences/notification_preferences.dart'
    as _i15;
import '../module_notifications/repository/notification_repo.dart' as _i48;
import '../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i57;
import '../module_notifications/service/local_notification_service/local_notification_service.dart'
    as _i6;
import '../module_orders/manager/my_orders_manager.dart' as _i34;
import '../module_orders/orders_module.dart' as _i16;
import '../module_orders/repository/my_orders_repository.dart' as _i13;
import '../module_orders/service/my_orders_service.dart' as _i35;
import '../module_orders/state_manager/my_orders_state_manager.dart' as _i36;
import '../module_orders/ui/screen/my_orders_screen.dart' as _i14;
import '../module_report/manager/report_manager.dart' as _i61;
import '../module_report/presistance/report_prefs_helper.dart' as _i17;
import '../module_report/repository/report_repository.dart' as _i50;
import '../module_report/service/report_service.dart' as _i62;
import '../module_settings/settings_module.dart' as _i70;
import '../module_settings/ui/settings_page/settings_page.dart' as _i63;
import '../module_splash/splash_module.dart' as _i64;
import '../module_splash/ui/screen/splash_screen.dart' as _i51;
import '../module_stores/manager/store_list_manager.dart' as _i52;
import '../module_stores/repository/store_list_repository.dart' as _i37;
import '../module_stores/service/store_list_service.dart' as _i53;
import '../module_stores/state_manager/store_list_state_manager.dart' as _i54;
import '../module_stores/store_module.dart' as _i66;
import '../module_stores/ui/screen/store_list_screen.dart' as _i65;
import '../module_stores/ui/screen/store_products_screen.dart' as _i18;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i19;
import '../module_theme/service/theme_service/theme_service.dart' as _i26;
import '../module_upload/manager/upload_manager/upload_manager.dart' as _i38;
import '../module_upload/repository/upload_repository/upload_repository.dart'
    as _i20;
import '../module_upload/service/image_upload/image_upload_service.dart'
    as _i46;
import '../utils/logger/logger.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AccountRepository>(() => _i3.AccountRepository());
  gh.factory<_i4.AccountScreen>(() => _i4.AccountScreen());
  gh.factory<_i5.AuthPrefsHelper>(() => _i5.AuthPrefsHelper());
  gh.factory<_i6.LocalNotificationService>(
      () => _i6.LocalNotificationService());
  gh.factory<_i7.LocalizationPreferencesHelper>(
      () => _i7.LocalizationPreferencesHelper());
  gh.factory<_i8.LocalizationService>(
      () => _i8.LocalizationService(get<_i7.LocalizationPreferencesHelper>()));
  gh.factory<_i9.Logger>(() => _i9.Logger());
  gh.factory<_i10.MainScreen>(() => _i10.MainScreen());
  gh.factory<_i11.MyNotificationsRepository>(
      () => _i11.MyNotificationsRepository());
  gh.factory<_i12.MyNotificationsScreen>(() => _i12.MyNotificationsScreen());
  gh.factory<_i13.MyOrdersRepository>(() => _i13.MyOrdersRepository());
  gh.factory<_i14.MyOrdersScreen>(() => _i14.MyOrdersScreen());
  gh.factory<_i15.NotificationsPrefsHelper>(
      () => _i15.NotificationsPrefsHelper());
  gh.factory<_i16.OrdersModule>(
      () => _i16.OrdersModule(get<_i14.MyOrdersScreen>()));
  gh.factory<_i17.ReportPrefsHelper>(() => _i17.ReportPrefsHelper());
  gh.factory<_i18.StoreProductsScreen>(() => _i18.StoreProductsScreen());
  gh.factory<_i19.ThemePreferencesHelper>(() => _i19.ThemePreferencesHelper());
  gh.factory<_i20.UploadRepository>(() => _i20.UploadRepository());
  gh.factory<_i21.AccountManager>(
      () => _i21.AccountManager(get<_i3.AccountRepository>()));
  gh.factory<_i22.AccountModule>(
      () => _i22.AccountModule(get<_i4.AccountScreen>()));
  gh.factory<_i23.AccountService>(
      () => _i23.AccountService(get<_i21.AccountManager>()));
  gh.factory<_i24.AccountStateManager>(
      () => _i24.AccountStateManager(get<_i23.AccountService>()));
  gh.factory<_i25.ApiClient>(() => _i25.ApiClient(get<_i9.Logger>()));
  gh.factory<_i26.AppThemeDataService>(
      () => _i26.AppThemeDataService(get<_i19.ThemePreferencesHelper>()));
  gh.factory<_i27.AuthRepository>(
      () => _i27.AuthRepository(get<_i25.ApiClient>()));
  gh.factory<_i28.HomeRepository>(
      () => _i28.HomeRepository(get<_i25.ApiClient>()));
  gh.factory<_i29.MainModule>(() => _i29.MainModule(get<_i10.MainScreen>()));
  gh.factory<_i30.MyNotificationsManager>(
      () => _i30.MyNotificationsManager(get<_i11.MyNotificationsRepository>()));
  gh.factory<_i31.MyNotificationsModule>(
      () => _i31.MyNotificationsModule(get<_i12.MyNotificationsScreen>()));
  gh.factory<_i32.MyNotificationsService>(
      () => _i32.MyNotificationsService(get<_i30.MyNotificationsManager>()));
  gh.factory<_i33.MyNotificationsStateManager>(() =>
      _i33.MyNotificationsStateManager(get<_i32.MyNotificationsService>()));
  gh.factory<_i34.MyOrdersManager>(
      () => _i34.MyOrdersManager(get<_i13.MyOrdersRepository>()));
  gh.factory<_i35.MyOrdersService>(
      () => _i35.MyOrdersService(get<_i34.MyOrdersManager>()));
  gh.factory<_i36.MyOrdersStateManager>(
      () => _i36.MyOrdersStateManager(get<_i35.MyOrdersService>()));
  gh.factory<_i37.StoreListRepository>(
      () => _i37.StoreListRepository(get<_i25.ApiClient>()));
  gh.factory<_i38.UploadManager>(
      () => _i38.UploadManager(get<_i20.UploadRepository>()));
  gh.factory<_i39.AuthManager>(
      () => _i39.AuthManager(get<_i27.AuthRepository>()));
  gh.factory<_i40.AuthService>(() =>
      _i40.AuthService(get<_i5.AuthPrefsHelper>(), get<_i39.AuthManager>()));
  gh.factory<_i41.AuthServiceApi>(() =>
      _i41.AuthServiceApi(get<_i5.AuthPrefsHelper>(), get<_i39.AuthManager>()));
  gh.factory<_i42.ChatRepository>(() =>
      _i42.ChatRepository(get<_i25.ApiClient>(), get<_i40.AuthService>()));
  gh.factory<_i43.HomeManager>(
      () => _i43.HomeManager(get<_i28.HomeRepository>()));
  gh.factory<_i44.HomeService>(() => _i44.HomeService(get<_i43.HomeManager>()));
  gh.factory<_i45.HomeStateManager>(
      () => _i45.HomeStateManager(get<_i44.HomeService>()));
  gh.factory<_i46.ImageUploadService>(
      () => _i46.ImageUploadService(get<_i38.UploadManager>()));
  gh.factory<_i47.LoginStateManager>(
      () => _i47.LoginStateManager(get<_i40.AuthService>()));
  gh.factory<_i48.NotificationRepo>(() =>
      _i48.NotificationRepo(get<_i25.ApiClient>(), get<_i40.AuthService>()));
  gh.factory<_i49.RegisterStateManager>(
      () => _i49.RegisterStateManager(get<_i40.AuthService>()));
  gh.factory<_i50.ReportRepository>(() => _i50.ReportRepository(
      get<_i25.ApiClient>(),
      get<_i40.AuthService>(),
      get<_i17.ReportPrefsHelper>()));
  gh.factory<_i51.SplashScreen>(
      () => _i51.SplashScreen(get<_i40.AuthService>()));
  gh.factory<_i52.StoreListManager>(
      () => _i52.StoreListManager(get<_i37.StoreListRepository>()));
  gh.factory<_i53.StoreListService>(
      () => _i53.StoreListService(get<_i52.StoreListManager>()));
  gh.factory<_i54.StoreListStateManager>(
      () => _i54.StoreListStateManager(get<_i53.StoreListService>()));
  gh.factory<_i55.ChatManager>(
      () => _i55.ChatManager(get<_i42.ChatRepository>()));
  gh.factory<_i56.ChatService>(() => _i56.ChatService(get<_i55.ChatManager>()));
  gh.factory<_i57.FireNotificationService>(() => _i57.FireNotificationService(
      get<_i15.NotificationsPrefsHelper>(), get<_i48.NotificationRepo>()));
  gh.factory<_i58.HomeScreen>(
      () => _i58.HomeScreen(get<_i45.HomeStateManager>()));
  gh.factory<_i59.LoginScreen>(
      () => _i59.LoginScreen(get<_i47.LoginStateManager>()));
  gh.factory<_i60.RegisterScreen>(
      () => _i60.RegisterScreen(get<_i49.RegisterStateManager>()));
  gh.factory<_i61.ReportManager>(
      () => _i61.ReportManager(get<_i50.ReportRepository>()));
  gh.factory<_i62.ReportService>(
      () => _i62.ReportService(get<_i61.ReportManager>()));
  gh.factory<_i63.SettingsScreen>(() => _i63.SettingsScreen(
      get<_i40.AuthService>(),
      get<_i8.LocalizationService>(),
      get<_i26.AppThemeDataService>(),
      get<_i57.FireNotificationService>()));
  gh.factory<_i64.SplashModule>(
      () => _i64.SplashModule(get<_i51.SplashScreen>()));
  gh.factory<_i65.StoreListScreen>(
      () => _i65.StoreListScreen(get<_i54.StoreListStateManager>()));
  gh.factory<_i66.StoreModule>(() => _i66.StoreModule(
      get<_i65.StoreListScreen>(), get<_i18.StoreProductsScreen>()));
  gh.factory<_i67.AuthorizationModule>(() => _i67.AuthorizationModule(
      get<_i59.LoginScreen>(), get<_i60.RegisterScreen>()));
  gh.factory<_i68.ChatPageBloc>(
      () => _i68.ChatPageBloc(get<_i56.ChatService>()));
  gh.factory<_i69.HomeModule>(() => _i69.HomeModule(get<_i58.HomeScreen>()));
  gh.factory<_i70.SettingsModule>(
      () => _i70.SettingsModule(get<_i63.SettingsScreen>()));
  gh.factory<_i71.ChatPage>(() =>
      _i71.ChatPage(get<_i68.ChatPageBloc>(), get<_i46.ImageUploadService>()));
  gh.factory<_i72.ChatModule>(
      () => _i72.ChatModule(get<_i71.ChatPage>(), get<_i40.AuthService>()));
  gh.factory<_i73.MyApp>(() => _i73.MyApp(
      get<_i26.AppThemeDataService>(),
      get<_i8.LocalizationService>(),
      get<_i57.FireNotificationService>(),
      get<_i6.LocalNotificationService>(),
      get<_i64.SplashModule>(),
      get<_i67.AuthorizationModule>(),
      get<_i72.ChatModule>(),
      get<_i70.SettingsModule>(),
      get<_i69.HomeModule>(),
      get<_i29.MainModule>(),
      get<_i66.StoreModule>(),
      get<_i31.MyNotificationsModule>(),
      get<_i22.AccountModule>()));
  return get;
}

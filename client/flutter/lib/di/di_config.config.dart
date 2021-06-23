// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i60;
import '../module_auth/authoriazation_module.dart' as _i55;
import '../module_auth/manager/auth_manager/auth_manager.dart' as _i33;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i3;
import '../module_auth/repository/auth/auth_repository.dart' as _i20;
import '../module_auth/service/auth_service/auth_service.dart' as _i34;
import '../module_auth/service/auth_service_without_fire_base/auth_service_api.dart'
    as _i35;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i39;
import '../module_auth/state_manager/register_state_manager/register_state_manager.dart'
    as _i41;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i49;
import '../module_auth/ui/screen/register_screen/register_screen.dart' as _i50;
import '../module_chat/bloc/chat_page/chat_page.bloc.dart' as _i56;
import '../module_chat/chat_module.dart' as _i59;
import '../module_chat/manager/chat/chat_manager.dart' as _i45;
import '../module_chat/repository/chat/chat_repository.dart' as _i36;
import '../module_chat/service/chat/char_service.dart' as _i46;
import '../module_chat/ui/screens/chat_page/chat_page.dart' as _i58;
import '../module_home/home_module.dart' as _i48;
import '../module_home/manager/home_manager.dart' as _i21;
import '../module_home/repository/home_repository.dart' as _i4;
import '../module_home/service/home_service.dart' as _i22;
import '../module_home/state_manager/home_state_manager.dart' as _i23;
import '../module_home/ui/screen/home_screen.dart' as _i37;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i6;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i7;
import '../module_main/main_module.dart' as _i24;
import '../module_main/ui/screen/main_screen.dart' as _i9;
import '../module_network/http_client/http_client.dart' as _i18;
import '../module_notifications/preferences/notification_preferences/notification_preferences.dart'
    as _i12;
import '../module_notifications/repository/notification_repo.dart' as _i40;
import '../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i47;
import '../module_notifications/service/local_notification_service/local_notification_service.dart'
    as _i5;
import '../module_orders/manager/my_orders_manager.dart' as _i25;
import '../module_orders/orders_module.dart' as _i13;
import '../module_orders/repository/my_orders_repository.dart' as _i10;
import '../module_orders/service/my_orders_service.dart' as _i26;
import '../module_orders/state_manager/my_orders_state_manager.dart' as _i27;
import '../module_orders/ui/screen/my_orders_screen.dart' as _i11;
import '../module_report/manager/report_manager.dart' as _i51;
import '../module_report/presistance/report_prefs_helper.dart' as _i14;
import '../module_report/repository/report_repository.dart' as _i42;
import '../module_report/service/report_service.dart' as _i52;
import '../module_settings/settings_module.dart' as _i57;
import '../module_settings/ui/settings_page/settings_page.dart' as _i53;
import '../module_splash/splash_module.dart' as _i54;
import '../module_splash/ui/screen/splash_screen.dart' as _i43;
import '../module_store_list/manager/store_list_manager.dart' as _i28;
import '../module_store_list/repository/store_list_repository.dart' as _i15;
import '../module_store_list/service/store_list_service.dart' as _i30;
import '../module_store_list/state_manager/store_list_state_manager.dart'
    as _i44;
import '../module_store_list/store_module.dart' as _i31;
import '../module_store_list/ui/screen/store_list_screen.dart' as _i29;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i16;
import '../module_theme/service/theme_service/theme_service.dart' as _i19;
import '../module_upload/manager/upload_manager/upload_manager.dart' as _i32;
import '../module_upload/repository/upload_repository/upload_repository.dart'
    as _i17;
import '../module_upload/service/image_upload/image_upload_service.dart'
    as _i38;
import '../utils/logger/logger.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AuthPrefsHelper>(() => _i3.AuthPrefsHelper());
  gh.factory<_i4.HomeRepository>(() => _i4.HomeRepository());
  gh.factory<_i5.LocalNotificationService>(
      () => _i5.LocalNotificationService());
  gh.factory<_i6.LocalizationPreferencesHelper>(
      () => _i6.LocalizationPreferencesHelper());
  gh.factory<_i7.LocalizationService>(
      () => _i7.LocalizationService(get<_i6.LocalizationPreferencesHelper>()));
  gh.factory<_i8.Logger>(() => _i8.Logger());
  gh.factory<_i9.MainScreen>(() => _i9.MainScreen());
  gh.factory<_i10.MyOrdersRepository>(() => _i10.MyOrdersRepository());
  gh.factory<_i11.MyOrdersScreen>(() => _i11.MyOrdersScreen());
  gh.factory<_i12.NotificationsPrefsHelper>(
      () => _i12.NotificationsPrefsHelper());
  gh.factory<_i13.OrdersModule>(
      () => _i13.OrdersModule(get<_i11.MyOrdersScreen>()));
  gh.factory<_i14.ReportPrefsHelper>(() => _i14.ReportPrefsHelper());
  gh.factory<_i15.StoreListRepository>(() => _i15.StoreListRepository());
  gh.factory<_i16.ThemePreferencesHelper>(() => _i16.ThemePreferencesHelper());
  gh.factory<_i17.UploadRepository>(() => _i17.UploadRepository());
  gh.factory<_i18.ApiClient>(() => _i18.ApiClient(get<_i8.Logger>()));
  gh.factory<_i19.AppThemeDataService>(
      () => _i19.AppThemeDataService(get<_i16.ThemePreferencesHelper>()));
  gh.factory<_i20.AuthRepository>(
      () => _i20.AuthRepository(get<_i18.ApiClient>()));
  gh.factory<_i21.HomeManager>(
      () => _i21.HomeManager(get<_i4.HomeRepository>()));
  gh.factory<_i22.HomeService>(() => _i22.HomeService(get<_i21.HomeManager>()));
  gh.factory<_i23.HomeStateManager>(
      () => _i23.HomeStateManager(get<_i22.HomeService>()));
  gh.factory<_i24.MainModule>(() => _i24.MainModule(get<_i9.MainScreen>()));
  gh.factory<_i25.MyOrdersManager>(
      () => _i25.MyOrdersManager(get<_i10.MyOrdersRepository>()));
  gh.factory<_i26.MyOrdersService>(
      () => _i26.MyOrdersService(get<_i25.MyOrdersManager>()));
  gh.factory<_i27.MyOrdersStateManager>(
      () => _i27.MyOrdersStateManager(get<_i26.MyOrdersService>()));
  gh.factory<_i28.StoreListManager>(
      () => _i28.StoreListManager(get<_i15.StoreListRepository>()));
  gh.factory<_i29.StoreListScreen>(
      () => _i29.StoreListScreen(get<_i28.StoreListManager>()));
  gh.factory<_i30.StoreListService>(
      () => _i30.StoreListService(get<_i28.StoreListManager>()));
  gh.factory<_i31.StoreModule>(
      () => _i31.StoreModule(get<_i29.StoreListScreen>()));
  gh.factory<_i32.UploadManager>(
      () => _i32.UploadManager(get<_i17.UploadRepository>()));
  gh.factory<_i33.AuthManager>(
      () => _i33.AuthManager(get<_i20.AuthRepository>()));
  gh.factory<_i34.AuthService>(() =>
      _i34.AuthService(get<_i3.AuthPrefsHelper>(), get<_i33.AuthManager>()));
  gh.factory<_i35.AuthServiceApi>(() =>
      _i35.AuthServiceApi(get<_i3.AuthPrefsHelper>(), get<_i33.AuthManager>()));
  gh.factory<_i36.ChatRepository>(() =>
      _i36.ChatRepository(get<_i18.ApiClient>(), get<_i34.AuthService>()));
  gh.factory<_i37.HomeScreen>(
      () => _i37.HomeScreen(get<_i23.HomeStateManager>()));
  gh.factory<_i38.ImageUploadService>(
      () => _i38.ImageUploadService(get<_i32.UploadManager>()));
  gh.factory<_i39.LoginStateManager>(
      () => _i39.LoginStateManager(get<_i34.AuthService>()));
  gh.factory<_i40.NotificationRepo>(() =>
      _i40.NotificationRepo(get<_i18.ApiClient>(), get<_i34.AuthService>()));
  gh.factory<_i41.RegisterStateManager>(
      () => _i41.RegisterStateManager(get<_i34.AuthService>()));
  gh.factory<_i42.ReportRepository>(() => _i42.ReportRepository(
      get<_i18.ApiClient>(),
      get<_i34.AuthService>(),
      get<_i14.ReportPrefsHelper>()));
  gh.factory<_i43.SplashScreen>(
      () => _i43.SplashScreen(get<_i34.AuthService>()));
  gh.factory<_i44.StoreListManager>(
      () => _i44.StoreListManager(get<_i30.StoreListService>()));
  gh.factory<_i45.ChatManager>(
      () => _i45.ChatManager(get<_i36.ChatRepository>()));
  gh.factory<_i46.ChatService>(() => _i46.ChatService(get<_i45.ChatManager>()));
  gh.factory<_i47.FireNotificationService>(() => _i47.FireNotificationService(
      get<_i12.NotificationsPrefsHelper>(), get<_i40.NotificationRepo>()));
  gh.factory<_i48.HomeModule>(() => _i48.HomeModule(get<_i37.HomeScreen>()));
  gh.factory<_i49.LoginScreen>(
      () => _i49.LoginScreen(get<_i39.LoginStateManager>()));
  gh.factory<_i50.RegisterScreen>(
      () => _i50.RegisterScreen(get<_i41.RegisterStateManager>()));
  gh.factory<_i51.ReportManager>(
      () => _i51.ReportManager(get<_i42.ReportRepository>()));
  gh.factory<_i52.ReportService>(
      () => _i52.ReportService(get<_i51.ReportManager>()));
  gh.factory<_i53.SettingsScreen>(() => _i53.SettingsScreen(
      get<_i34.AuthService>(),
      get<_i7.LocalizationService>(),
      get<_i19.AppThemeDataService>(),
      get<_i47.FireNotificationService>()));
  gh.factory<_i54.SplashModule>(
      () => _i54.SplashModule(get<_i43.SplashScreen>()));
  gh.factory<_i55.AuthorizationModule>(() => _i55.AuthorizationModule(
      get<_i49.LoginScreen>(), get<_i50.RegisterScreen>()));
  gh.factory<_i56.ChatPageBloc>(
      () => _i56.ChatPageBloc(get<_i46.ChatService>()));
  gh.factory<_i57.SettingsModule>(
      () => _i57.SettingsModule(get<_i53.SettingsScreen>()));
  gh.factory<_i58.ChatPage>(() =>
      _i58.ChatPage(get<_i56.ChatPageBloc>(), get<_i38.ImageUploadService>()));
  gh.factory<_i59.ChatModule>(
      () => _i59.ChatModule(get<_i58.ChatPage>(), get<_i34.AuthService>()));
  gh.factory<_i60.MyApp>(() => _i60.MyApp(
      get<_i19.AppThemeDataService>(),
      get<_i7.LocalizationService>(),
      get<_i47.FireNotificationService>(),
      get<_i5.LocalNotificationService>(),
      get<_i54.SplashModule>(),
      get<_i55.AuthorizationModule>(),
      get<_i59.ChatModule>(),
      get<_i57.SettingsModule>(),
      get<_i48.HomeModule>(),
      get<_i24.MainModule>(),
      get<_i31.StoreModule>()));
  return get;
}

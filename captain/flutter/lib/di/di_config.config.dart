// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i35;
import '../module_auth/authoriazation_module.dart' as _i30;
import '../module_auth/manager/auth_manager/auth_manager.dart' as _i15;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i3;
import '../module_auth/repository/auth/auth_repository.dart' as _i13;
import '../module_auth/service/auth_service/auth_service.dart' as _i16;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i19;
import '../module_auth/state_manager/register_state_manager/register_state_manager.dart'
    as _i21;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i26;
import '../module_auth/ui/screen/register_screen/register_screen.dart' as _i27;
import '../module_chat/bloc/chat_page/chat_page.bloc.dart' as _i31;
import '../module_chat/chat_module.dart' as _i34;
import '../module_chat/manager/chat/chat_manager.dart' as _i23;
import '../module_chat/repository/chat/chat_repository.dart' as _i17;
import '../module_chat/service/chat/char_service.dart' as _i24;
import '../module_chat/ui/screens/chat_page/chat_page.dart' as _i33;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i5;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i6;
import '../module_network/http_client/http_client.dart' as _i11;
import '../module_notifications/preferences/notification_preferences/notification_preferences.dart'
    as _i8;
import '../module_notifications/repository/notification_repo.dart' as _i20;
import '../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i25;
import '../module_notifications/service/local_notification_service/local_notification_service.dart'
    as _i4;
import '../module_settings/settings_module.dart' as _i32;
import '../module_settings/ui/settings_page/settings_page.dart' as _i28;
import '../module_splash/splash_module.dart' as _i29;
import '../module_splash/ui/screen/splash_screen.dart' as _i22;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i9;
import '../module_theme/service/theme_service/theme_service.dart' as _i12;
import '../module_upload/manager/upload_manager/upload_manager.dart' as _i14;
import '../module_upload/repository/upload_repository/upload_repository.dart'
    as _i10;
import '../module_upload/service/image_upload/image_upload_service.dart'
    as _i18;
import '../utils/logger/logger.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AuthPrefsHelper>(() => _i3.AuthPrefsHelper());
  gh.factory<_i4.LocalNotificationService>(
      () => _i4.LocalNotificationService());
  gh.factory<_i5.LocalizationPreferencesHelper>(
      () => _i5.LocalizationPreferencesHelper());
  gh.factory<_i6.LocalizationService>(
      () => _i6.LocalizationService(get<_i5.LocalizationPreferencesHelper>()));
  gh.factory<_i7.Logger>(() => _i7.Logger());
  gh.factory<_i8.NotificationsPrefsHelper>(
      () => _i8.NotificationsPrefsHelper());
  gh.factory<_i9.ThemePreferencesHelper>(() => _i9.ThemePreferencesHelper());
  gh.factory<_i10.UploadRepository>(() => _i10.UploadRepository());
  gh.factory<_i11.ApiClient>(() => _i11.ApiClient(get<_i7.Logger>()));
  gh.factory<_i12.AppThemeDataService>(
      () => _i12.AppThemeDataService(get<_i9.ThemePreferencesHelper>()));
  gh.factory<_i13.AuthRepository>(
      () => _i13.AuthRepository(get<_i11.ApiClient>(), get<_i7.Logger>()));
  gh.factory<_i14.UploadManager>(
      () => _i14.UploadManager(get<_i10.UploadRepository>()));
  gh.factory<_i15.AuthManager>(
      () => _i15.AuthManager(get<_i13.AuthRepository>()));
  gh.factory<_i16.AuthService>(() =>
      _i16.AuthService(get<_i3.AuthPrefsHelper>(), get<_i15.AuthManager>()));
  gh.factory<_i17.ChatRepository>(() =>
      _i17.ChatRepository(get<_i11.ApiClient>(), get<_i16.AuthService>()));
  gh.factory<_i18.ImageUploadService>(
      () => _i18.ImageUploadService(get<_i14.UploadManager>()));
  gh.factory<_i19.LoginStateManager>(
      () => _i19.LoginStateManager(get<_i16.AuthService>()));
  gh.factory<_i20.NotificationRepo>(() =>
      _i20.NotificationRepo(get<_i11.ApiClient>(), get<_i16.AuthService>()));
  gh.factory<_i21.RegisterStateManager>(
      () => _i21.RegisterStateManager(get<_i16.AuthService>()));
  gh.factory<_i22.SplashScreen>(
      () => _i22.SplashScreen(get<_i16.AuthService>()));
  gh.factory<_i23.ChatManager>(
      () => _i23.ChatManager(get<_i17.ChatRepository>()));
  gh.factory<_i24.ChatService>(() => _i24.ChatService(get<_i23.ChatManager>()));
  gh.factory<_i25.FireNotificationService>(() => _i25.FireNotificationService(
      get<_i8.NotificationsPrefsHelper>(), get<_i20.NotificationRepo>()));
  gh.factory<_i26.LoginScreen>(
      () => _i26.LoginScreen(get<_i19.LoginStateManager>()));
  gh.factory<_i27.RegisterScreen>(
      () => _i27.RegisterScreen(get<_i21.RegisterStateManager>()));
  gh.factory<_i28.SettingsScreen>(() => _i28.SettingsScreen(
      get<_i16.AuthService>(),
      get<_i6.LocalizationService>(),
      get<_i12.AppThemeDataService>(),
      get<_i25.FireNotificationService>()));
  gh.factory<_i29.SplashModule>(
      () => _i29.SplashModule(get<_i22.SplashScreen>()));
  gh.factory<_i30.AuthorizationModule>(() => _i30.AuthorizationModule(
      get<_i26.LoginScreen>(), get<_i27.RegisterScreen>()));
  gh.factory<_i31.ChatPageBloc>(
      () => _i31.ChatPageBloc(get<_i24.ChatService>()));
  gh.factory<_i32.SettingsModule>(
      () => _i32.SettingsModule(get<_i28.SettingsScreen>()));
  gh.factory<_i33.ChatPage>(() =>
      _i33.ChatPage(get<_i31.ChatPageBloc>(), get<_i18.ImageUploadService>()));
  gh.factory<_i34.ChatModule>(
      () => _i34.ChatModule(get<_i33.ChatPage>(), get<_i16.AuthService>()));
  gh.factory<_i35.MyApp>(() => _i35.MyApp(
      get<_i12.AppThemeDataService>(),
      get<_i6.LocalizationService>(),
      get<_i25.FireNotificationService>(),
      get<_i4.LocalNotificationService>(),
      get<_i29.SplashModule>(),
      get<_i30.AuthorizationModule>(),
      get<_i34.ChatModule>(),
      get<_i32.SettingsModule>()));
  return get;
}

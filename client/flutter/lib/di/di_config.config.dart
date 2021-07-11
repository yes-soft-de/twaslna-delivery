// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i80;
import '../module_account/account_module.dart' as _i24;
import '../module_account/manager/account_manager.dart' as _i23;
import '../module_account/repository/account_repository.dart' as _i3;
import '../module_account/service/account_service.dart' as _i25;
import '../module_account/state_manager/account_state_manager.dart' as _i26;
import '../module_account/ui/screen/account_screen.dart' as _i4;
import '../module_account/ui/screen/presonal_data_screen.dart' as _i19;
import '../module_auth/authoriazation_module.dart' as _i73;
import '../module_auth/manager/auth_manager/auth_manager.dart' as _i42;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i5;
import '../module_auth/repository/auth/auth_repository.dart' as _i29;
import '../module_auth/service/auth_service/auth_service.dart' as _i43;
import '../module_auth/service/auth_service_without_fire_base/auth_service_api.dart'
    as _i44;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i50;
import '../module_auth/state_manager/register_state_manager/register_state_manager.dart'
    as _i52;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i65;
import '../module_auth/ui/screen/register_screen/register_screen.dart' as _i66;
import '../module_chat/bloc/chat_page/chat_page.bloc.dart' as _i74;
import '../module_chat/chat_module.dart' as _i79;
import '../module_chat/manager/chat/chat_manager.dart' as _i61;
import '../module_chat/repository/chat/chat_repository.dart' as _i45;
import '../module_chat/service/chat/char_service.dart' as _i62;
import '../module_chat/ui/screens/chat_page/chat_page.dart' as _i78;
import '../module_home/home_module.dart' as _i75;
import '../module_home/manager/home_manager.dart' as _i46;
import '../module_home/repository/home_repository.dart' as _i30;
import '../module_home/service/home_service.dart' as _i47;
import '../module_home/state_manager/home_state_manager.dart' as _i48;
import '../module_home/ui/screen/home_screen.dart' as _i64;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i7;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i8;
import '../module_main/main_module.dart' as _i31;
import '../module_main/ui/screen/main_screen.dart' as _i10;
import '../module_my_notifications/manager/my_notifications_manager.dart'
    as _i32;
import '../module_my_notifications/my_notifications_module.dart' as _i33;
import '../module_my_notifications/repository/my_notifications_repository.dart'
    as _i11;
import '../module_my_notifications/service/my_notification_service.dart'
    as _i34;
import '../module_my_notifications/state_manager/my_notifications_state_manager.dart'
    as _i35;
import '../module_my_notifications/ui/screen/my_notifications_screen.dart'
    as _i12;
import '../module_network/http_client/http_client.dart' as _i27;
import '../module_notifications/preferences/notification_preferences/notification_preferences.dart'
    as _i15;
import '../module_notifications/repository/notification_repo.dart' as _i51;
import '../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i63;
import '../module_notifications/service/local_notification_service/local_notification_service.dart'
    as _i6;
import '../module_orders/manager/my_orders_manager.dart' as _i36;
import '../module_orders/orders_module.dart' as _i18;
import '../module_orders/repository/my_orders_repository.dart' as _i13;
import '../module_orders/service/my_orders_service.dart' as _i37;
import '../module_orders/state_manager/my_orders_state_manager.dart' as _i38;
import '../module_orders/ui/screen/my_orders_screen.dart' as _i14;
import '../module_orders/ui/screen/order_details_screen.dart' as _i16;
import '../module_orders/ui/screen/order_status_screen.dart' as _i17;
import '../module_report/manager/report_manager.dart' as _i67;
import '../module_report/presistance/report_prefs_helper.dart' as _i20;
import '../module_report/repository/report_repository.dart' as _i53;
import '../module_report/service/report_service.dart' as _i68;
import '../module_settings/settings_module.dart' as _i76;
import '../module_settings/ui/settings_page/settings_page.dart' as _i69;
import '../module_splash/splash_module.dart' as _i70;
import '../module_splash/ui/screen/splash_screen.dart' as _i54;
import '../module_stores/manager/store_list_manager.dart' as _i55;
import '../module_stores/manager/store_products.dart' as _i58;
import '../module_stores/repository/store_list_repository.dart' as _i39;
import '../module_stores/repository/store_products_repository.dart' as _i40;
import '../module_stores/service/store_list_service.dart' as _i56;
import '../module_stores/service/store_products_service.dart' as _i59;
import '../module_stores/state_manager/store_list_state_manager.dart' as _i57;
import '../module_stores/state_manager/store_products_state_manager.dart'
    as _i60;
import '../module_stores/store_module.dart' as _i77;
import '../module_stores/ui/screen/store_list_screen.dart' as _i71;
import '../module_stores/ui/screen/store_products_screen.dart' as _i72;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i21;
import '../module_theme/service/theme_service/theme_service.dart' as _i28;
import '../module_upload/manager/upload_manager/upload_manager.dart' as _i41;
import '../module_upload/repository/upload_repository/upload_repository.dart'
    as _i22;
import '../module_upload/service/image_upload/image_upload_service.dart'
    as _i49;
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
  gh.factory<_i16.OrderDetailsScreen>(() => _i16.OrderDetailsScreen());
  gh.factory<_i17.OrderStatusScreen>(() => _i17.OrderStatusScreen());
  gh.factory<_i18.OrdersModule>(() => _i18.OrdersModule(
      get<_i14.MyOrdersScreen>(),
      get<_i16.OrderDetailsScreen>(),
      get<_i17.OrderStatusScreen>()));
  gh.factory<_i19.PersonalDataScreen>(() => _i19.PersonalDataScreen());
  gh.factory<_i20.ReportPrefsHelper>(() => _i20.ReportPrefsHelper());
  gh.factory<_i21.ThemePreferencesHelper>(() => _i21.ThemePreferencesHelper());
  gh.factory<_i22.UploadRepository>(() => _i22.UploadRepository());
  gh.factory<_i23.AccountManager>(
      () => _i23.AccountManager(get<_i3.AccountRepository>()));
  gh.factory<_i24.AccountModule>(() => _i24.AccountModule(
      get<_i4.AccountScreen>(), get<_i19.PersonalDataScreen>()));
  gh.factory<_i25.AccountService>(
      () => _i25.AccountService(get<_i23.AccountManager>()));
  gh.factory<_i26.AccountStateManager>(
      () => _i26.AccountStateManager(get<_i25.AccountService>()));
  gh.factory<_i27.ApiClient>(() => _i27.ApiClient(get<_i9.Logger>()));
  gh.factory<_i28.AppThemeDataService>(
      () => _i28.AppThemeDataService(get<_i21.ThemePreferencesHelper>()));
  gh.factory<_i29.AuthRepository>(
      () => _i29.AuthRepository(get<_i27.ApiClient>()));
  gh.factory<_i30.HomeRepository>(
      () => _i30.HomeRepository(get<_i27.ApiClient>()));
  gh.factory<_i31.MainModule>(() => _i31.MainModule(get<_i10.MainScreen>()));
  gh.factory<_i32.MyNotificationsManager>(
      () => _i32.MyNotificationsManager(get<_i11.MyNotificationsRepository>()));
  gh.factory<_i33.MyNotificationsModule>(
      () => _i33.MyNotificationsModule(get<_i12.MyNotificationsScreen>()));
  gh.factory<_i34.MyNotificationsService>(
      () => _i34.MyNotificationsService(get<_i32.MyNotificationsManager>()));
  gh.factory<_i35.MyNotificationsStateManager>(() =>
      _i35.MyNotificationsStateManager(get<_i34.MyNotificationsService>()));
  gh.factory<_i36.MyOrdersManager>(
      () => _i36.MyOrdersManager(get<_i13.MyOrdersRepository>()));
  gh.factory<_i37.MyOrdersService>(
      () => _i37.MyOrdersService(get<_i36.MyOrdersManager>()));
  gh.factory<_i38.MyOrdersStateManager>(
      () => _i38.MyOrdersStateManager(get<_i37.MyOrdersService>()));
  gh.factory<_i39.StoreListRepository>(
      () => _i39.StoreListRepository(get<_i27.ApiClient>()));
  gh.factory<_i40.StoreProductsRepository>(
      () => _i40.StoreProductsRepository(get<_i27.ApiClient>()));
  gh.factory<_i41.UploadManager>(
      () => _i41.UploadManager(get<_i22.UploadRepository>()));
  gh.factory<_i42.AuthManager>(
      () => _i42.AuthManager(get<_i29.AuthRepository>()));
  gh.factory<_i43.AuthService>(() =>
      _i43.AuthService(get<_i5.AuthPrefsHelper>(), get<_i42.AuthManager>()));
  gh.factory<_i44.AuthServiceApi>(() =>
      _i44.AuthServiceApi(get<_i5.AuthPrefsHelper>(), get<_i42.AuthManager>()));
  gh.factory<_i45.ChatRepository>(() =>
      _i45.ChatRepository(get<_i27.ApiClient>(), get<_i43.AuthService>()));
  gh.factory<_i46.HomeManager>(
      () => _i46.HomeManager(get<_i30.HomeRepository>()));
  gh.factory<_i47.HomeService>(() => _i47.HomeService(get<_i46.HomeManager>()));
  gh.factory<_i48.HomeStateManager>(
      () => _i48.HomeStateManager(get<_i47.HomeService>()));
  gh.factory<_i49.ImageUploadService>(
      () => _i49.ImageUploadService(get<_i41.UploadManager>()));
  gh.factory<_i50.LoginStateManager>(
      () => _i50.LoginStateManager(get<_i43.AuthService>()));
  gh.factory<_i51.NotificationRepo>(() =>
      _i51.NotificationRepo(get<_i27.ApiClient>(), get<_i43.AuthService>()));
  gh.factory<_i52.RegisterStateManager>(
      () => _i52.RegisterStateManager(get<_i43.AuthService>()));
  gh.factory<_i53.ReportRepository>(() => _i53.ReportRepository(
      get<_i27.ApiClient>(),
      get<_i43.AuthService>(),
      get<_i20.ReportPrefsHelper>()));
  gh.factory<_i54.SplashScreen>(
      () => _i54.SplashScreen(get<_i43.AuthService>()));
  gh.factory<_i55.StoreListManager>(
      () => _i55.StoreListManager(get<_i39.StoreListRepository>()));
  gh.factory<_i56.StoreListService>(
      () => _i56.StoreListService(get<_i55.StoreListManager>()));
  gh.factory<_i57.StoreListStateManager>(
      () => _i57.StoreListStateManager(get<_i56.StoreListService>()));
  gh.factory<_i58.StoreProductsManager>(
      () => _i58.StoreProductsManager(get<_i40.StoreProductsRepository>()));
  gh.factory<_i59.StoreProductsService>(
      () => _i59.StoreProductsService(get<_i58.StoreProductsManager>()));
  gh.factory<_i60.StoreProductsStateManager>(
      () => _i60.StoreProductsStateManager(get<_i59.StoreProductsService>()));
  gh.factory<_i61.ChatManager>(
      () => _i61.ChatManager(get<_i45.ChatRepository>()));
  gh.factory<_i62.ChatService>(() => _i62.ChatService(get<_i61.ChatManager>()));
  gh.factory<_i63.FireNotificationService>(() => _i63.FireNotificationService(
      get<_i15.NotificationsPrefsHelper>(), get<_i51.NotificationRepo>()));
  gh.factory<_i64.HomeScreen>(
      () => _i64.HomeScreen(get<_i48.HomeStateManager>()));
  gh.factory<_i65.LoginScreen>(
      () => _i65.LoginScreen(get<_i50.LoginStateManager>()));
  gh.factory<_i66.RegisterScreen>(
      () => _i66.RegisterScreen(get<_i52.RegisterStateManager>()));
  gh.factory<_i67.ReportManager>(
      () => _i67.ReportManager(get<_i53.ReportRepository>()));
  gh.factory<_i68.ReportService>(
      () => _i68.ReportService(get<_i67.ReportManager>()));
  gh.factory<_i69.SettingsScreen>(() => _i69.SettingsScreen(
      get<_i43.AuthService>(),
      get<_i8.LocalizationService>(),
      get<_i28.AppThemeDataService>(),
      get<_i63.FireNotificationService>()));
  gh.factory<_i70.SplashModule>(
      () => _i70.SplashModule(get<_i54.SplashScreen>()));
  gh.factory<_i71.StoreListScreen>(
      () => _i71.StoreListScreen(get<_i57.StoreListStateManager>()));
  gh.factory<_i72.StoreProductsScreen>(
      () => _i72.StoreProductsScreen(get<_i60.StoreProductsStateManager>()));
  gh.factory<_i73.AuthorizationModule>(() => _i73.AuthorizationModule(
      get<_i65.LoginScreen>(), get<_i66.RegisterScreen>()));
  gh.factory<_i74.ChatPageBloc>(
      () => _i74.ChatPageBloc(get<_i62.ChatService>()));
  gh.factory<_i75.HomeModule>(() => _i75.HomeModule(get<_i64.HomeScreen>()));
  gh.factory<_i76.SettingsModule>(
      () => _i76.SettingsModule(get<_i69.SettingsScreen>()));
  gh.factory<_i77.StoreModule>(() => _i77.StoreModule(
      get<_i71.StoreListScreen>(), get<_i72.StoreProductsScreen>()));
  gh.factory<_i78.ChatPage>(() =>
      _i78.ChatPage(get<_i74.ChatPageBloc>(), get<_i49.ImageUploadService>()));
  gh.factory<_i79.ChatModule>(
      () => _i79.ChatModule(get<_i78.ChatPage>(), get<_i43.AuthService>()));
  gh.factory<_i80.MyApp>(() => _i80.MyApp(
      get<_i28.AppThemeDataService>(),
      get<_i8.LocalizationService>(),
      get<_i63.FireNotificationService>(),
      get<_i6.LocalNotificationService>(),
      get<_i70.SplashModule>(),
      get<_i73.AuthorizationModule>(),
      get<_i79.ChatModule>(),
      get<_i76.SettingsModule>(),
      get<_i75.HomeModule>(),
      get<_i31.MainModule>(),
      get<_i77.StoreModule>(),
      get<_i33.MyNotificationsModule>(),
      get<_i24.AccountModule>(),
      get<_i18.OrdersModule>()));
  return get;
}

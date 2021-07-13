// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i89;
import '../module_account/account_module.dart' as _i20;
import '../module_account/manager/account_manager.dart' as _i19;
import '../module_account/repository/account_repository.dart' as _i3;
import '../module_account/service/account_service.dart' as _i21;
import '../module_account/state_manager/account_state_manager.dart' as _i22;
import '../module_account/ui/screen/account_screen.dart' as _i4;
import '../module_account/ui/screen/presonal_data_screen.dart' as _i15;
import '../module_auth/authoriazation_module.dart' as _i78;
import '../module_auth/manager/auth_manager/auth_manager.dart' as _i37;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i5;
import '../module_auth/repository/auth/auth_repository.dart' as _i25;
import '../module_auth/service/auth_service/auth_service.dart' as _i38;
import '../module_auth/service/auth_service_without_fire_base/auth_service_api.dart'
    as _i39;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i45;
import '../module_auth/state_manager/register_state_manager/register_state_manager.dart'
    as _i49;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i65;
import '../module_auth/ui/screen/register_screen/register_screen.dart' as _i69;
import '../module_chat/bloc/chat_page/chat_page.bloc.dart' as _i79;
import '../module_chat/chat_module.dart' as _i88;
import '../module_chat/manager/chat/chat_manager.dart' as _i61;
import '../module_chat/repository/chat/chat_repository.dart' as _i40;
import '../module_chat/service/chat/char_service.dart' as _i62;
import '../module_chat/ui/screens/chat_page/chat_page.dart' as _i87;
import '../module_home/home_module.dart' as _i80;
import '../module_home/manager/home_manager.dart' as _i41;
import '../module_home/repository/home_repository.dart' as _i26;
import '../module_home/service/home_service.dart' as _i42;
import '../module_home/state_manager/home_state_manager.dart' as _i43;
import '../module_home/ui/screen/home_screen.dart' as _i64;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i8;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i9;
import '../module_main/main_module.dart' as _i27;
import '../module_main/ui/screen/main_screen.dart' as _i11;
import '../module_my_notifications/manager/my_notifications_manager.dart'
    as _i28;
import '../module_my_notifications/my_notifications_module.dart' as _i29;
import '../module_my_notifications/repository/my_notifications_repository.dart'
    as _i12;
import '../module_my_notifications/service/my_notification_service.dart'
    as _i30;
import '../module_my_notifications/state_manager/my_notifications_state_manager.dart'
    as _i31;
import '../module_my_notifications/ui/screen/my_notifications_screen.dart'
    as _i13;
import '../module_network/http_client/http_client.dart' as _i23;
import '../module_notifications/preferences/notification_preferences/notification_preferences.dart'
    as _i14;
import '../module_notifications/repository/notification_repo.dart' as _i47;
import '../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i63;
import '../module_notifications/service/local_notification_service/local_notification_service.dart'
    as _i7;
import '../module_orders/manager/my_orders_manager.dart' as _i46;
import '../module_orders/orders_module.dart' as _i84;
import '../module_orders/repository/orders_repository.dart' as _i32;
import '../module_orders/service/orders_service.dart' as _i48;
import '../module_orders/state_manager/my_orders_state_manager.dart' as _i66;
import '../module_orders/state_manager/order_details_state_manager.dart'
    as _i67;
import '../module_orders/state_manager/order_status_state_manager.dart' as _i68;
import '../module_orders/ui/screen/client_order_screen.dart' as _i6;
import '../module_orders/ui/screen/my_orders_screen.dart' as _i81;
import '../module_orders/ui/screen/order_details_screen.dart' as _i82;
import '../module_orders/ui/screen/order_status_screen.dart' as _i83;
import '../module_our_services/manager/manager.dart' as _i51;
import '../module_our_services/repository/services_repository.dart' as _i33;
import '../module_our_services/service/services_service.dart' as _i52;
import '../module_our_services/services_module.dart' as _i73;
import '../module_our_services/state_manager/services_state_manager.dart'
    as _i53;
import '../module_our_services/ui/screen/send_it_screen.dart' as _i72;
import '../module_report/manager/report_manager.dart' as _i70;
import '../module_report/presistance/report_prefs_helper.dart' as _i16;
import '../module_report/repository/report_repository.dart' as _i50;
import '../module_report/service/report_service.dart' as _i71;
import '../module_settings/settings_module.dart' as _i85;
import '../module_settings/ui/settings_page/settings_page.dart' as _i74;
import '../module_splash/splash_module.dart' as _i75;
import '../module_splash/ui/screen/splash_screen.dart' as _i54;
import '../module_stores/manager/store_list_manager.dart' as _i55;
import '../module_stores/manager/store_products.dart' as _i58;
import '../module_stores/repository/store_list_repository.dart' as _i34;
import '../module_stores/repository/store_products_repository.dart' as _i35;
import '../module_stores/service/store_list_service.dart' as _i56;
import '../module_stores/service/store_products_service.dart' as _i59;
import '../module_stores/state_manager/store_list_state_manager.dart' as _i57;
import '../module_stores/state_manager/store_products_state_manager.dart'
    as _i60;
import '../module_stores/store_module.dart' as _i86;
import '../module_stores/ui/screen/store_list_screen.dart' as _i76;
import '../module_stores/ui/screen/store_products_screen.dart' as _i77;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i17;
import '../module_theme/service/theme_service/theme_service.dart' as _i24;
import '../module_upload/manager/upload_manager/upload_manager.dart' as _i36;
import '../module_upload/repository/upload_repository/upload_repository.dart'
    as _i18;
import '../module_upload/service/image_upload/image_upload_service.dart'
    as _i44;
import '../utils/logger/logger.dart'
    as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AccountRepository>(() => _i3.AccountRepository());
  gh.factory<_i4.AccountScreen>(() => _i4.AccountScreen());
  gh.factory<_i5.AuthPrefsHelper>(() => _i5.AuthPrefsHelper());
  gh.factory<_i6.ClientOrderScreen>(() => _i6.ClientOrderScreen());
  gh.factory<_i7.LocalNotificationService>(
      () => _i7.LocalNotificationService());
  gh.factory<_i8.LocalizationPreferencesHelper>(
      () => _i8.LocalizationPreferencesHelper());
  gh.factory<_i9.LocalizationService>(
      () => _i9.LocalizationService(get<_i8.LocalizationPreferencesHelper>()));
  gh.factory<_i10.Logger>(() => _i10.Logger());
  gh.factory<_i11.MainScreen>(() => _i11.MainScreen());
  gh.factory<_i12.MyNotificationsRepository>(
      () => _i12.MyNotificationsRepository());
  gh.factory<_i13.MyNotificationsScreen>(() => _i13.MyNotificationsScreen());
  gh.factory<_i14.NotificationsPrefsHelper>(
      () => _i14.NotificationsPrefsHelper());
  gh.factory<_i15.PersonalDataScreen>(() => _i15.PersonalDataScreen());
  gh.factory<_i16.ReportPrefsHelper>(() => _i16.ReportPrefsHelper());
  gh.factory<_i17.ThemePreferencesHelper>(() => _i17.ThemePreferencesHelper());
  gh.factory<_i18.UploadRepository>(() => _i18.UploadRepository());
  gh.factory<_i19.AccountManager>(
      () => _i19.AccountManager(get<_i3.AccountRepository>()));
  gh.factory<_i20.AccountModule>(() => _i20.AccountModule(
      get<_i4.AccountScreen>(), get<_i15.PersonalDataScreen>()));
  gh.factory<_i21.AccountService>(
      () => _i21.AccountService(get<_i19.AccountManager>()));
  gh.factory<_i22.AccountStateManager>(
      () => _i22.AccountStateManager(get<_i21.AccountService>()));
  gh.factory<_i23.ApiClient>(() => _i23.ApiClient(get<_i10.Logger>()));
  gh.factory<_i24.AppThemeDataService>(
      () => _i24.AppThemeDataService(get<_i17.ThemePreferencesHelper>()));
  gh.factory<_i25.AuthRepository>(
      () => _i25.AuthRepository(get<_i23.ApiClient>()));
  gh.factory<_i26.HomeRepository>(
      () => _i26.HomeRepository(get<_i23.ApiClient>()));
  gh.factory<_i27.MainModule>(() => _i27.MainModule(get<_i11.MainScreen>()));
  gh.factory<_i28.MyNotificationsManager>(
      () => _i28.MyNotificationsManager(get<_i12.MyNotificationsRepository>()));
  gh.factory<_i29.MyNotificationsModule>(
      () => _i29.MyNotificationsModule(get<_i13.MyNotificationsScreen>()));
  gh.factory<_i30.MyNotificationsService>(
      () => _i30.MyNotificationsService(get<_i28.MyNotificationsManager>()));
  gh.factory<_i31.MyNotificationsStateManager>(() =>
      _i31.MyNotificationsStateManager(get<_i30.MyNotificationsService>()));
  gh.factory<_i32.MyOrdersRepository>(
      () => _i32.MyOrdersRepository(get<_i23.ApiClient>()));
  gh.factory<_i33.ServicesRepository>(
      () => _i33.ServicesRepository(get<_i23.ApiClient>()));
  gh.factory<_i34.StoreListRepository>(
      () => _i34.StoreListRepository(get<_i23.ApiClient>()));
  gh.factory<_i35.StoreProductsRepository>(
      () => _i35.StoreProductsRepository(get<_i23.ApiClient>()));
  gh.factory<_i36.UploadManager>(
      () => _i36.UploadManager(get<_i18.UploadRepository>()));
  gh.factory<_i37.AuthManager>(
      () => _i37.AuthManager(get<_i25.AuthRepository>()));
  gh.factory<_i38.AuthService>(() =>
      _i38.AuthService(get<_i5.AuthPrefsHelper>(), get<_i37.AuthManager>()));
  gh.factory<_i39.AuthServiceApi>(() =>
      _i39.AuthServiceApi(get<_i5.AuthPrefsHelper>(), get<_i37.AuthManager>()));
  gh.factory<_i40.ChatRepository>(() =>
      _i40.ChatRepository(get<_i23.ApiClient>(), get<_i38.AuthService>()));
  gh.factory<_i41.HomeManager>(
      () => _i41.HomeManager(get<_i26.HomeRepository>()));
  gh.factory<_i42.HomeService>(() => _i42.HomeService(get<_i41.HomeManager>()));
  gh.factory<_i43.HomeStateManager>(
      () => _i43.HomeStateManager(get<_i42.HomeService>()));
  gh.factory<_i44.ImageUploadService>(
      () => _i44.ImageUploadService(get<_i36.UploadManager>()));
  gh.factory<_i45.LoginStateManager>(
      () => _i45.LoginStateManager(get<_i38.AuthService>()));
  gh.factory<_i46.MyOrdersManager>(
      () => _i46.MyOrdersManager(get<_i32.MyOrdersRepository>()));
  gh.factory<_i47.NotificationRepo>(() =>
      _i47.NotificationRepo(get<_i23.ApiClient>(), get<_i38.AuthService>()));
  gh.factory<_i48.OrdersService>(
      () => _i48.OrdersService(get<_i46.MyOrdersManager>()));
  gh.factory<_i49.RegisterStateManager>(
      () => _i49.RegisterStateManager(get<_i38.AuthService>()));
  gh.factory<_i50.ReportRepository>(() => _i50.ReportRepository(
      get<_i23.ApiClient>(),
      get<_i38.AuthService>(),
      get<_i16.ReportPrefsHelper>()));
  gh.factory<_i51.ServicesManager>(
      () => _i51.ServicesManager(get<_i33.ServicesRepository>()));
  gh.factory<_i52.ServicesService>(
      () => _i52.ServicesService(get<_i51.ServicesManager>()));
  gh.factory<_i53.ServicesStateManager>(
      () => _i53.ServicesStateManager(get<_i52.ServicesService>()));
  gh.factory<_i54.SplashScreen>(
      () => _i54.SplashScreen(get<_i38.AuthService>()));
  gh.factory<_i55.StoreListManager>(
      () => _i55.StoreListManager(get<_i34.StoreListRepository>()));
  gh.factory<_i56.StoreListService>(
      () => _i56.StoreListService(get<_i55.StoreListManager>()));
  gh.factory<_i57.StoreListStateManager>(
      () => _i57.StoreListStateManager(get<_i56.StoreListService>()));
  gh.factory<_i58.StoreProductsManager>(
      () => _i58.StoreProductsManager(get<_i35.StoreProductsRepository>()));
  gh.factory<_i59.StoreProductsService>(
      () => _i59.StoreProductsService(get<_i58.StoreProductsManager>()));
  gh.factory<_i60.StoreProductsStateManager>(
      () => _i60.StoreProductsStateManager(get<_i59.StoreProductsService>()));
  gh.factory<_i61.ChatManager>(
      () => _i61.ChatManager(get<_i40.ChatRepository>()));
  gh.factory<_i62.ChatService>(() => _i62.ChatService(get<_i61.ChatManager>()));
  gh.factory<_i63.FireNotificationService>(() => _i63.FireNotificationService(
      get<_i14.NotificationsPrefsHelper>(), get<_i47.NotificationRepo>()));
  gh.factory<_i64.HomeScreen>(
      () => _i64.HomeScreen(get<_i43.HomeStateManager>()));
  gh.factory<_i65.LoginScreen>(
      () => _i65.LoginScreen(get<_i45.LoginStateManager>()));
  gh.factory<_i66.MyOrdersStateManager>(
      () => _i66.MyOrdersStateManager(get<_i48.OrdersService>()));
  gh.factory<_i67.OrderDetailsStateManager>(
      () => _i67.OrderDetailsStateManager(get<_i48.OrdersService>()));
  gh.factory<_i68.OrderStatusStateManager>(
      () => _i68.OrderStatusStateManager(get<_i48.OrdersService>()));
  gh.factory<_i69.RegisterScreen>(
      () => _i69.RegisterScreen(get<_i49.RegisterStateManager>()));
  gh.factory<_i70.ReportManager>(
      () => _i70.ReportManager(get<_i50.ReportRepository>()));
  gh.factory<_i71.ReportService>(
      () => _i71.ReportService(get<_i70.ReportManager>()));
  gh.factory<_i72.SendItScreen>(
      () => _i72.SendItScreen(get<_i53.ServicesStateManager>()));
  gh.factory<_i73.ServicesModule>(
      () => _i73.ServicesModule(get<_i72.SendItScreen>()));
  gh.factory<_i74.SettingsScreen>(() => _i74.SettingsScreen(
      get<_i38.AuthService>(),
      get<_i9.LocalizationService>(),
      get<_i24.AppThemeDataService>(),
      get<_i63.FireNotificationService>()));
  gh.factory<_i75.SplashModule>(
      () => _i75.SplashModule(get<_i54.SplashScreen>()));
  gh.factory<_i76.StoreListScreen>(
      () => _i76.StoreListScreen(get<_i57.StoreListStateManager>()));
  gh.factory<_i77.StoreProductsScreen>(
      () => _i77.StoreProductsScreen(get<_i60.StoreProductsStateManager>()));
  gh.factory<_i78.AuthorizationModule>(() => _i78.AuthorizationModule(
      get<_i65.LoginScreen>(), get<_i69.RegisterScreen>()));
  gh.factory<_i79.ChatPageBloc>(
      () => _i79.ChatPageBloc(get<_i62.ChatService>()));
  gh.factory<_i80.HomeModule>(() => _i80.HomeModule(get<_i64.HomeScreen>()));
  gh.factory<_i81.MyOrdersScreen>(
      () => _i81.MyOrdersScreen(get<_i66.MyOrdersStateManager>()));
  gh.factory<_i82.OrderDetailsScreen>(
      () => _i82.OrderDetailsScreen(get<_i67.OrderDetailsStateManager>()));
  gh.factory<_i83.OrderStatusScreen>(
      () => _i83.OrderStatusScreen(get<_i68.OrderStatusStateManager>()));
  gh.factory<_i84.OrdersModule>(() => _i84.OrdersModule(
      get<_i81.MyOrdersScreen>(),
      get<_i82.OrderDetailsScreen>(),
      get<_i83.OrderStatusScreen>(),
      get<_i6.ClientOrderScreen>()));
  gh.factory<_i85.SettingsModule>(
      () => _i85.SettingsModule(get<_i74.SettingsScreen>()));
  gh.factory<_i86.StoreModule>(() => _i86.StoreModule(
      get<_i76.StoreListScreen>(), get<_i77.StoreProductsScreen>()));
  gh.factory<_i87.ChatPage>(() =>
      _i87.ChatPage(get<_i79.ChatPageBloc>(), get<_i44.ImageUploadService>()));
  gh.factory<_i88.ChatModule>(
      () => _i88.ChatModule(get<_i87.ChatPage>(), get<_i38.AuthService>()));
  gh.factory<_i89.MyApp>(() => _i89.MyApp(
      get<_i24.AppThemeDataService>(),
      get<_i9.LocalizationService>(),
      get<_i63.FireNotificationService>(),
      get<_i7.LocalNotificationService>(),
      get<_i75.SplashModule>(),
      get<_i78.AuthorizationModule>(),
      get<_i88.ChatModule>(),
      get<_i85.SettingsModule>(),
      get<_i80.HomeModule>(),
      get<_i27.MainModule>(),
      get<_i86.StoreModule>(),
      get<_i29.MyNotificationsModule>(),
      get<_i20.AccountModule>(),
      get<_i84.OrdersModule>(),
      get<_i73.ServicesModule>()));
  return get;
}
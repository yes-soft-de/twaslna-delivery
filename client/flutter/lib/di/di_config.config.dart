// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i91;
import '../module_account/account_module.dart' as _i81;
import '../module_account/manager/account_manager.dart' as _i17;
import '../module_account/repository/account_repository.dart' as _i3;
import '../module_account/service/account_service.dart' as _i18;
import '../module_account/state_manager/account_state_manager.dart' as _i51;
import '../module_account/ui/screen/account_screen.dart' as _i69;
import '../module_account/ui/screen/presonal_data_screen.dart' as _i13;
import '../module_auth/authoriazation_module.dart' as _i70;
import '../module_auth/manager/auth_manager/auth_manager.dart' as _i31;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i4;
import '../module_auth/repository/auth/auth_repository.dart' as _i21;
import '../module_auth/service/auth_service/auth_service.dart' as _i32;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i38;
import '../module_auth/state_manager/register_state_manager/register_state_manager.dart'
    as _i41;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i56;
import '../module_auth/ui/screen/register_screen/register_screen.dart' as _i59;
import '../module_chat/bloc/chat_page/chat_page.bloc.dart' as _i71;
import '../module_chat/chat_module.dart' as _i90;
import '../module_chat/manager/chat/chat_manager.dart' as _i52;
import '../module_chat/repository/chat/chat_repository.dart' as _i33;
import '../module_chat/service/chat/char_service.dart' as _i53;
import '../module_chat/ui/screens/chat_page/chat_page.dart' as _i82;
import '../module_home/home_module.dart' as _i73;
import '../module_home/manager/home_manager.dart' as _i34;
import '../module_home/repository/home_repository.dart' as _i22;
import '../module_home/service/home_service.dart' as _i35;
import '../module_home/state_manager/home_state_manager.dart' as _i36;
import '../module_home/ui/screen/home_screen.dart' as _i55;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i6;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i7;
import '../module_main/main_module.dart' as _i23;
import '../module_main/ui/screen/main_screen.dart' as _i9;
import '../module_my_notifications/manager/my_notifications_manager.dart'
    as _i24;
import '../module_my_notifications/my_notifications_module.dart' as _i25;
import '../module_my_notifications/repository/my_notifications_repository.dart'
    as _i10;
import '../module_my_notifications/service/my_notification_service.dart'
    as _i26;
import '../module_my_notifications/state_manager/my_notifications_state_manager.dart'
    as _i27;
import '../module_my_notifications/ui/screen/my_notifications_screen.dart'
    as _i11;
import '../module_network/http_client/http_client.dart' as _i19;
import '../module_notifications/preferences/notification_preferences/notification_preferences.dart'
    as _i12;
import '../module_notifications/repository/notification_repo.dart' as _i40;
import '../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i54;
import '../module_notifications/service/local_notification_service/local_notification_service.dart'
    as _i5;
import '../module_orders/manager/my_orders_manager.dart' as _i57;
import '../module_orders/orders_module.dart' as _i87;
import '../module_orders/repository/orders_repository.dart' as _i39;
import '../module_orders/service/orders_service.dart' as _i58;
import '../module_orders/state_manager/client_order_state_manager.dart' as _i72;
import '../module_orders/state_manager/my_orders_state_manager.dart' as _i74;
import '../module_orders/state_manager/order_details_state_manager.dart'
    as _i75;
import '../module_orders/state_manager/order_status_state_manager.dart' as _i76;
import '../module_orders/ui/screen/client_order_screen.dart' as _i83;
import '../module_orders/ui/screen/my_orders_screen.dart' as _i84;
import '../module_orders/ui/screen/order_details_screen.dart' as _i85;
import '../module_orders/ui/screen/order_status_screen.dart' as _i86;
import '../module_our_services/manager/manager.dart' as _i62;
import '../module_our_services/repository/services_repository.dart' as _i43;
import '../module_our_services/service/services_service.dart' as _i63;
import '../module_our_services/services_module.dart' as _i89;
import '../module_our_services/state_manager/private_order_state_manager.dart'
    as _i77;
import '../module_our_services/state_manager/services_state_manager.dart'
    as _i64;
import '../module_our_services/ui/screen/private_order_screen.dart' as _i88;
import '../module_our_services/ui/screen/send_it_screen.dart' as _i78;
import '../module_report/manager/report_manager.dart' as _i60;
import '../module_report/presistance/report_prefs_helper.dart' as _i14;
import '../module_report/repository/report_repository.dart' as _i42;
import '../module_report/service/report_service.dart' as _i61;
import '../module_settings/settings_module.dart' as _i79;
import '../module_settings/ui/settings_page/settings_page.dart' as _i65;
import '../module_splash/splash_module.dart' as _i66;
import '../module_splash/ui/screen/splash_screen.dart' as _i44;
import '../module_stores/manager/store_list_manager.dart' as _i45;
import '../module_stores/manager/store_products.dart' as _i48;
import '../module_stores/repository/store_list_repository.dart' as _i28;
import '../module_stores/repository/store_products_repository.dart' as _i29;
import '../module_stores/service/store_list_service.dart' as _i46;
import '../module_stores/service/store_products_service.dart' as _i49;
import '../module_stores/state_manager/store_list_state_manager.dart' as _i47;
import '../module_stores/state_manager/store_products_state_manager.dart'
    as _i50;
import '../module_stores/store_module.dart' as _i80;
import '../module_stores/ui/screen/store_list_screen.dart' as _i67;
import '../module_stores/ui/screen/store_products_screen.dart' as _i68;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i15;
import '../module_theme/service/theme_service/theme_service.dart' as _i20;
import '../module_upload/manager/upload_manager/upload_manager.dart' as _i30;
import '../module_upload/repository/upload_repository/upload_repository.dart'
    as _i16;
import '../module_upload/service/image_upload/image_upload_service.dart'
    as _i37;
import '../utils/logger/logger.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AccountRepository>(() => _i3.AccountRepository());
  gh.factory<_i4.AuthPrefsHelper>(() => _i4.AuthPrefsHelper());
  gh.factory<_i5.LocalNotificationService>(
      () => _i5.LocalNotificationService());
  gh.factory<_i6.LocalizationPreferencesHelper>(
      () => _i6.LocalizationPreferencesHelper());
  gh.factory<_i7.LocalizationService>(
      () => _i7.LocalizationService(get<_i6.LocalizationPreferencesHelper>()));
  gh.factory<_i8.Logger>(() => _i8.Logger());
  gh.factory<_i9.MainScreen>(() => _i9.MainScreen());
  gh.factory<_i10.MyNotificationsRepository>(
      () => _i10.MyNotificationsRepository());
  gh.factory<_i11.MyNotificationsScreen>(() => _i11.MyNotificationsScreen());
  gh.factory<_i12.NotificationsPrefsHelper>(
      () => _i12.NotificationsPrefsHelper());
  gh.factory<_i13.PersonalDataScreen>(() => _i13.PersonalDataScreen());
  gh.factory<_i14.ReportPrefsHelper>(() => _i14.ReportPrefsHelper());
  gh.factory<_i15.ThemePreferencesHelper>(() => _i15.ThemePreferencesHelper());
  gh.factory<_i16.UploadRepository>(() => _i16.UploadRepository());
  gh.factory<_i17.AccountManager>(
      () => _i17.AccountManager(get<_i3.AccountRepository>()));
  gh.factory<_i18.AccountService>(
      () => _i18.AccountService(get<_i17.AccountManager>()));
  gh.factory<_i19.ApiClient>(() => _i19.ApiClient(get<_i8.Logger>()));
  gh.factory<_i20.AppThemeDataService>(
      () => _i20.AppThemeDataService(get<_i15.ThemePreferencesHelper>()));
  gh.factory<_i21.AuthRepository>(
      () => _i21.AuthRepository(get<_i19.ApiClient>()));
  gh.factory<_i22.HomeRepository>(
      () => _i22.HomeRepository(get<_i19.ApiClient>()));
  gh.factory<_i23.MainModule>(() => _i23.MainModule(get<_i9.MainScreen>()));
  gh.factory<_i24.MyNotificationsManager>(
      () => _i24.MyNotificationsManager(get<_i10.MyNotificationsRepository>()));
  gh.factory<_i25.MyNotificationsModule>(
      () => _i25.MyNotificationsModule(get<_i11.MyNotificationsScreen>()));
  gh.factory<_i26.MyNotificationsService>(
      () => _i26.MyNotificationsService(get<_i24.MyNotificationsManager>()));
  gh.factory<_i27.MyNotificationsStateManager>(() =>
      _i27.MyNotificationsStateManager(get<_i26.MyNotificationsService>()));
  gh.factory<_i28.StoreListRepository>(
      () => _i28.StoreListRepository(get<_i19.ApiClient>()));
  gh.factory<_i29.StoreProductsRepository>(
      () => _i29.StoreProductsRepository(get<_i19.ApiClient>()));
  gh.factory<_i30.UploadManager>(
      () => _i30.UploadManager(get<_i16.UploadRepository>()));
  gh.factory<_i31.AuthManager>(
      () => _i31.AuthManager(get<_i21.AuthRepository>()));
  gh.factory<_i32.AuthService>(() =>
      _i32.AuthService(get<_i4.AuthPrefsHelper>(), get<_i31.AuthManager>()));
  gh.factory<_i33.ChatRepository>(() =>
      _i33.ChatRepository(get<_i19.ApiClient>(), get<_i32.AuthService>()));
  gh.factory<_i34.HomeManager>(
      () => _i34.HomeManager(get<_i22.HomeRepository>()));
  gh.factory<_i35.HomeService>(() => _i35.HomeService(get<_i34.HomeManager>()));
  gh.factory<_i36.HomeStateManager>(
      () => _i36.HomeStateManager(get<_i35.HomeService>()));
  gh.factory<_i37.ImageUploadService>(
      () => _i37.ImageUploadService(get<_i30.UploadManager>()));
  gh.factory<_i38.LoginStateManager>(
      () => _i38.LoginStateManager(get<_i32.AuthService>()));
  gh.factory<_i39.MyOrdersRepository>(() =>
      _i39.MyOrdersRepository(get<_i19.ApiClient>(), get<_i32.AuthService>()));
  gh.factory<_i40.NotificationRepo>(() =>
      _i40.NotificationRepo(get<_i19.ApiClient>(), get<_i32.AuthService>()));
  gh.factory<_i41.RegisterStateManager>(
      () => _i41.RegisterStateManager(get<_i32.AuthService>()));
  gh.factory<_i42.ReportRepository>(() => _i42.ReportRepository(
      get<_i19.ApiClient>(),
      get<_i32.AuthService>(),
      get<_i14.ReportPrefsHelper>()));
  gh.factory<_i43.ServicesRepository>(() =>
      _i43.ServicesRepository(get<_i19.ApiClient>(), get<_i32.AuthService>()));
  gh.factory<_i44.SplashScreen>(
      () => _i44.SplashScreen(get<_i32.AuthService>()));
  gh.factory<_i45.StoreListManager>(
      () => _i45.StoreListManager(get<_i28.StoreListRepository>()));
  gh.factory<_i46.StoreListService>(
      () => _i46.StoreListService(get<_i45.StoreListManager>()));
  gh.factory<_i47.StoreListStateManager>(
      () => _i47.StoreListStateManager(get<_i46.StoreListService>()));
  gh.factory<_i48.StoreProductsManager>(
      () => _i48.StoreProductsManager(get<_i29.StoreProductsRepository>()));
  gh.factory<_i49.StoreProductsService>(
      () => _i49.StoreProductsService(get<_i48.StoreProductsManager>()));
  gh.factory<_i50.StoreProductsStateManager>(
      () => _i50.StoreProductsStateManager(get<_i49.StoreProductsService>()));
  gh.factory<_i51.AccountStateManager>(() => _i51.AccountStateManager(
      get<_i18.AccountService>(), get<_i32.AuthService>()));
  gh.factory<_i52.ChatManager>(
      () => _i52.ChatManager(get<_i33.ChatRepository>()));
  gh.factory<_i53.ChatService>(() => _i53.ChatService(get<_i52.ChatManager>()));
  gh.factory<_i54.FireNotificationService>(() => _i54.FireNotificationService(
      get<_i12.NotificationsPrefsHelper>(), get<_i40.NotificationRepo>()));
  gh.factory<_i55.HomeScreen>(
      () => _i55.HomeScreen(get<_i36.HomeStateManager>()));
  gh.factory<_i56.LoginScreen>(
      () => _i56.LoginScreen(get<_i38.LoginStateManager>()));
  gh.factory<_i57.MyOrdersManager>(
      () => _i57.MyOrdersManager(get<_i39.MyOrdersRepository>()));
  gh.factory<_i58.OrdersService>(
      () => _i58.OrdersService(get<_i57.MyOrdersManager>()));
  gh.factory<_i59.RegisterScreen>(
      () => _i59.RegisterScreen(get<_i41.RegisterStateManager>()));
  gh.factory<_i60.ReportManager>(
      () => _i60.ReportManager(get<_i42.ReportRepository>()));
  gh.factory<_i61.ReportService>(
      () => _i61.ReportService(get<_i60.ReportManager>()));
  gh.factory<_i62.ServicesManager>(
      () => _i62.ServicesManager(get<_i43.ServicesRepository>()));
  gh.factory<_i63.ServicesService>(
      () => _i63.ServicesService(get<_i62.ServicesManager>()));
  gh.factory<_i64.ServicesStateManager>(() => _i64.ServicesStateManager(
      get<_i63.ServicesService>(), get<_i32.AuthService>()));
  gh.factory<_i65.SettingsScreen>(() => _i65.SettingsScreen(
      get<_i32.AuthService>(),
      get<_i7.LocalizationService>(),
      get<_i20.AppThemeDataService>(),
      get<_i54.FireNotificationService>()));
  gh.factory<_i66.SplashModule>(
      () => _i66.SplashModule(get<_i44.SplashScreen>()));
  gh.factory<_i67.StoreListScreen>(
      () => _i67.StoreListScreen(get<_i47.StoreListStateManager>()));
  gh.factory<_i68.StoreProductsScreen>(
      () => _i68.StoreProductsScreen(get<_i50.StoreProductsStateManager>()));
  gh.factory<_i69.AccountScreen>(
      () => _i69.AccountScreen(get<_i51.AccountStateManager>()));
  gh.factory<_i70.AuthorizationModule>(() => _i70.AuthorizationModule(
      get<_i56.LoginScreen>(), get<_i59.RegisterScreen>()));
  gh.factory<_i71.ChatPageBloc>(
      () => _i71.ChatPageBloc(get<_i53.ChatService>()));
  gh.factory<_i72.ClientOrderStateManager>(
      () => _i72.ClientOrderStateManager(get<_i58.OrdersService>()));
  gh.factory<_i73.HomeModule>(() => _i73.HomeModule(get<_i55.HomeScreen>()));
  gh.factory<_i74.MyOrdersStateManager>(
      () => _i74.MyOrdersStateManager(get<_i58.OrdersService>()));
  gh.factory<_i75.OrderDetailsStateManager>(
      () => _i75.OrderDetailsStateManager(get<_i58.OrdersService>()));
  gh.factory<_i76.OrderStatusStateManager>(
      () => _i76.OrderStatusStateManager(get<_i58.OrdersService>()));
  gh.factory<_i77.PrivateOrderStateManager>(() => _i77.PrivateOrderStateManager(
      get<_i63.ServicesService>(), get<_i32.AuthService>()));
  gh.factory<_i78.SendItScreen>(
      () => _i78.SendItScreen(get<_i64.ServicesStateManager>()));
  gh.factory<_i79.SettingsModule>(
      () => _i79.SettingsModule(get<_i65.SettingsScreen>()));
  gh.factory<_i80.StoreModule>(() => _i80.StoreModule(
      get<_i67.StoreListScreen>(), get<_i68.StoreProductsScreen>()));
  gh.factory<_i81.AccountModule>(() => _i81.AccountModule(
      get<_i69.AccountScreen>(), get<_i13.PersonalDataScreen>()));
  gh.factory<_i82.ChatPage>(() =>
      _i82.ChatPage(get<_i71.ChatPageBloc>(), get<_i37.ImageUploadService>()));
  gh.factory<_i83.ClientOrderScreen>(
      () => _i83.ClientOrderScreen(get<_i72.ClientOrderStateManager>()));
  gh.factory<_i84.MyOrdersScreen>(
      () => _i84.MyOrdersScreen(get<_i74.MyOrdersStateManager>()));
  gh.factory<_i85.OrderDetailsScreen>(
      () => _i85.OrderDetailsScreen(get<_i75.OrderDetailsStateManager>()));
  gh.factory<_i86.OrderStatusScreen>(
      () => _i86.OrderStatusScreen(get<_i76.OrderStatusStateManager>()));
  gh.factory<_i87.OrdersModule>(() => _i87.OrdersModule(
      get<_i84.MyOrdersScreen>(),
      get<_i85.OrderDetailsScreen>(),
      get<_i86.OrderStatusScreen>(),
      get<_i83.ClientOrderScreen>()));
  gh.factory<_i88.PrivateOrderScreen>(
      () => _i88.PrivateOrderScreen(get<_i77.PrivateOrderStateManager>()));
  gh.factory<_i89.ServicesModule>(() => _i89.ServicesModule(
      get<_i78.SendItScreen>(), get<_i88.PrivateOrderScreen>()));
  gh.factory<_i90.ChatModule>(
      () => _i90.ChatModule(get<_i82.ChatPage>(), get<_i32.AuthService>()));
  gh.factory<_i91.MyApp>(() => _i91.MyApp(
      get<_i20.AppThemeDataService>(),
      get<_i7.LocalizationService>(),
      get<_i54.FireNotificationService>(),
      get<_i5.LocalNotificationService>(),
      get<_i66.SplashModule>(),
      get<_i70.AuthorizationModule>(),
      get<_i90.ChatModule>(),
      get<_i79.SettingsModule>(),
      get<_i73.HomeModule>(),
      get<_i23.MainModule>(),
      get<_i80.StoreModule>(),
      get<_i25.MyNotificationsModule>(),
      get<_i81.AccountModule>(),
      get<_i87.OrdersModule>(),
      get<_i89.ServicesModule>()));
  return get;
}

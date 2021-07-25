// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i92;
import '../module_account/account_module.dart' as _i19;
import '../module_account/manager/account_manager.dart' as _i18;
import '../module_account/repository/account_repository.dart' as _i3;
import '../module_account/service/account_service.dart' as _i20;
import '../module_account/state_manager/account_state_manager.dart' as _i21;
import '../module_account/ui/screen/account_screen.dart' as _i4;
import '../module_account/ui/screen/presonal_data_screen.dart' as _i14;
import '../module_auth/authoriazation_module.dart' as _i78;
import '../module_auth/manager/auth_manager/auth_manager.dart' as _i36;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i5;
import '../module_auth/repository/auth/auth_repository.dart' as _i24;
import '../module_auth/service/auth_service/auth_service.dart' as _i37;
import '../module_auth/service/auth_service_without_fire_base/auth_service_api.dart'
    as _i38;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i44;
import '../module_auth/state_manager/register_state_manager/register_state_manager.dart'
    as _i48;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i65;
import '../module_auth/ui/screen/register_screen/register_screen.dart' as _i70;
import '../module_chat/bloc/chat_page/chat_page.bloc.dart' as _i79;
import '../module_chat/chat_module.dart' as _i91;
import '../module_chat/manager/chat/chat_manager.dart' as _i60;
import '../module_chat/repository/chat/chat_repository.dart' as _i39;
import '../module_chat/service/chat/char_service.dart' as _i61;
import '../module_chat/ui/screens/chat_page/chat_page.dart' as _i90;
import '../module_home/home_module.dart' as _i81;
import '../module_home/manager/home_manager.dart' as _i40;
import '../module_home/repository/home_repository.dart' as _i25;
import '../module_home/service/home_service.dart' as _i41;
import '../module_home/state_manager/home_state_manager.dart' as _i42;
import '../module_home/ui/screen/home_screen.dart' as _i64;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i7;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i8;
import '../module_main/main_module.dart' as _i26;
import '../module_main/ui/screen/main_screen.dart' as _i10;
import '../module_my_notifications/manager/my_notifications_manager.dart'
    as _i27;
import '../module_my_notifications/my_notifications_module.dart' as _i28;
import '../module_my_notifications/repository/my_notifications_repository.dart'
    as _i11;
import '../module_my_notifications/service/my_notification_service.dart'
    as _i29;
import '../module_my_notifications/state_manager/my_notifications_state_manager.dart'
    as _i30;
import '../module_my_notifications/ui/screen/my_notifications_screen.dart'
    as _i12;
import '../module_network/http_client/http_client.dart' as _i22;
import '../module_notifications/preferences/notification_preferences/notification_preferences.dart'
    as _i13;
import '../module_notifications/repository/notification_repo.dart' as _i46;
import '../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i63;
import '../module_notifications/service/local_notification_service/local_notification_service.dart'
    as _i6;
import '../module_orders/manager/my_orders_manager.dart' as _i45;
import '../module_orders/orders_module.dart' as _i85;
import '../module_orders/repository/orders_repository.dart' as _i31;
import '../module_orders/service/orders_service.dart' as _i47;
import '../module_orders/state_manager/client_order_state_manager.dart' as _i62;
import '../module_orders/state_manager/my_orders_state_manager.dart' as _i66;
import '../module_orders/state_manager/order_details_state_manager.dart'
    as _i67;
import '../module_orders/state_manager/order_status_state_manager.dart' as _i68;
import '../module_orders/ui/screen/client_order_screen.dart' as _i80;
import '../module_orders/ui/screen/my_orders_screen.dart' as _i82;
import '../module_orders/ui/screen/order_details_screen.dart' as _i83;
import '../module_orders/ui/screen/order_status_screen.dart' as _i84;
import '../module_our_services/manager/manager.dart' as _i50;
import '../module_our_services/repository/services_repository.dart' as _i32;
import '../module_our_services/service/services_service.dart' as _i51;
import '../module_our_services/services_module.dart' as _i87;
import '../module_our_services/state_manager/private_order_state_manager.dart'
    as _i69;
import '../module_our_services/state_manager/services_state_manager.dart'
    as _i52;
import '../module_our_services/ui/screen/private_order_screen.dart' as _i86;
import '../module_our_services/ui/screen/send_it_screen.dart' as _i73;
import '../module_report/manager/report_manager.dart' as _i71;
import '../module_report/presistance/report_prefs_helper.dart' as _i15;
import '../module_report/repository/report_repository.dart' as _i49;
import '../module_report/service/report_service.dart' as _i72;
import '../module_settings/settings_module.dart' as _i88;
import '../module_settings/ui/settings_page/settings_page.dart' as _i74;
import '../module_splash/splash_module.dart' as _i75;
import '../module_splash/ui/screen/splash_screen.dart' as _i53;
import '../module_stores/manager/store_list_manager.dart' as _i54;
import '../module_stores/manager/store_products.dart' as _i57;
import '../module_stores/repository/store_list_repository.dart' as _i33;
import '../module_stores/repository/store_products_repository.dart' as _i34;
import '../module_stores/service/store_list_service.dart' as _i55;
import '../module_stores/service/store_products_service.dart' as _i58;
import '../module_stores/state_manager/store_list_state_manager.dart' as _i56;
import '../module_stores/state_manager/store_products_state_manager.dart'
    as _i59;
import '../module_stores/store_module.dart' as _i89;
import '../module_stores/ui/screen/store_list_screen.dart' as _i76;
import '../module_stores/ui/screen/store_products_screen.dart' as _i77;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i16;
import '../module_theme/service/theme_service/theme_service.dart' as _i23;
import '../module_upload/manager/upload_manager/upload_manager.dart' as _i35;
import '../module_upload/repository/upload_repository/upload_repository.dart'
    as _i17;
import '../module_upload/service/image_upload/image_upload_service.dart'
    as _i43;
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
  gh.factory<_i13.NotificationsPrefsHelper>(
      () => _i13.NotificationsPrefsHelper());
  gh.factory<_i14.PersonalDataScreen>(() => _i14.PersonalDataScreen());
  gh.factory<_i15.ReportPrefsHelper>(() => _i15.ReportPrefsHelper());
  gh.factory<_i16.ThemePreferencesHelper>(() => _i16.ThemePreferencesHelper());
  gh.factory<_i17.UploadRepository>(() => _i17.UploadRepository());
  gh.factory<_i18.AccountManager>(
      () => _i18.AccountManager(get<_i3.AccountRepository>()));
  gh.factory<_i19.AccountModule>(() => _i19.AccountModule(
      get<_i4.AccountScreen>(), get<_i14.PersonalDataScreen>()));
  gh.factory<_i20.AccountService>(
      () => _i20.AccountService(get<_i18.AccountManager>()));
  gh.factory<_i21.AccountStateManager>(
      () => _i21.AccountStateManager(get<_i20.AccountService>()));
  gh.factory<_i22.ApiClient>(() => _i22.ApiClient(get<_i9.Logger>()));
  gh.factory<_i23.AppThemeDataService>(
      () => _i23.AppThemeDataService(get<_i16.ThemePreferencesHelper>()));
  gh.factory<_i24.AuthRepository>(
      () => _i24.AuthRepository(get<_i22.ApiClient>()));
  gh.factory<_i25.HomeRepository>(
      () => _i25.HomeRepository(get<_i22.ApiClient>()));
  gh.factory<_i26.MainModule>(() => _i26.MainModule(get<_i10.MainScreen>()));
  gh.factory<_i27.MyNotificationsManager>(
      () => _i27.MyNotificationsManager(get<_i11.MyNotificationsRepository>()));
  gh.factory<_i28.MyNotificationsModule>(
      () => _i28.MyNotificationsModule(get<_i12.MyNotificationsScreen>()));
  gh.factory<_i29.MyNotificationsService>(
      () => _i29.MyNotificationsService(get<_i27.MyNotificationsManager>()));
  gh.factory<_i30.MyNotificationsStateManager>(() =>
      _i30.MyNotificationsStateManager(get<_i29.MyNotificationsService>()));
  gh.factory<_i31.MyOrdersRepository>(
      () => _i31.MyOrdersRepository(get<_i22.ApiClient>()));
  gh.factory<_i32.ServicesRepository>(
      () => _i32.ServicesRepository(get<_i22.ApiClient>()));
  gh.factory<_i33.StoreListRepository>(
      () => _i33.StoreListRepository(get<_i22.ApiClient>()));
  gh.factory<_i34.StoreProductsRepository>(
      () => _i34.StoreProductsRepository(get<_i22.ApiClient>()));
  gh.factory<_i35.UploadManager>(
      () => _i35.UploadManager(get<_i17.UploadRepository>()));
  gh.factory<_i36.AuthManager>(
      () => _i36.AuthManager(get<_i24.AuthRepository>()));
  gh.factory<_i37.AuthService>(() =>
      _i37.AuthService(get<_i5.AuthPrefsHelper>(), get<_i36.AuthManager>()));
  gh.factory<_i38.AuthServiceApi>(() =>
      _i38.AuthServiceApi(get<_i5.AuthPrefsHelper>(), get<_i36.AuthManager>()));
  gh.factory<_i39.ChatRepository>(() =>
      _i39.ChatRepository(get<_i22.ApiClient>(), get<_i37.AuthService>()));
  gh.factory<_i40.HomeManager>(
      () => _i40.HomeManager(get<_i25.HomeRepository>()));
  gh.factory<_i41.HomeService>(() => _i41.HomeService(get<_i40.HomeManager>()));
  gh.factory<_i42.HomeStateManager>(
      () => _i42.HomeStateManager(get<_i41.HomeService>()));
  gh.factory<_i43.ImageUploadService>(
      () => _i43.ImageUploadService(get<_i35.UploadManager>()));
  gh.factory<_i44.LoginStateManager>(
      () => _i44.LoginStateManager(get<_i37.AuthService>()));
  gh.factory<_i45.MyOrdersManager>(
      () => _i45.MyOrdersManager(get<_i31.MyOrdersRepository>()));
  gh.factory<_i46.NotificationRepo>(() =>
      _i46.NotificationRepo(get<_i22.ApiClient>(), get<_i37.AuthService>()));
  gh.factory<_i47.OrdersService>(
      () => _i47.OrdersService(get<_i45.MyOrdersManager>()));
  gh.factory<_i48.RegisterStateManager>(
      () => _i48.RegisterStateManager(get<_i37.AuthService>()));
  gh.factory<_i49.ReportRepository>(() => _i49.ReportRepository(
      get<_i22.ApiClient>(),
      get<_i37.AuthService>(),
      get<_i15.ReportPrefsHelper>()));
  gh.factory<_i50.ServicesManager>(
      () => _i50.ServicesManager(get<_i32.ServicesRepository>()));
  gh.factory<_i51.ServicesService>(
      () => _i51.ServicesService(get<_i50.ServicesManager>()));
  gh.factory<_i52.ServicesStateManager>(
      () => _i52.ServicesStateManager(get<_i51.ServicesService>()));
  gh.factory<_i53.SplashScreen>(
      () => _i53.SplashScreen(get<_i37.AuthService>()));
  gh.factory<_i54.StoreListManager>(
      () => _i54.StoreListManager(get<_i33.StoreListRepository>()));
  gh.factory<_i55.StoreListService>(
      () => _i55.StoreListService(get<_i54.StoreListManager>()));
  gh.factory<_i56.StoreListStateManager>(
      () => _i56.StoreListStateManager(get<_i55.StoreListService>()));
  gh.factory<_i57.StoreProductsManager>(
      () => _i57.StoreProductsManager(get<_i34.StoreProductsRepository>()));
  gh.factory<_i58.StoreProductsService>(
      () => _i58.StoreProductsService(get<_i57.StoreProductsManager>()));
  gh.factory<_i59.StoreProductsStateManager>(
      () => _i59.StoreProductsStateManager(get<_i58.StoreProductsService>()));
  gh.factory<_i60.ChatManager>(
      () => _i60.ChatManager(get<_i39.ChatRepository>()));
  gh.factory<_i61.ChatService>(() => _i61.ChatService(get<_i60.ChatManager>()));
  gh.factory<_i62.ClientOrderStateManager>(
      () => _i62.ClientOrderStateManager(get<_i47.OrdersService>()));
  gh.factory<_i63.FireNotificationService>(() => _i63.FireNotificationService(
      get<_i13.NotificationsPrefsHelper>(), get<_i46.NotificationRepo>()));
  gh.factory<_i64.HomeScreen>(
      () => _i64.HomeScreen(get<_i42.HomeStateManager>()));
  gh.factory<_i65.LoginScreen>(
      () => _i65.LoginScreen(get<_i44.LoginStateManager>()));
  gh.factory<_i66.MyOrdersStateManager>(
      () => _i66.MyOrdersStateManager(get<_i47.OrdersService>()));
  gh.factory<_i67.OrderDetailsStateManager>(
      () => _i67.OrderDetailsStateManager(get<_i47.OrdersService>()));
  gh.factory<_i68.OrderStatusStateManager>(
      () => _i68.OrderStatusStateManager(get<_i47.OrdersService>()));
  gh.factory<_i69.PrivateOrderStateManager>(
      () => _i69.PrivateOrderStateManager(get<_i51.ServicesService>()));
  gh.factory<_i70.RegisterScreen>(
      () => _i70.RegisterScreen(get<_i48.RegisterStateManager>()));
  gh.factory<_i71.ReportManager>(
      () => _i71.ReportManager(get<_i49.ReportRepository>()));
  gh.factory<_i72.ReportService>(
      () => _i72.ReportService(get<_i71.ReportManager>()));
  gh.factory<_i73.SendItScreen>(
      () => _i73.SendItScreen(get<_i52.ServicesStateManager>()));
  gh.factory<_i74.SettingsScreen>(() => _i74.SettingsScreen(
      get<_i37.AuthService>(),
      get<_i8.LocalizationService>(),
      get<_i23.AppThemeDataService>(),
      get<_i63.FireNotificationService>()));
  gh.factory<_i75.SplashModule>(
      () => _i75.SplashModule(get<_i53.SplashScreen>()));
  gh.factory<_i76.StoreListScreen>(
      () => _i76.StoreListScreen(get<_i56.StoreListStateManager>()));
  gh.factory<_i77.StoreProductsScreen>(
      () => _i77.StoreProductsScreen(get<_i59.StoreProductsStateManager>()));
  gh.factory<_i78.AuthorizationModule>(() => _i78.AuthorizationModule(
      get<_i65.LoginScreen>(), get<_i70.RegisterScreen>()));
  gh.factory<_i79.ChatPageBloc>(
      () => _i79.ChatPageBloc(get<_i61.ChatService>()));
  gh.factory<_i80.ClientOrderScreen>(
      () => _i80.ClientOrderScreen(get<_i62.ClientOrderStateManager>()));
  gh.factory<_i81.HomeModule>(() => _i81.HomeModule(get<_i64.HomeScreen>()));
  gh.factory<_i82.MyOrdersScreen>(
      () => _i82.MyOrdersScreen(get<_i66.MyOrdersStateManager>()));
  gh.factory<_i83.OrderDetailsScreen>(
      () => _i83.OrderDetailsScreen(get<_i67.OrderDetailsStateManager>()));
  gh.factory<_i84.OrderStatusScreen>(
      () => _i84.OrderStatusScreen(get<_i68.OrderStatusStateManager>()));
  gh.factory<_i85.OrdersModule>(() => _i85.OrdersModule(
      get<_i82.MyOrdersScreen>(),
      get<_i83.OrderDetailsScreen>(),
      get<_i84.OrderStatusScreen>(),
      get<_i80.ClientOrderScreen>()));
  gh.factory<_i86.PrivateOrderScreen>(
      () => _i86.PrivateOrderScreen(get<_i69.PrivateOrderStateManager>()));
  gh.factory<_i87.ServicesModule>(() => _i87.ServicesModule(
      get<_i73.SendItScreen>(), get<_i86.PrivateOrderScreen>()));
  gh.factory<_i88.SettingsModule>(
      () => _i88.SettingsModule(get<_i74.SettingsScreen>()));
  gh.factory<_i89.StoreModule>(() => _i89.StoreModule(
      get<_i76.StoreListScreen>(), get<_i77.StoreProductsScreen>()));
  gh.factory<_i90.ChatPage>(() =>
      _i90.ChatPage(get<_i79.ChatPageBloc>(), get<_i43.ImageUploadService>()));
  gh.factory<_i91.ChatModule>(
      () => _i91.ChatModule(get<_i90.ChatPage>(), get<_i37.AuthService>()));
  gh.factory<_i92.MyApp>(() => _i92.MyApp(
      get<_i23.AppThemeDataService>(),
      get<_i8.LocalizationService>(),
      get<_i63.FireNotificationService>(),
      get<_i6.LocalNotificationService>(),
      get<_i75.SplashModule>(),
      get<_i78.AuthorizationModule>(),
      get<_i91.ChatModule>(),
      get<_i88.SettingsModule>(),
      get<_i81.HomeModule>(),
      get<_i26.MainModule>(),
      get<_i89.StoreModule>(),
      get<_i28.MyNotificationsModule>(),
      get<_i19.AccountModule>(),
      get<_i85.OrdersModule>(),
      get<_i87.ServicesModule>()));
  return get;
}

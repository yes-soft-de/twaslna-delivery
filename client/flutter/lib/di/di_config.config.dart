// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i92;
import '../module_account/account_module.dart' as _i90;
import '../module_account/manager/account_manager.dart' as _i65;
import '../module_account/repository/account_repository.dart' as _i47;
import '../module_account/service/account_service.dart' as _i66;
import '../module_account/state_manager/account_state_manager.dart' as _i67;
import '../module_account/state_manager/presonal_data_state_manager.dart'
    as _i75;
import '../module_account/ui/screen/account_screen.dart' as _i80;
import '../module_account/ui/screen/presonal_data_screen.dart' as _i87;
import '../module_auth/authoriazation_module.dart' as _i68;
import '../module_auth/manager/auth_manager/auth_manager.dart' as _i27;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i3;
import '../module_auth/repository/auth/auth_repository.dart' as _i17;
import '../module_auth/service/auth_service/auth_service.dart' as _i28;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i34;
import '../module_auth/state_manager/register_state_manager/register_state_manager.dart'
    as _i37;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i52;
import '../module_auth/ui/screen/register_screen/register_screen.dart' as _i55;
import '../module_chat/bloc/chat_page/chat_page.bloc.dart' as _i69;
import '../module_chat/chat_module.dart' as _i91;
import '../module_chat/manager/chat/chat_manager.dart' as _i48;
import '../module_chat/repository/chat/chat_repository.dart' as _i29;
import '../module_chat/service/chat/char_service.dart' as _i49;
import '../module_chat/ui/screens/chat_page/chat_page.dart' as _i81;
import '../module_home/home_module.dart' as _i71;
import '../module_home/manager/home_manager.dart' as _i30;
import '../module_home/repository/home_repository.dart' as _i18;
import '../module_home/service/home_service.dart' as _i31;
import '../module_home/state_manager/home_state_manager.dart' as _i32;
import '../module_home/ui/screen/home_screen.dart' as _i51;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i5;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i6;
import '../module_main/main_module.dart' as _i19;
import '../module_main/ui/screen/main_screen.dart' as _i8;
import '../module_my_notifications/manager/my_notifications_manager.dart'
    as _i20;
import '../module_my_notifications/my_notifications_module.dart' as _i21;
import '../module_my_notifications/repository/my_notifications_repository.dart'
    as _i9;
import '../module_my_notifications/service/my_notification_service.dart'
    as _i22;
import '../module_my_notifications/state_manager/my_notifications_state_manager.dart'
    as _i23;
import '../module_my_notifications/ui/screen/my_notifications_screen.dart'
    as _i10;
import '../module_network/http_client/http_client.dart' as _i15;
import '../module_notifications/preferences/notification_preferences/notification_preferences.dart'
    as _i11;
import '../module_notifications/repository/notification_repo.dart' as _i36;
import '../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i50;
import '../module_notifications/service/local_notification_service/local_notification_service.dart'
    as _i4;
import '../module_orders/manager/my_orders_manager.dart' as _i53;
import '../module_orders/orders_module.dart' as _i86;
import '../module_orders/repository/orders_repository.dart' as _i35;
import '../module_orders/service/orders_service.dart' as _i54;
import '../module_orders/state_manager/client_order_state_manager.dart' as _i70;
import '../module_orders/state_manager/my_orders_state_manager.dart' as _i72;
import '../module_orders/state_manager/order_details_state_manager.dart'
    as _i73;
import '../module_orders/state_manager/order_status_state_manager.dart' as _i74;
import '../module_orders/ui/screen/client_order_screen.dart' as _i82;
import '../module_orders/ui/screen/my_orders_screen.dart' as _i83;
import '../module_orders/ui/screen/order_details_screen.dart' as _i84;
import '../module_orders/ui/screen/order_status_screen.dart' as _i85;
import '../module_our_services/manager/manager.dart' as _i58;
import '../module_our_services/repository/services_repository.dart' as _i39;
import '../module_our_services/service/services_service.dart' as _i59;
import '../module_our_services/services_module.dart' as _i89;
import '../module_our_services/state_manager/private_order_state_manager.dart'
    as _i76;
import '../module_our_services/state_manager/services_state_manager.dart'
    as _i60;
import '../module_our_services/ui/screen/private_order_screen.dart' as _i88;
import '../module_our_services/ui/screen/send_it_screen.dart' as _i77;
import '../module_report/manager/report_manager.dart' as _i56;
import '../module_report/presistance/report_prefs_helper.dart' as _i12;
import '../module_report/repository/report_repository.dart' as _i38;
import '../module_report/service/report_service.dart' as _i57;
import '../module_settings/settings_module.dart' as _i78;
import '../module_settings/ui/settings_page/settings_page.dart' as _i61;
import '../module_splash/splash_module.dart' as _i62;
import '../module_splash/ui/screen/splash_screen.dart' as _i40;
import '../module_stores/manager/store_list_manager.dart' as _i41;
import '../module_stores/manager/store_products.dart' as _i44;
import '../module_stores/repository/store_list_repository.dart' as _i24;
import '../module_stores/repository/store_products_repository.dart' as _i25;
import '../module_stores/service/store_list_service.dart' as _i42;
import '../module_stores/service/store_products_service.dart' as _i45;
import '../module_stores/state_manager/store_list_state_manager.dart' as _i43;
import '../module_stores/state_manager/store_products_state_manager.dart'
    as _i46;
import '../module_stores/store_module.dart' as _i79;
import '../module_stores/ui/screen/store_list_screen.dart' as _i63;
import '../module_stores/ui/screen/store_products_screen.dart' as _i64;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i13;
import '../module_theme/service/theme_service/theme_service.dart' as _i16;
import '../module_upload/manager/upload_manager/upload_manager.dart' as _i26;
import '../module_upload/repository/upload_repository/upload_repository.dart'
    as _i14;
import '../module_upload/service/image_upload/image_upload_service.dart'
    as _i33;
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
  gh.factory<_i8.MainScreen>(() => _i8.MainScreen());
  gh.factory<_i9.MyNotificationsRepository>(
      () => _i9.MyNotificationsRepository());
  gh.factory<_i10.MyNotificationsScreen>(() => _i10.MyNotificationsScreen());
  gh.factory<_i11.NotificationsPrefsHelper>(
      () => _i11.NotificationsPrefsHelper());
  gh.factory<_i12.ReportPrefsHelper>(() => _i12.ReportPrefsHelper());
  gh.factory<_i13.ThemePreferencesHelper>(() => _i13.ThemePreferencesHelper());
  gh.factory<_i14.UploadRepository>(() => _i14.UploadRepository());
  gh.factory<_i15.ApiClient>(() => _i15.ApiClient(get<_i7.Logger>()));
  gh.factory<_i16.AppThemeDataService>(
      () => _i16.AppThemeDataService(get<_i13.ThemePreferencesHelper>()));
  gh.factory<_i17.AuthRepository>(
      () => _i17.AuthRepository(get<_i15.ApiClient>(), get<_i7.Logger>()));
  gh.factory<_i18.HomeRepository>(
      () => _i18.HomeRepository(get<_i15.ApiClient>()));
  gh.factory<_i19.MainModule>(() => _i19.MainModule(get<_i8.MainScreen>()));
  gh.factory<_i20.MyNotificationsManager>(
      () => _i20.MyNotificationsManager(get<_i9.MyNotificationsRepository>()));
  gh.factory<_i21.MyNotificationsModule>(
      () => _i21.MyNotificationsModule(get<_i10.MyNotificationsScreen>()));
  gh.factory<_i22.MyNotificationsService>(
      () => _i22.MyNotificationsService(get<_i20.MyNotificationsManager>()));
  gh.factory<_i23.MyNotificationsStateManager>(() =>
      _i23.MyNotificationsStateManager(get<_i22.MyNotificationsService>()));
  gh.factory<_i24.StoreListRepository>(
      () => _i24.StoreListRepository(get<_i15.ApiClient>()));
  gh.factory<_i25.StoreProductsRepository>(
      () => _i25.StoreProductsRepository(get<_i15.ApiClient>()));
  gh.factory<_i26.UploadManager>(
      () => _i26.UploadManager(get<_i14.UploadRepository>()));
  gh.factory<_i27.AuthManager>(
      () => _i27.AuthManager(get<_i17.AuthRepository>()));
  gh.factory<_i28.AuthService>(() =>
      _i28.AuthService(get<_i3.AuthPrefsHelper>(), get<_i27.AuthManager>()));
  gh.factory<_i29.ChatRepository>(() =>
      _i29.ChatRepository(get<_i15.ApiClient>(), get<_i28.AuthService>()));
  gh.factory<_i30.HomeManager>(
      () => _i30.HomeManager(get<_i18.HomeRepository>()));
  gh.factory<_i31.HomeService>(() => _i31.HomeService(get<_i30.HomeManager>()));
  gh.factory<_i32.HomeStateManager>(
      () => _i32.HomeStateManager(get<_i31.HomeService>()));
  gh.factory<_i33.ImageUploadService>(
      () => _i33.ImageUploadService(get<_i26.UploadManager>()));
  gh.factory<_i34.LoginStateManager>(
      () => _i34.LoginStateManager(get<_i28.AuthService>()));
  gh.factory<_i35.MyOrdersRepository>(() =>
      _i35.MyOrdersRepository(get<_i15.ApiClient>(), get<_i28.AuthService>()));
  gh.factory<_i36.NotificationRepo>(() =>
      _i36.NotificationRepo(get<_i15.ApiClient>(), get<_i28.AuthService>()));
  gh.factory<_i37.RegisterStateManager>(
      () => _i37.RegisterStateManager(get<_i28.AuthService>()));
  gh.factory<_i38.ReportRepository>(() => _i38.ReportRepository(
      get<_i15.ApiClient>(),
      get<_i28.AuthService>(),
      get<_i12.ReportPrefsHelper>()));
  gh.factory<_i39.ServicesRepository>(() =>
      _i39.ServicesRepository(get<_i15.ApiClient>(), get<_i28.AuthService>()));
  gh.factory<_i40.SplashScreen>(
      () => _i40.SplashScreen(get<_i28.AuthService>()));
  gh.factory<_i41.StoreListManager>(
      () => _i41.StoreListManager(get<_i24.StoreListRepository>()));
  gh.factory<_i42.StoreListService>(
      () => _i42.StoreListService(get<_i41.StoreListManager>()));
  gh.factory<_i43.StoreListStateManager>(
      () => _i43.StoreListStateManager(get<_i42.StoreListService>()));
  gh.factory<_i44.StoreProductsManager>(
      () => _i44.StoreProductsManager(get<_i25.StoreProductsRepository>()));
  gh.factory<_i45.StoreProductsService>(
      () => _i45.StoreProductsService(get<_i44.StoreProductsManager>()));
  gh.factory<_i46.StoreProductsStateManager>(
      () => _i46.StoreProductsStateManager(get<_i45.StoreProductsService>()));
  gh.factory<_i47.AccountRepository>(() =>
      _i47.AccountRepository(get<_i28.AuthService>(), get<_i15.ApiClient>()));
  gh.factory<_i48.ChatManager>(
      () => _i48.ChatManager(get<_i29.ChatRepository>()));
  gh.factory<_i49.ChatService>(() => _i49.ChatService(get<_i48.ChatManager>()));
  gh.factory<_i50.FireNotificationService>(() => _i50.FireNotificationService(
      get<_i11.NotificationsPrefsHelper>(), get<_i36.NotificationRepo>()));
  gh.factory<_i51.HomeScreen>(
      () => _i51.HomeScreen(get<_i32.HomeStateManager>()));
  gh.factory<_i52.LoginScreen>(
      () => _i52.LoginScreen(get<_i34.LoginStateManager>()));
  gh.factory<_i53.MyOrdersManager>(
      () => _i53.MyOrdersManager(get<_i35.MyOrdersRepository>()));
  gh.factory<_i54.OrdersService>(
      () => _i54.OrdersService(get<_i53.MyOrdersManager>()));
  gh.factory<_i55.RegisterScreen>(
      () => _i55.RegisterScreen(get<_i37.RegisterStateManager>()));
  gh.factory<_i56.ReportManager>(
      () => _i56.ReportManager(get<_i38.ReportRepository>()));
  gh.factory<_i57.ReportService>(
      () => _i57.ReportService(get<_i56.ReportManager>()));
  gh.factory<_i58.ServicesManager>(
      () => _i58.ServicesManager(get<_i39.ServicesRepository>()));
  gh.factory<_i59.ServicesService>(
      () => _i59.ServicesService(get<_i58.ServicesManager>()));
  gh.factory<_i60.ServicesStateManager>(() => _i60.ServicesStateManager(
      get<_i59.ServicesService>(), get<_i28.AuthService>()));
  gh.factory<_i61.SettingsScreen>(() => _i61.SettingsScreen(
      get<_i28.AuthService>(),
      get<_i6.LocalizationService>(),
      get<_i16.AppThemeDataService>(),
      get<_i50.FireNotificationService>()));
  gh.factory<_i62.SplashModule>(
      () => _i62.SplashModule(get<_i40.SplashScreen>()));
  gh.factory<_i63.StoreListScreen>(
      () => _i63.StoreListScreen(get<_i43.StoreListStateManager>()));
  gh.factory<_i64.StoreProductsScreen>(
      () => _i64.StoreProductsScreen(get<_i46.StoreProductsStateManager>()));
  gh.factory<_i65.AccountManager>(
      () => _i65.AccountManager(get<_i47.AccountRepository>()));
  gh.factory<_i66.AccountService>(
      () => _i66.AccountService(get<_i65.AccountManager>()));
  gh.factory<_i67.AccountStateManager>(() => _i67.AccountStateManager(
      get<_i66.AccountService>(), get<_i28.AuthService>()));
  gh.factory<_i68.AuthorizationModule>(() => _i68.AuthorizationModule(
      get<_i52.LoginScreen>(), get<_i55.RegisterScreen>()));
  gh.factory<_i69.ChatPageBloc>(
      () => _i69.ChatPageBloc(get<_i49.ChatService>()));
  gh.factory<_i70.ClientOrderStateManager>(() => _i70.ClientOrderStateManager(
      get<_i54.OrdersService>(), get<_i28.AuthService>()));
  gh.factory<_i71.HomeModule>(() => _i71.HomeModule(get<_i51.HomeScreen>()));
  gh.factory<_i72.MyOrdersStateManager>(() => _i72.MyOrdersStateManager(
      get<_i54.OrdersService>(), get<_i28.AuthService>()));
  gh.factory<_i73.OrderDetailsStateManager>(
      () => _i73.OrderDetailsStateManager(get<_i54.OrdersService>()));
  gh.factory<_i74.OrderStatusStateManager>(
      () => _i74.OrderStatusStateManager(get<_i54.OrdersService>()));
  gh.factory<_i75.PersonalDataStateManager>(() => _i75.PersonalDataStateManager(
      get<_i66.AccountService>(), get<_i33.ImageUploadService>()));
  gh.factory<_i76.PrivateOrderStateManager>(() => _i76.PrivateOrderStateManager(
      get<_i59.ServicesService>(), get<_i28.AuthService>()));
  gh.factory<_i77.SendItScreen>(
      () => _i77.SendItScreen(get<_i60.ServicesStateManager>()));
  gh.factory<_i78.SettingsModule>(
      () => _i78.SettingsModule(get<_i61.SettingsScreen>()));
  gh.factory<_i79.StoreModule>(() => _i79.StoreModule(
      get<_i63.StoreListScreen>(), get<_i64.StoreProductsScreen>()));
  gh.factory<_i80.AccountScreen>(
      () => _i80.AccountScreen(get<_i67.AccountStateManager>()));
  gh.factory<_i81.ChatPage>(() =>
      _i81.ChatPage(get<_i69.ChatPageBloc>(), get<_i33.ImageUploadService>()));
  gh.factory<_i82.ClientOrderScreen>(
      () => _i82.ClientOrderScreen(get<_i70.ClientOrderStateManager>()));
  gh.factory<_i83.MyOrdersScreen>(
      () => _i83.MyOrdersScreen(get<_i72.MyOrdersStateManager>()));
  gh.factory<_i84.OrderDetailsScreen>(
      () => _i84.OrderDetailsScreen(get<_i73.OrderDetailsStateManager>()));
  gh.factory<_i85.OrderStatusScreen>(
      () => _i85.OrderStatusScreen(get<_i74.OrderStatusStateManager>()));
  gh.factory<_i86.OrdersModule>(() => _i86.OrdersModule(
      get<_i83.MyOrdersScreen>(),
      get<_i84.OrderDetailsScreen>(),
      get<_i85.OrderStatusScreen>(),
      get<_i82.ClientOrderScreen>()));
  gh.factory<_i87.PersonalDataScreen>(
      () => _i87.PersonalDataScreen(get<_i75.PersonalDataStateManager>()));
  gh.factory<_i88.PrivateOrderScreen>(
      () => _i88.PrivateOrderScreen(get<_i76.PrivateOrderStateManager>()));
  gh.factory<_i89.ServicesModule>(() => _i89.ServicesModule(
      get<_i77.SendItScreen>(), get<_i88.PrivateOrderScreen>()));
  gh.factory<_i90.AccountModule>(() => _i90.AccountModule(
      get<_i80.AccountScreen>(), get<_i87.PersonalDataScreen>()));
  gh.factory<_i91.ChatModule>(
      () => _i91.ChatModule(get<_i81.ChatPage>(), get<_i28.AuthService>()));
  gh.factory<_i92.MyApp>(() => _i92.MyApp(
      get<_i16.AppThemeDataService>(),
      get<_i6.LocalizationService>(),
      get<_i50.FireNotificationService>(),
      get<_i4.LocalNotificationService>(),
      get<_i62.SplashModule>(),
      get<_i68.AuthorizationModule>(),
      get<_i91.ChatModule>(),
      get<_i78.SettingsModule>(),
      get<_i71.HomeModule>(),
      get<_i19.MainModule>(),
      get<_i79.StoreModule>(),
      get<_i21.MyNotificationsModule>(),
      get<_i90.AccountModule>(),
      get<_i86.OrdersModule>(),
      get<_i89.ServicesModule>()));
  return get;
}

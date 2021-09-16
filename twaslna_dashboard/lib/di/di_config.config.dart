// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i90;
import '../module_auth/authoriazation_module.dart' as _i58;
import '../module_auth/manager/auth_manager/auth_manager.dart' as _i17;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i3;
import '../module_auth/repository/auth/auth_repository.dart' as _i15;
import '../module_auth/service/auth_service/auth_service.dart' as _i18;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i25;
import '../module_auth/state_manager/register_state_manager/register_state_manager.dart'
    as _i28;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i46;
import '../module_auth/ui/screen/register_screen/register_screen.dart' as _i50;
import '../module_captain/captains_module.dart' as _i86;
import '../module_captain/manager/captains_manager.dart' as _i31;
import '../module_captain/repository/captain_repository.dart' as _i19;
import '../module_captain/service/captains_service.dart' as _i32;
import '../module_captain/state_manager/captain_balance_state_manager.dart'
    as _i59;
import '../module_captain/state_manager/captain_captains_payment_list_state_manager.dart'
    as _i61;
import '../module_captain/state_manager/captain_list.dart' as _i33;
import '../module_captain/state_manager/captain_profile_state_manager.dart'
    as _i60;
import '../module_captain/state_manager/in_active_captains_state_manager.dart'
    as _i45;
import '../module_captain/ui/screen/captain_balance_screen.dart' as _i76;
import '../module_captain/ui/screen/captain_profile_screen.dart' as _i77;
import '../module_captain/ui/screen/captains_list_screen.dart' as _i62;
import '../module_captain/ui/screen/catpains_payment_screen.dart' as _i78;
import '../module_captain/ui/screen/in_active_captains_screen.dart' as _i66;
import '../module_categories/categories_module.dart' as _i79;
import '../module_categories/manager/categories_manager.dart' as _i34;
import '../module_categories/repository/categories_repository.dart' as _i20;
import '../module_categories/service/store_categories_service.dart' as _i35;
import '../module_categories/state_manager/products_category_state_manager.dart'
    as _i49;
import '../module_categories/state_manager/store_categories_state_manager.dart'
    as _i53;
import '../module_categories/state_manager/store_products_state_manager.dart'
    as _i55;
import '../module_categories/ui/screen/product_categories_screen.dart' as _i71;
import '../module_categories/ui/screen/store_categories_screen.dart' as _i73;
import '../module_categories/ui/screen/store_products_screen.dart' as _i74;
import '../module_chat/chat_module.dart' as _i80;
import '../module_chat/manager/chat/chat_manager.dart' as _i36;
import '../module_chat/presistance/chat_hive_helper.dart' as _i4;
import '../module_chat/repository/chat/chat_repository.dart' as _i21;
import '../module_chat/service/chat/char_service.dart' as _i37;
import '../module_chat/state_manager/chat_state_manager.dart' as _i38;
import '../module_chat/ui/screens/chat_page/chat_page.dart' as _i63;
import '../module_company/company_module.dart' as _i87;
import '../module_company/manager/company_manager.dart' as _i39;
import '../module_company/repository/company_repository.dart' as _i22;
import '../module_company/service/company_service.dart' as _i40;
import '../module_company/state_manager/company_profile_state_manager.dart'
    as _i64;
import '../module_company/ui/screen/company_profile_screen.dart' as _i81;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i6;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i7;
import '../module_main/main_module.dart' as _i89;
import '../module_main/manager/home_manager.dart' as _i42;
import '../module_main/repository/home_repository.dart' as _i23;
import '../module_main/sceen/home_screen.dart' as _i65;
import '../module_main/sceen/main_screen.dart' as _i88;
import '../module_main/service/home_service.dart' as _i43;
import '../module_main/state_manager/home_state_manager.dart' as _i44;
import '../module_network/http_client/http_client.dart' as _i13;
import '../module_notifications/preferences/notification_preferences/notification_preferences.dart'
    as _i9;
import '../module_notifications/repository/notification_repo.dart' as _i27;
import '../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i41;
import '../module_notifications/service/local_notification_service/local_notification_service.dart'
    as _i5;
import '../module_orders/manager/my_orders_manager.dart' as _i47;
import '../module_orders/orders_module.dart' as _i84;
import '../module_orders/repository/orders_repository.dart' as _i26;
import '../module_orders/service/orders_service.dart' as _i48;
import '../module_orders/state_manager/my_orders_state_manager.dart' as _i67;
import '../module_orders/state_manager/ongoing_orders_state_manager.dart'
    as _i68;
import '../module_orders/state_manager/order_details_state_manager.dart'
    as _i69;
import '../module_orders/ui/screen/my_orders_screen.dart' as _i70;
import '../module_orders/ui/screen/OngoingOrdersScreen.dart' as _i82;
import '../module_orders/ui/screen/order_details_screen.dart' as _i83;
import '../module_settings/settings_module.dart' as _i72;
import '../module_settings/ui/settings_page/settings_page.dart' as _i51;
import '../module_splash/splash_module.dart' as _i52;
import '../module_splash/ui/screen/splash_screen.dart' as _i29;
import '../module_stores/manager/stores_manager.dart' as _i54;
import '../module_stores/repository/stores_repository.dart' as _i30;
import '../module_stores/service/store_service.dart' as _i56;
import '../module_stores/state_manager/stores_state_manager.dart' as _i57;
import '../module_stores/stores_module.dart' as _i85;
import '../module_stores/ui/screen/store_info_screen.dart' as _i10;
import '../module_stores/ui/screen/stores_screen.dart' as _i75;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i11;
import '../module_theme/service/theme_service/theme_service.dart' as _i14;
import '../module_upload/manager/upload_manager/upload_manager.dart' as _i16;
import '../module_upload/repository/upload_repository/upload_repository.dart'
    as _i12;
import '../module_upload/service/image_upload/image_upload_service.dart'
    as _i24;
import '../utils/logger/logger.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AuthPrefsHelper>(() => _i3.AuthPrefsHelper());
  gh.factory<_i4.ChatHiveHelper>(() => _i4.ChatHiveHelper());
  gh.factory<_i5.LocalNotificationService>(
      () => _i5.LocalNotificationService());
  gh.factory<_i6.LocalizationPreferencesHelper>(
      () => _i6.LocalizationPreferencesHelper());
  gh.factory<_i7.LocalizationService>(
      () => _i7.LocalizationService(get<_i6.LocalizationPreferencesHelper>()));
  gh.factory<_i8.Logger>(() => _i8.Logger());
  gh.factory<_i9.NotificationsPrefsHelper>(
      () => _i9.NotificationsPrefsHelper());
  gh.factory<_i10.StoreInfoScreen>(() => _i10.StoreInfoScreen());
  gh.factory<_i11.ThemePreferencesHelper>(() => _i11.ThemePreferencesHelper());
  gh.factory<_i12.UploadRepository>(() => _i12.UploadRepository());
  gh.factory<_i13.ApiClient>(() => _i13.ApiClient(get<_i8.Logger>()));
  gh.factory<_i14.AppThemeDataService>(
      () => _i14.AppThemeDataService(get<_i11.ThemePreferencesHelper>()));
  gh.factory<_i15.AuthRepository>(
      () => _i15.AuthRepository(get<_i13.ApiClient>(), get<_i8.Logger>()));
  gh.factory<_i16.UploadManager>(
      () => _i16.UploadManager(get<_i12.UploadRepository>()));
  gh.factory<_i17.AuthManager>(
      () => _i17.AuthManager(get<_i15.AuthRepository>()));
  gh.factory<_i18.AuthService>(() =>
      _i18.AuthService(get<_i3.AuthPrefsHelper>(), get<_i17.AuthManager>()));
  gh.factory<_i19.CaptainRepository>(() =>
      _i19.CaptainRepository(get<_i13.ApiClient>(), get<_i18.AuthService>()));
  gh.factory<_i20.CategoriesRepository>(() => _i20.CategoriesRepository(
      get<_i13.ApiClient>(), get<_i18.AuthService>()));
  gh.factory<_i21.ChatRepository>(() =>
      _i21.ChatRepository(get<_i13.ApiClient>(), get<_i18.AuthService>()));
  gh.factory<_i22.CompanyRepository>(() =>
      _i22.CompanyRepository(get<_i13.ApiClient>(), get<_i18.AuthService>()));
  gh.factory<_i23.HomeRepository>(() =>
      _i23.HomeRepository(get<_i13.ApiClient>(), get<_i18.AuthService>()));
  gh.factory<_i24.ImageUploadService>(
      () => _i24.ImageUploadService(get<_i16.UploadManager>()));
  gh.factory<_i25.LoginStateManager>(
      () => _i25.LoginStateManager(get<_i18.AuthService>()));
  gh.factory<_i26.MyOrdersRepository>(() =>
      _i26.MyOrdersRepository(get<_i13.ApiClient>(), get<_i18.AuthService>()));
  gh.factory<_i27.NotificationRepo>(() =>
      _i27.NotificationRepo(get<_i13.ApiClient>(), get<_i18.AuthService>()));
  gh.factory<_i28.RegisterStateManager>(
      () => _i28.RegisterStateManager(get<_i18.AuthService>()));
  gh.factory<_i29.SplashScreen>(
      () => _i29.SplashScreen(get<_i18.AuthService>()));
  gh.factory<_i30.StoresRepository>(() =>
      _i30.StoresRepository(get<_i13.ApiClient>(), get<_i18.AuthService>()));
  gh.factory<_i31.CaptainManager>(
      () => _i31.CaptainManager(get<_i19.CaptainRepository>()));
  gh.factory<_i32.CaptainsService>(
      () => _i32.CaptainsService(get<_i31.CaptainManager>()));
  gh.factory<_i33.CaptainsStateManager>(
      () => _i33.CaptainsStateManager(get<_i32.CaptainsService>()));
  gh.factory<_i34.CategoriesManager>(
      () => _i34.CategoriesManager(get<_i20.CategoriesRepository>()));
  gh.factory<_i35.CategoriesService>(
      () => _i35.CategoriesService(get<_i34.CategoriesManager>()));
  gh.factory<_i36.ChatManager>(
      () => _i36.ChatManager(get<_i21.ChatRepository>()));
  gh.factory<_i37.ChatService>(() => _i37.ChatService(get<_i36.ChatManager>()));
  gh.factory<_i38.ChatStateManager>(
      () => _i38.ChatStateManager(get<_i37.ChatService>()));
  gh.factory<_i39.CompanyManager>(
      () => _i39.CompanyManager(get<_i22.CompanyRepository>()));
  gh.factory<_i40.CompanyService>(
      () => _i40.CompanyService(get<_i39.CompanyManager>()));
  gh.factory<_i41.FireNotificationService>(() => _i41.FireNotificationService(
      get<_i9.NotificationsPrefsHelper>(), get<_i27.NotificationRepo>()));
  gh.factory<_i42.HomeManager>(
      () => _i42.HomeManager(get<_i23.HomeRepository>()));
  gh.factory<_i43.HomeService>(() => _i43.HomeService(get<_i42.HomeManager>()));
  gh.factory<_i44.HomeStateManager>(
      () => _i44.HomeStateManager(get<_i43.HomeService>()));
  gh.factory<_i45.InActiveCaptainsStateManager>(
      () => _i45.InActiveCaptainsStateManager(get<_i32.CaptainsService>()));
  gh.factory<_i46.LoginScreen>(
      () => _i46.LoginScreen(get<_i25.LoginStateManager>()));
  gh.factory<_i47.MyOrdersManager>(
      () => _i47.MyOrdersManager(get<_i26.MyOrdersRepository>()));
  gh.factory<_i48.OrdersService>(
      () => _i48.OrdersService(get<_i47.MyOrdersManager>()));
  gh.factory<_i49.ProductsCategoryStateManager>(() =>
      _i49.ProductsCategoryStateManager(get<_i35.CategoriesService>(),
          get<_i18.AuthService>(), get<_i24.ImageUploadService>()));
  gh.factory<_i50.RegisterScreen>(
      () => _i50.RegisterScreen(get<_i28.RegisterStateManager>()));
  gh.factory<_i51.SettingsScreen>(() => _i51.SettingsScreen(
      get<_i18.AuthService>(),
      get<_i7.LocalizationService>(),
      get<_i14.AppThemeDataService>(),
      get<_i41.FireNotificationService>()));
  gh.factory<_i52.SplashModule>(
      () => _i52.SplashModule(get<_i29.SplashScreen>()));
  gh.factory<_i53.StoreCategoriesStateManager>(() =>
      _i53.StoreCategoriesStateManager(get<_i35.CategoriesService>(),
          get<_i18.AuthService>(), get<_i24.ImageUploadService>()));
  gh.factory<_i54.StoreManager>(
      () => _i54.StoreManager(get<_i30.StoresRepository>()));
  gh.factory<_i55.StoreProductsStateManager>(() =>
      _i55.StoreProductsStateManager(get<_i35.CategoriesService>(),
          get<_i18.AuthService>(), get<_i24.ImageUploadService>()));
  gh.factory<_i56.StoresService>(
      () => _i56.StoresService(get<_i54.StoreManager>()));
  gh.factory<_i57.StoresStateManager>(() => _i57.StoresStateManager(
      get<_i56.StoresService>(),
      get<_i18.AuthService>(),
      get<_i24.ImageUploadService>(),
      get<_i35.CategoriesService>()));
  gh.factory<_i58.AuthorizationModule>(() => _i58.AuthorizationModule(
      get<_i46.LoginScreen>(), get<_i50.RegisterScreen>()));
  gh.factory<_i59.CaptainBalanceStateManager>(
      () => _i59.CaptainBalanceStateManager(get<_i32.CaptainsService>()));
  gh.factory<_i60.CaptainProfileStateManager>(
      () => _i60.CaptainProfileStateManager(get<_i32.CaptainsService>()));
  gh.factory<_i61.CaptainsPaymentsStateManager>(
      () => _i61.CaptainsPaymentsStateManager(get<_i32.CaptainsService>()));
  gh.factory<_i62.CaptainsScreen>(
      () => _i62.CaptainsScreen(get<_i33.CaptainsStateManager>()));
  gh.factory<_i63.ChatPage>(() => _i63.ChatPage(
      get<_i38.ChatStateManager>(),
      get<_i24.ImageUploadService>(),
      get<_i18.AuthService>(),
      get<_i4.ChatHiveHelper>()));
  gh.factory<_i64.CompanyProfileStateManager>(() =>
      _i64.CompanyProfileStateManager(
          get<_i18.AuthService>(), get<_i40.CompanyService>()));
  gh.factory<_i65.HomeScreen>(
      () => _i65.HomeScreen(get<_i44.HomeStateManager>()));
  gh.factory<_i66.InActiveCaptainsScreen>(() =>
      _i66.InActiveCaptainsScreen(get<_i45.InActiveCaptainsStateManager>()));
  gh.factory<_i67.MyOrdersStateManager>(() => _i67.MyOrdersStateManager(
      get<_i48.OrdersService>(), get<_i18.AuthService>()));
  gh.factory<_i68.OnGoingOrdersStateManager>(() =>
      _i68.OnGoingOrdersStateManager(
          get<_i48.OrdersService>(), get<_i18.AuthService>()));
  gh.factory<_i69.OrderDetailsStateManager>(
      () => _i69.OrderDetailsStateManager(get<_i48.OrdersService>()));
  gh.factory<_i70.OrdersScreen>(
      () => _i70.OrdersScreen(get<_i67.MyOrdersStateManager>()));
  gh.factory<_i71.ProductCategoriesScreen>(() =>
      _i71.ProductCategoriesScreen(get<_i49.ProductsCategoryStateManager>()));
  gh.factory<_i72.SettingsModule>(
      () => _i72.SettingsModule(get<_i51.SettingsScreen>()));
  gh.factory<_i73.StoreCategoriesScreen>(() =>
      _i73.StoreCategoriesScreen(get<_i53.StoreCategoriesStateManager>()));
  gh.factory<_i74.StoreProductScreen>(
      () => _i74.StoreProductScreen(get<_i55.StoreProductsStateManager>()));
  gh.factory<_i75.StoresScreen>(
      () => _i75.StoresScreen(get<_i57.StoresStateManager>()));
  gh.factory<_i76.CaptainBalanceScreen>(
      () => _i76.CaptainBalanceScreen(get<_i59.CaptainBalanceStateManager>()));
  gh.factory<_i77.CaptainProfileScreen>(
      () => _i77.CaptainProfileScreen(get<_i60.CaptainProfileStateManager>()));
  gh.factory<_i78.CaptainsPaymentsScreen>(() =>
      _i78.CaptainsPaymentsScreen(get<_i61.CaptainsPaymentsStateManager>()));
  gh.factory<_i79.CategoriesModule>(() => _i79.CategoriesModule(
      get<_i73.StoreCategoriesScreen>(),
      get<_i71.ProductCategoriesScreen>(),
      get<_i74.StoreProductScreen>()));
  gh.factory<_i80.ChatModule>(
      () => _i80.ChatModule(get<_i63.ChatPage>(), get<_i18.AuthService>()));
  gh.factory<_i81.CompanyProfileScreen>(
      () => _i81.CompanyProfileScreen(get<_i64.CompanyProfileStateManager>()));
  gh.factory<_i82.OnGoingOrdersScreen>(
      () => _i82.OnGoingOrdersScreen(get<_i68.OnGoingOrdersStateManager>()));
  gh.factory<_i83.OrderDetailsScreen>(
      () => _i83.OrderDetailsScreen(get<_i69.OrderDetailsStateManager>()));
  gh.factory<_i84.OrdersModule>(() => _i84.OrdersModule(
      get<_i70.OrdersScreen>(),
      get<_i83.OrderDetailsScreen>(),
      get<_i82.OnGoingOrdersScreen>()));
  gh.factory<_i85.StoresModule>(() =>
      _i85.StoresModule(get<_i75.StoresScreen>(), get<_i10.StoreInfoScreen>()));
  gh.factory<_i86.CaptainsModule>(() => _i86.CaptainsModule(
      get<_i66.InActiveCaptainsScreen>(),
      get<_i77.CaptainProfileScreen>(),
      get<_i76.CaptainBalanceScreen>(),
      get<_i78.CaptainsPaymentsScreen>()));
  gh.factory<_i87.CompanyModule>(
      () => _i87.CompanyModule(get<_i81.CompanyProfileScreen>()));
  gh.factory<_i88.MainScreen>(() => _i88.MainScreen(
      get<_i65.HomeScreen>(),
      get<_i73.StoreCategoriesScreen>(),
      get<_i62.CaptainsScreen>(),
      get<_i66.InActiveCaptainsScreen>(),
      get<_i75.StoresScreen>(),
      get<_i51.SettingsScreen>(),
      get<_i81.CompanyProfileScreen>(),
      get<_i76.CaptainBalanceScreen>(),
      get<_i78.CaptainsPaymentsScreen>(),
      get<_i70.OrdersScreen>(),
      get<_i82.OnGoingOrdersScreen>()));
  gh.factory<_i89.MainModule>(() => _i89.MainModule(get<_i88.MainScreen>()));
  gh.factory<_i90.MyApp>(() => _i90.MyApp(
      get<_i14.AppThemeDataService>(),
      get<_i7.LocalizationService>(),
      get<_i41.FireNotificationService>(),
      get<_i5.LocalNotificationService>(),
      get<_i52.SplashModule>(),
      get<_i58.AuthorizationModule>(),
      get<_i80.ChatModule>(),
      get<_i72.SettingsModule>(),
      get<_i89.MainModule>(),
      get<_i79.CategoriesModule>(),
      get<_i85.StoresModule>(),
      get<_i86.CaptainsModule>(),
      get<_i87.CompanyModule>(),
      get<_i84.OrdersModule>()));
  return get;
}

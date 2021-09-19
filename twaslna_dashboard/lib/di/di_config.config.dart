// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i96;
import '../module_auth/authoriazation_module.dart' as _i61;
import '../module_auth/manager/auth_manager/auth_manager.dart' as _i17;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i3;
import '../module_auth/repository/auth/auth_repository.dart' as _i15;
import '../module_auth/service/auth_service/auth_service.dart' as _i18;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i26;
import '../module_auth/state_manager/register_state_manager/register_state_manager.dart'
    as _i29;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i49;
import '../module_auth/ui/screen/register_screen/register_screen.dart' as _i53;
import '../module_captain/captains_module.dart' as _i91;
import '../module_captain/manager/captains_manager.dart' as _i33;
import '../module_captain/repository/captain_repository.dart' as _i20;
import '../module_captain/service/captains_service.dart' as _i35;
import '../module_captain/state_manager/captain_balance_state_manager.dart'
    as _i62;
import '../module_captain/state_manager/captain_captains_payment_list_state_manager.dart'
    as _i64;
import '../module_captain/state_manager/captain_list.dart' as _i36;
import '../module_captain/state_manager/captain_profile_state_manager.dart'
    as _i63;
import '../module_captain/state_manager/in_active_captains_state_manager.dart'
    as _i48;
import '../module_captain/ui/screen/captain_balance_screen.dart' as _i80;
import '../module_captain/ui/screen/captain_profile_screen.dart' as _i81;
import '../module_captain/ui/screen/captains_list_screen.dart' as _i65;
import '../module_captain/ui/screen/catpains_payment_screen.dart' as _i82;
import '../module_captain/ui/screen/in_active_captains_screen.dart' as _i70;
import '../module_captain_payments/captains_module.dart' as _i92;
import '../module_captain_payments/manager/captains_manager.dart' as _i32;
import '../module_captain_payments/repository/captain_repository.dart' as _i19;
import '../module_captain_payments/service/captains_service.dart' as _i34;
import '../module_categories/categories_module.dart' as _i83;
import '../module_categories/manager/categories_manager.dart' as _i37;
import '../module_categories/repository/categories_repository.dart' as _i21;
import '../module_categories/service/store_categories_service.dart' as _i38;
import '../module_categories/state_manager/products_category_state_manager.dart'
    as _i52;
import '../module_categories/state_manager/store_categories_state_manager.dart'
    as _i56;
import '../module_categories/state_manager/store_products_state_manager.dart'
    as _i58;
import '../module_categories/ui/screen/product_categories_screen.dart' as _i75;
import '../module_categories/ui/screen/store_categories_screen.dart' as _i77;
import '../module_categories/ui/screen/store_products_screen.dart' as _i78;
import '../module_chat/chat_module.dart' as _i84;
import '../module_chat/manager/chat/chat_manager.dart' as _i39;
import '../module_chat/presistance/chat_hive_helper.dart' as _i4;
import '../module_chat/repository/chat/chat_repository.dart' as _i22;
import '../module_chat/service/chat/char_service.dart' as _i40;
import '../module_chat/state_manager/chat_state_manager.dart' as _i41;
import '../module_chat/ui/screens/chat_page/chat_page.dart' as _i66;
import '../module_company/company_module.dart' as _i93;
import '../module_company/manager/company_manager.dart' as _i42;
import '../module_company/repository/company_repository.dart' as _i23;
import '../module_company/service/company_service.dart' as _i43;
import '../module_company/state_manager/company_financial_state_manager.dart'
    as _i67;
import '../module_company/state_manager/company_profile_state_manager.dart'
    as _i68;
import '../module_company/ui/screen/company_finance_screen.dart' as _i85;
import '../module_company/ui/screen/company_profile_screen.dart' as _i86;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i6;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i7;
import '../module_main/main_module.dart' as _i95;
import '../module_main/manager/home_manager.dart' as _i45;
import '../module_main/repository/home_repository.dart' as _i24;
import '../module_main/sceen/home_screen.dart' as _i69;
import '../module_main/sceen/main_screen.dart' as _i94;
import '../module_main/service/home_service.dart' as _i46;
import '../module_main/state_manager/home_state_manager.dart' as _i47;
import '../module_network/http_client/http_client.dart' as _i13;
import '../module_notifications/preferences/notification_preferences/notification_preferences.dart'
    as _i9;
import '../module_notifications/repository/notification_repo.dart' as _i28;
import '../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i44;
import '../module_notifications/service/local_notification_service/local_notification_service.dart'
    as _i5;
import '../module_orders/manager/my_orders_manager.dart' as _i50;
import '../module_orders/orders_module.dart' as _i89;
import '../module_orders/repository/orders_repository.dart' as _i27;
import '../module_orders/service/orders_service.dart' as _i51;
import '../module_orders/state_manager/my_orders_state_manager.dart' as _i71;
import '../module_orders/state_manager/ongoing_orders_state_manager.dart'
    as _i72;
import '../module_orders/state_manager/order_details_state_manager.dart'
    as _i73;
import '../module_orders/ui/screen/my_orders_screen.dart' as _i74;
import '../module_orders/ui/screen/OngoingOrdersScreen.dart' as _i87;
import '../module_orders/ui/screen/order_details_screen.dart' as _i88;
import '../module_settings/settings_module.dart' as _i76;
import '../module_settings/ui/settings_page/settings_page.dart' as _i54;
import '../module_splash/splash_module.dart' as _i55;
import '../module_splash/ui/screen/splash_screen.dart' as _i30;
import '../module_stores/manager/stores_manager.dart' as _i57;
import '../module_stores/repository/stores_repository.dart' as _i31;
import '../module_stores/service/store_service.dart' as _i59;
import '../module_stores/state_manager/stores_state_manager.dart' as _i60;
import '../module_stores/stores_module.dart' as _i90;
import '../module_stores/ui/screen/store_info_screen.dart' as _i10;
import '../module_stores/ui/screen/stores_screen.dart' as _i79;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i11;
import '../module_theme/service/theme_service/theme_service.dart' as _i14;
import '../module_upload/manager/upload_manager/upload_manager.dart' as _i16;
import '../module_upload/repository/upload_repository/upload_repository.dart'
    as _i12;
import '../module_upload/service/image_upload/image_upload_service.dart'
    as _i25;
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
  gh.factory<_i20.CaptainRepository>(() =>
      _i20.CaptainRepository(get<_i13.ApiClient>(), get<_i18.AuthService>()));
  gh.factory<_i21.CategoriesRepository>(() => _i21.CategoriesRepository(
      get<_i13.ApiClient>(), get<_i18.AuthService>()));
  gh.factory<_i22.ChatRepository>(() =>
      _i22.ChatRepository(get<_i13.ApiClient>(), get<_i18.AuthService>()));
  gh.factory<_i23.CompanyRepository>(() =>
      _i23.CompanyRepository(get<_i13.ApiClient>(), get<_i18.AuthService>()));
  gh.factory<_i24.HomeRepository>(() =>
      _i24.HomeRepository(get<_i13.ApiClient>(), get<_i18.AuthService>()));
  gh.factory<_i25.ImageUploadService>(
      () => _i25.ImageUploadService(get<_i16.UploadManager>()));
  gh.factory<_i26.LoginStateManager>(
      () => _i26.LoginStateManager(get<_i18.AuthService>()));
  gh.factory<_i27.MyOrdersRepository>(() =>
      _i27.MyOrdersRepository(get<_i13.ApiClient>(), get<_i18.AuthService>()));
  gh.factory<_i28.NotificationRepo>(() =>
      _i28.NotificationRepo(get<_i13.ApiClient>(), get<_i18.AuthService>()));
  gh.factory<_i29.RegisterStateManager>(
      () => _i29.RegisterStateManager(get<_i18.AuthService>()));
  gh.factory<_i30.SplashScreen>(
      () => _i30.SplashScreen(get<_i18.AuthService>()));
  gh.factory<_i31.StoresRepository>(() =>
      _i31.StoresRepository(get<_i13.ApiClient>(), get<_i18.AuthService>()));
  gh.factory<_i32.CaptainManager>(
      () => _i32.CaptainManager(get<_i20.CaptainRepository>()));
  gh.factory<_i33.CaptainManager>(
      () => _i33.CaptainManager(get<_i20.CaptainRepository>()));
  gh.factory<_i34.CaptainsService>(
      () => _i34.CaptainsService(get<_i33.CaptainManager>()));
  gh.factory<_i35.CaptainsService>(
      () => _i35.CaptainsService(get<_i33.CaptainManager>()));
  gh.factory<_i36.CaptainsStateManager>(
      () => _i36.CaptainsStateManager(get<_i35.CaptainsService>()));
  gh.factory<_i37.CategoriesManager>(
      () => _i37.CategoriesManager(get<_i21.CategoriesRepository>()));
  gh.factory<_i38.CategoriesService>(
      () => _i38.CategoriesService(get<_i37.CategoriesManager>()));
  gh.factory<_i39.ChatManager>(
      () => _i39.ChatManager(get<_i22.ChatRepository>()));
  gh.factory<_i40.ChatService>(() => _i40.ChatService(get<_i39.ChatManager>()));
  gh.factory<_i41.ChatStateManager>(
      () => _i41.ChatStateManager(get<_i40.ChatService>()));
  gh.factory<_i42.CompanyManager>(
      () => _i42.CompanyManager(get<_i23.CompanyRepository>()));
  gh.factory<_i43.CompanyService>(
      () => _i43.CompanyService(get<_i42.CompanyManager>()));
  gh.factory<_i44.FireNotificationService>(() => _i44.FireNotificationService(
      get<_i9.NotificationsPrefsHelper>(), get<_i28.NotificationRepo>()));
  gh.factory<_i45.HomeManager>(
      () => _i45.HomeManager(get<_i24.HomeRepository>()));
  gh.factory<_i46.HomeService>(() => _i46.HomeService(get<_i45.HomeManager>()));
  gh.factory<_i47.HomeStateManager>(
      () => _i47.HomeStateManager(get<_i46.HomeService>()));
  gh.factory<_i48.InActiveCaptainsStateManager>(
      () => _i48.InActiveCaptainsStateManager(get<_i35.CaptainsService>()));
  gh.factory<_i49.LoginScreen>(
      () => _i49.LoginScreen(get<_i26.LoginStateManager>()));
  gh.factory<_i50.MyOrdersManager>(
      () => _i50.MyOrdersManager(get<_i27.MyOrdersRepository>()));
  gh.factory<_i51.OrdersService>(
      () => _i51.OrdersService(get<_i50.MyOrdersManager>()));
  gh.factory<_i52.ProductsCategoryStateManager>(() =>
      _i52.ProductsCategoryStateManager(get<_i38.CategoriesService>(),
          get<_i18.AuthService>(), get<_i25.ImageUploadService>()));
  gh.factory<_i53.RegisterScreen>(
      () => _i53.RegisterScreen(get<_i29.RegisterStateManager>()));
  gh.factory<_i54.SettingsScreen>(() => _i54.SettingsScreen(
      get<_i18.AuthService>(),
      get<_i7.LocalizationService>(),
      get<_i14.AppThemeDataService>(),
      get<_i44.FireNotificationService>()));
  gh.factory<_i55.SplashModule>(
      () => _i55.SplashModule(get<_i30.SplashScreen>()));
  gh.factory<_i56.StoreCategoriesStateManager>(() =>
      _i56.StoreCategoriesStateManager(get<_i38.CategoriesService>(),
          get<_i18.AuthService>(), get<_i25.ImageUploadService>()));
  gh.factory<_i57.StoreManager>(
      () => _i57.StoreManager(get<_i31.StoresRepository>()));
  gh.factory<_i58.StoreProductsStateManager>(() =>
      _i58.StoreProductsStateManager(get<_i38.CategoriesService>(),
          get<_i18.AuthService>(), get<_i25.ImageUploadService>()));
  gh.factory<_i59.StoresService>(
      () => _i59.StoresService(get<_i57.StoreManager>()));
  gh.factory<_i60.StoresStateManager>(() => _i60.StoresStateManager(
      get<_i59.StoresService>(),
      get<_i18.AuthService>(),
      get<_i25.ImageUploadService>(),
      get<_i38.CategoriesService>()));
  gh.factory<_i61.AuthorizationModule>(() => _i61.AuthorizationModule(
      get<_i49.LoginScreen>(), get<_i53.RegisterScreen>()));
  gh.factory<_i62.CaptainBalanceStateManager>(
      () => _i62.CaptainBalanceStateManager(get<_i35.CaptainsService>()));
  gh.factory<_i63.CaptainProfileStateManager>(
      () => _i63.CaptainProfileStateManager(get<_i35.CaptainsService>()));
  gh.factory<_i64.CaptainsPaymentsStateManager>(
      () => _i64.CaptainsPaymentsStateManager(get<_i35.CaptainsService>()));
  gh.factory<_i65.CaptainsScreen>(
      () => _i65.CaptainsScreen(get<_i36.CaptainsStateManager>()));
  gh.factory<_i66.ChatPage>(() => _i66.ChatPage(
      get<_i41.ChatStateManager>(),
      get<_i25.ImageUploadService>(),
      get<_i18.AuthService>(),
      get<_i4.ChatHiveHelper>()));
  gh.factory<_i67.CompanyFinanceStateManager>(() =>
      _i67.CompanyFinanceStateManager(
          get<_i18.AuthService>(), get<_i43.CompanyService>()));
  gh.factory<_i68.CompanyProfileStateManager>(() =>
      _i68.CompanyProfileStateManager(
          get<_i18.AuthService>(), get<_i43.CompanyService>()));
  gh.factory<_i69.HomeScreen>(
      () => _i69.HomeScreen(get<_i47.HomeStateManager>()));
  gh.factory<_i70.InActiveCaptainsScreen>(() =>
      _i70.InActiveCaptainsScreen(get<_i48.InActiveCaptainsStateManager>()));
  gh.factory<_i71.MyOrdersStateManager>(() => _i71.MyOrdersStateManager(
      get<_i51.OrdersService>(), get<_i18.AuthService>()));
  gh.factory<_i72.OnGoingOrdersStateManager>(() =>
      _i72.OnGoingOrdersStateManager(
          get<_i51.OrdersService>(), get<_i18.AuthService>()));
  gh.factory<_i73.OrderDetailsStateManager>(
      () => _i73.OrderDetailsStateManager(get<_i51.OrdersService>()));
  gh.factory<_i74.OrdersScreen>(
      () => _i74.OrdersScreen(get<_i71.MyOrdersStateManager>()));
  gh.factory<_i75.ProductCategoriesScreen>(() =>
      _i75.ProductCategoriesScreen(get<_i52.ProductsCategoryStateManager>()));
  gh.factory<_i76.SettingsModule>(
      () => _i76.SettingsModule(get<_i54.SettingsScreen>()));
  gh.factory<_i77.StoreCategoriesScreen>(() =>
      _i77.StoreCategoriesScreen(get<_i56.StoreCategoriesStateManager>()));
  gh.factory<_i78.StoreProductScreen>(
      () => _i78.StoreProductScreen(get<_i58.StoreProductsStateManager>()));
  gh.factory<_i79.StoresScreen>(
      () => _i79.StoresScreen(get<_i60.StoresStateManager>()));
  gh.factory<_i80.CaptainBalanceScreen>(
      () => _i80.CaptainBalanceScreen(get<_i62.CaptainBalanceStateManager>()));
  gh.factory<_i81.CaptainProfileScreen>(
      () => _i81.CaptainProfileScreen(get<_i63.CaptainProfileStateManager>()));
  gh.factory<_i82.CaptainsPaymentsScreen>(() =>
      _i82.CaptainsPaymentsScreen(get<_i64.CaptainsPaymentsStateManager>()));
  gh.factory<_i83.CategoriesModule>(() => _i83.CategoriesModule(
      get<_i77.StoreCategoriesScreen>(),
      get<_i75.ProductCategoriesScreen>(),
      get<_i78.StoreProductScreen>()));
  gh.factory<_i84.ChatModule>(
      () => _i84.ChatModule(get<_i66.ChatPage>(), get<_i18.AuthService>()));
  gh.factory<_i85.CompanyFinanceScreen>(
      () => _i85.CompanyFinanceScreen(get<_i67.CompanyFinanceStateManager>()));
  gh.factory<_i86.CompanyProfileScreen>(
      () => _i86.CompanyProfileScreen(get<_i68.CompanyProfileStateManager>()));
  gh.factory<_i87.OnGoingOrdersScreen>(
      () => _i87.OnGoingOrdersScreen(get<_i72.OnGoingOrdersStateManager>()));
  gh.factory<_i88.OrderDetailsScreen>(
      () => _i88.OrderDetailsScreen(get<_i73.OrderDetailsStateManager>()));
  gh.factory<_i89.OrdersModule>(() => _i89.OrdersModule(
      get<_i74.OrdersScreen>(),
      get<_i88.OrderDetailsScreen>(),
      get<_i87.OnGoingOrdersScreen>()));
  gh.factory<_i90.StoresModule>(() =>
      _i90.StoresModule(get<_i79.StoresScreen>(), get<_i10.StoreInfoScreen>()));
  gh.factory<_i91.CaptainsModule>(() => _i91.CaptainsModule(
      get<_i70.InActiveCaptainsScreen>(),
      get<_i81.CaptainProfileScreen>(),
      get<_i80.CaptainBalanceScreen>(),
      get<_i82.CaptainsPaymentsScreen>()));
  gh.factory<_i92.CaptainsModule>(() => _i92.CaptainsModule(
      get<_i70.InActiveCaptainsScreen>(),
      get<_i81.CaptainProfileScreen>(),
      get<_i80.CaptainBalanceScreen>(),
      get<_i82.CaptainsPaymentsScreen>()));
  gh.factory<_i93.CompanyModule>(() => _i93.CompanyModule(
      get<_i86.CompanyProfileScreen>(), get<_i85.CompanyFinanceScreen>()));
  gh.factory<_i94.MainScreen>(() => _i94.MainScreen(
      get<_i69.HomeScreen>(),
      get<_i77.StoreCategoriesScreen>(),
      get<_i65.CaptainsScreen>(),
      get<_i70.InActiveCaptainsScreen>(),
      get<_i79.StoresScreen>(),
      get<_i54.SettingsScreen>(),
      get<_i86.CompanyProfileScreen>(),
      get<_i80.CaptainBalanceScreen>(),
      get<_i82.CaptainsPaymentsScreen>(),
      get<_i74.OrdersScreen>(),
      get<_i87.OnGoingOrdersScreen>(),
      get<_i85.CompanyFinanceScreen>()));
  gh.factory<_i95.MainModule>(() => _i95.MainModule(get<_i94.MainScreen>()));
  gh.factory<_i96.MyApp>(() => _i96.MyApp(
      get<_i14.AppThemeDataService>(),
      get<_i7.LocalizationService>(),
      get<_i44.FireNotificationService>(),
      get<_i5.LocalNotificationService>(),
      get<_i55.SplashModule>(),
      get<_i61.AuthorizationModule>(),
      get<_i84.ChatModule>(),
      get<_i76.SettingsModule>(),
      get<_i95.MainModule>(),
      get<_i83.CategoriesModule>(),
      get<_i90.StoresModule>(),
      get<_i91.CaptainsModule>(),
      get<_i93.CompanyModule>(),
      get<_i89.OrdersModule>()));
  return get;
}

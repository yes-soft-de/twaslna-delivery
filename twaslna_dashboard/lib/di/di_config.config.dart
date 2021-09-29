// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i116;
import '../module_auth/authoriazation_module.dart' as _i68;
import '../module_auth/manager/auth_manager/auth_manager.dart' as _i16;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i3;
import '../module_auth/repository/auth/auth_repository.dart' as _i14;
import '../module_auth/service/auth_service/auth_service.dart' as _i17;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i25;
import '../module_auth/state_manager/register_state_manager/register_state_manager.dart'
    as _i30;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i50;
import '../module_auth/ui/screen/register_screen/register_screen.dart' as _i60;
import '../module_captain/captains_module.dart' as _i112;
import '../module_captain/manager/captains_manager.dart' as _i33;
import '../module_captain/repository/captain_repository.dart' as _i18;
import '../module_captain/service/captains_service.dart' as _i34;
import '../module_captain/state_manager/captain_balance_state_manager.dart'
    as _i69;
import '../module_captain/state_manager/captain_captains_payment_list_state_manager.dart'
    as _i73;
import '../module_captain/state_manager/captain_list.dart' as _i35;
import '../module_captain/state_manager/captain_profile_state_manager.dart'
    as _i72;
import '../module_captain/state_manager/in_active_captains_state_manager.dart'
    as _i49;
import '../module_captain/ui/screen/captain_balance_screen.dart' as _i94;
import '../module_captain/ui/screen/captain_profile_screen.dart' as _i97;
import '../module_captain/ui/screen/captains_list_screen.dart' as _i74;
import '../module_captain/ui/screen/catpains_payment_screen.dart' as _i98;
import '../module_captain/ui/screen/in_active_captains_screen.dart' as _i80;
import '../module_categories/categories_module.dart' as _i99;
import '../module_categories/manager/categories_manager.dart' as _i36;
import '../module_categories/repository/categories_repository.dart' as _i19;
import '../module_categories/service/store_categories_service.dart' as _i37;
import '../module_categories/state_manager/products_category_state_manager.dart'
    as _i59;
import '../module_categories/state_manager/store_categories_state_manager.dart'
    as _i63;
import '../module_categories/state_manager/store_products_state_manager.dart'
    as _i65;
import '../module_categories/ui/screen/product_categories_screen.dart' as _i88;
import '../module_categories/ui/screen/store_categories_screen.dart' as _i90;
import '../module_categories/ui/screen/store_products_screen.dart' as _i91;
import '../module_chat/chat_module.dart' as _i100;
import '../module_chat/manager/chat/chat_manager.dart' as _i38;
import '../module_chat/presistance/chat_hive_helper.dart' as _i4;
import '../module_chat/repository/chat/chat_repository.dart' as _i20;
import '../module_chat/service/chat/char_service.dart' as _i39;
import '../module_chat/state_manager/chat_state_manager.dart' as _i40;
import '../module_chat/ui/screens/chat_page/chat_page.dart' as _i75;
import '../module_company/company_module.dart' as _i113;
import '../module_company/manager/company_manager.dart' as _i41;
import '../module_company/repository/company_repository.dart' as _i21;
import '../module_company/service/company_service.dart' as _i42;
import '../module_company/state_manager/company_financial_state_manager.dart'
    as _i76;
import '../module_company/state_manager/company_profile_state_manager.dart'
    as _i77;
import '../module_company/ui/screen/company_finance_screen.dart' as _i101;
import '../module_company/ui/screen/company_profile_screen.dart' as _i102;
import '../module_filters/filters_module.dart' as _i103;
import '../module_filters/manager/filters_manager.dart' as _i43;
import '../module_filters/repository/filters_repository.dart' as _i22;
import '../module_filters/service/filters_service.dart' as _i44;
import '../module_filters/state_manager/captain_filter_state_manager.dart'
    as _i70;
import '../module_filters/ui/screen/captain_filter_screen.dart' as _i95;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i6;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i7;
import '../module_logs/logs_module.dart' as _i104;
import '../module_logs/manager/logs_manager.dart' as _i51;
import '../module_logs/repository/logs_repository.dart' as _i26;
import '../module_logs/service/logs_service.dart' as _i52;
import '../module_logs/state_manager/captain_logs_state_manager.dart' as _i71;
import '../module_logs/ui/screen/captain_logs_screen.dart' as _i96;
import '../module_main/main_module.dart' as _i115;
import '../module_main/manager/home_manager.dart' as _i46;
import '../module_main/repository/home_repository.dart' as _i23;
import '../module_main/sceen/home_screen.dart' as _i79;
import '../module_main/sceen/main_screen.dart' as _i114;
import '../module_main/service/home_service.dart' as _i47;
import '../module_main/state_manager/home_state_manager.dart' as _i48;
import '../module_network/http_client/http_client.dart' as _i12;
import '../module_notifications/preferences/notification_preferences/notification_preferences.dart'
    as _i9;
import '../module_notifications/repository/notification_repo.dart' as _i28;
import '../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i45;
import '../module_notifications/service/local_notification_service/local_notification_service.dart'
    as _i5;
import '../module_orders/manager/my_orders_manager.dart' as _i53;
import '../module_orders/orders_module.dart' as _i107;
import '../module_orders/repository/orders_repository.dart' as _i27;
import '../module_orders/service/orders_service.dart' as _i55;
import '../module_orders/state_manager/captains_from_state_manager.dart'
    as _i54;
import '../module_orders/state_manager/my_orders_state_manager.dart' as _i81;
import '../module_orders/state_manager/ongoing_orders_state_manager.dart'
    as _i82;
import '../module_orders/state_manager/order_details_state_manager.dart'
    as _i83;
import '../module_orders/ui/screen/my_orders_screen.dart' as _i85;
import '../module_orders/ui/screen/OngoingOrdersScreen.dart' as _i105;
import '../module_orders/ui/screen/order_accounts_screen.dart' as _i84;
import '../module_orders/ui/screen/order_details_screen.dart' as _i106;
import '../module_payments/manager/payments_manager.dart' as _i56;
import '../module_payments/payments_module.dart' as _i109;
import '../module_payments/repository/payments_repository.dart' as _i29;
import '../module_payments/service/payments_service.dart' as _i57;
import '../module_payments/state_manager/payments_from_state_manager.dart'
    as _i86;
import '../module_payments/state_manager/payments_to_state_manager.dart'
    as _i58;
import '../module_payments/ui/screen/paymen_from_captain_screen.dart' as _i108;
import '../module_payments/ui/screen/payment_to_captain_screen.dart' as _i87;
import '../module_settings/settings_module.dart' as _i89;
import '../module_settings/ui/settings_page/settings_page.dart' as _i61;
import '../module_splash/splash_module.dart' as _i62;
import '../module_splash/ui/screen/splash_screen.dart' as _i31;
import '../module_stores/manager/stores_manager.dart' as _i64;
import '../module_stores/repository/stores_repository.dart' as _i32;
import '../module_stores/service/store_service.dart' as _i66;
import '../module_stores/state_manager/store_profile_state_manager.dart'
    as _i92;
import '../module_stores/state_manager/stores_state_manager.dart' as _i67;
import '../module_stores/stores_module.dart' as _i111;
import '../module_stores/ui/screen/store_info_screen.dart' as _i110;
import '../module_stores/ui/screen/stores_screen.dart' as _i93;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i10;
import '../module_theme/service/theme_service/theme_service.dart' as _i13;
import '../module_upload/manager/upload_manager/upload_manager.dart' as _i15;
import '../module_upload/repository/upload_repository/upload_repository.dart'
    as _i11;
import '../module_upload/service/image_upload/image_upload_service.dart'
    as _i24;
import '../utils/global/global_state_manager.dart' as _i78;
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
  gh.factory<_i10.ThemePreferencesHelper>(() => _i10.ThemePreferencesHelper());
  gh.factory<_i11.UploadRepository>(() => _i11.UploadRepository());
  gh.factory<_i12.ApiClient>(() => _i12.ApiClient(get<_i8.Logger>()));
  gh.factory<_i13.AppThemeDataService>(
      () => _i13.AppThemeDataService(get<_i10.ThemePreferencesHelper>()));
  gh.factory<_i14.AuthRepository>(
      () => _i14.AuthRepository(get<_i12.ApiClient>(), get<_i8.Logger>()));
  gh.factory<_i15.UploadManager>(
      () => _i15.UploadManager(get<_i11.UploadRepository>()));
  gh.factory<_i16.AuthManager>(
      () => _i16.AuthManager(get<_i14.AuthRepository>()));
  gh.factory<_i17.AuthService>(() =>
      _i17.AuthService(get<_i3.AuthPrefsHelper>(), get<_i16.AuthManager>()));
  gh.factory<_i18.CaptainRepository>(() =>
      _i18.CaptainRepository(get<_i12.ApiClient>(), get<_i17.AuthService>()));
  gh.factory<_i19.CategoriesRepository>(() => _i19.CategoriesRepository(
      get<_i12.ApiClient>(), get<_i17.AuthService>()));
  gh.factory<_i20.ChatRepository>(() =>
      _i20.ChatRepository(get<_i12.ApiClient>(), get<_i17.AuthService>()));
  gh.factory<_i21.CompanyRepository>(() =>
      _i21.CompanyRepository(get<_i12.ApiClient>(), get<_i17.AuthService>()));
  gh.factory<_i22.FiltersRepository>(() =>
      _i22.FiltersRepository(get<_i12.ApiClient>(), get<_i17.AuthService>()));
  gh.factory<_i23.HomeRepository>(() =>
      _i23.HomeRepository(get<_i12.ApiClient>(), get<_i17.AuthService>()));
  gh.factory<_i24.ImageUploadService>(
      () => _i24.ImageUploadService(get<_i15.UploadManager>()));
  gh.factory<_i25.LoginStateManager>(
      () => _i25.LoginStateManager(get<_i17.AuthService>()));
  gh.factory<_i26.LogsRepository>(() =>
      _i26.LogsRepository(get<_i12.ApiClient>(), get<_i17.AuthService>()));
  gh.factory<_i27.MyOrdersRepository>(() =>
      _i27.MyOrdersRepository(get<_i12.ApiClient>(), get<_i17.AuthService>()));
  gh.factory<_i28.NotificationRepo>(() =>
      _i28.NotificationRepo(get<_i12.ApiClient>(), get<_i17.AuthService>()));
  gh.factory<_i29.PaymentsRepository>(() =>
      _i29.PaymentsRepository(get<_i12.ApiClient>(), get<_i17.AuthService>()));
  gh.factory<_i30.RegisterStateManager>(
      () => _i30.RegisterStateManager(get<_i17.AuthService>()));
  gh.factory<_i31.SplashScreen>(
      () => _i31.SplashScreen(get<_i17.AuthService>()));
  gh.factory<_i32.StoresRepository>(() =>
      _i32.StoresRepository(get<_i12.ApiClient>(), get<_i17.AuthService>()));
  gh.factory<_i33.CaptainManager>(
      () => _i33.CaptainManager(get<_i18.CaptainRepository>()));
  gh.factory<_i34.CaptainsService>(
      () => _i34.CaptainsService(get<_i33.CaptainManager>()));
  gh.factory<_i35.CaptainsStateManager>(
      () => _i35.CaptainsStateManager(get<_i34.CaptainsService>()));
  gh.factory<_i36.CategoriesManager>(
      () => _i36.CategoriesManager(get<_i19.CategoriesRepository>()));
  gh.factory<_i37.CategoriesService>(
      () => _i37.CategoriesService(get<_i36.CategoriesManager>()));
  gh.factory<_i38.ChatManager>(
      () => _i38.ChatManager(get<_i20.ChatRepository>()));
  gh.factory<_i39.ChatService>(() => _i39.ChatService(get<_i38.ChatManager>()));
  gh.factory<_i40.ChatStateManager>(
      () => _i40.ChatStateManager(get<_i39.ChatService>()));
  gh.factory<_i41.CompanyManager>(
      () => _i41.CompanyManager(get<_i21.CompanyRepository>()));
  gh.factory<_i42.CompanyService>(
      () => _i42.CompanyService(get<_i41.CompanyManager>()));
  gh.factory<_i43.FiltersManager>(
      () => _i43.FiltersManager(get<_i22.FiltersRepository>()));
  gh.factory<_i44.FiltersService>(
      () => _i44.FiltersService(get<_i43.FiltersManager>()));
  gh.factory<_i45.FireNotificationService>(() => _i45.FireNotificationService(
      get<_i9.NotificationsPrefsHelper>(), get<_i28.NotificationRepo>()));
  gh.factory<_i46.HomeManager>(
      () => _i46.HomeManager(get<_i23.HomeRepository>()));
  gh.factory<_i47.HomeService>(() => _i47.HomeService(get<_i46.HomeManager>()));
  gh.factory<_i48.HomeStateManager>(
      () => _i48.HomeStateManager(get<_i47.HomeService>()));
  gh.factory<_i49.InActiveCaptainsStateManager>(
      () => _i49.InActiveCaptainsStateManager(get<_i34.CaptainsService>()));
  gh.factory<_i50.LoginScreen>(
      () => _i50.LoginScreen(get<_i25.LoginStateManager>()));
  gh.factory<_i51.LogsManager>(
      () => _i51.LogsManager(get<_i26.LogsRepository>()));
  gh.factory<_i52.LogsService>(() => _i52.LogsService(get<_i51.LogsManager>()));
  gh.factory<_i53.MyOrdersManager>(
      () => _i53.MyOrdersManager(get<_i27.MyOrdersRepository>()));
  gh.factory<_i54.OrdersAccountStateManager>(
      () => _i54.OrdersAccountStateManager(get<_i34.CaptainsService>()));
  gh.factory<_i55.OrdersService>(
      () => _i55.OrdersService(get<_i53.MyOrdersManager>()));
  gh.factory<_i56.PaymentsManager>(
      () => _i56.PaymentsManager(get<_i29.PaymentsRepository>()));
  gh.factory<_i57.PaymentsService>(
      () => _i57.PaymentsService(get<_i56.PaymentsManager>()));
  gh.factory<_i58.PaymentsToCaptainStateManager>(() =>
      _i58.PaymentsToCaptainStateManager(
          get<_i34.CaptainsService>(), get<_i57.PaymentsService>()));
  gh.factory<_i59.ProductsCategoryStateManager>(() =>
      _i59.ProductsCategoryStateManager(get<_i37.CategoriesService>(),
          get<_i17.AuthService>(), get<_i24.ImageUploadService>()));
  gh.factory<_i60.RegisterScreen>(
      () => _i60.RegisterScreen(get<_i30.RegisterStateManager>()));
  gh.factory<_i61.SettingsScreen>(() => _i61.SettingsScreen(
      get<_i17.AuthService>(),
      get<_i7.LocalizationService>(),
      get<_i13.AppThemeDataService>(),
      get<_i45.FireNotificationService>()));
  gh.factory<_i62.SplashModule>(
      () => _i62.SplashModule(get<_i31.SplashScreen>()));
  gh.factory<_i63.StoreCategoriesStateManager>(() =>
      _i63.StoreCategoriesStateManager(get<_i37.CategoriesService>(),
          get<_i17.AuthService>(), get<_i24.ImageUploadService>()));
  gh.factory<_i64.StoreManager>(
      () => _i64.StoreManager(get<_i32.StoresRepository>()));
  gh.factory<_i65.StoreProductsStateManager>(() =>
      _i65.StoreProductsStateManager(get<_i37.CategoriesService>(),
          get<_i17.AuthService>(), get<_i24.ImageUploadService>()));
  gh.factory<_i66.StoresService>(
      () => _i66.StoresService(get<_i64.StoreManager>()));
  gh.factory<_i67.StoresStateManager>(() => _i67.StoresStateManager(
      get<_i66.StoresService>(),
      get<_i17.AuthService>(),
      get<_i24.ImageUploadService>(),
      get<_i37.CategoriesService>()));
  gh.factory<_i68.AuthorizationModule>(() => _i68.AuthorizationModule(
      get<_i50.LoginScreen>(), get<_i60.RegisterScreen>()));
  gh.factory<_i69.CaptainBalanceStateManager>(
      () => _i69.CaptainBalanceStateManager(get<_i34.CaptainsService>()));
  gh.factory<_i70.CaptainFilterStateManager>(
      () => _i70.CaptainFilterStateManager(get<_i44.FiltersService>()));
  gh.factory<_i71.CaptainLogsStateManager>(
      () => _i71.CaptainLogsStateManager(get<_i52.LogsService>()));
  gh.factory<_i72.CaptainProfileStateManager>(
      () => _i72.CaptainProfileStateManager(get<_i34.CaptainsService>()));
  gh.factory<_i73.CaptainsPaymentsStateManager>(
      () => _i73.CaptainsPaymentsStateManager(get<_i34.CaptainsService>()));
  gh.factory<_i74.CaptainsScreen>(
      () => _i74.CaptainsScreen(get<_i35.CaptainsStateManager>()));
  gh.factory<_i75.ChatPage>(() => _i75.ChatPage(
      get<_i40.ChatStateManager>(),
      get<_i24.ImageUploadService>(),
      get<_i17.AuthService>(),
      get<_i4.ChatHiveHelper>()));
  gh.factory<_i76.CompanyFinanceStateManager>(() =>
      _i76.CompanyFinanceStateManager(
          get<_i17.AuthService>(), get<_i42.CompanyService>()));
  gh.factory<_i77.CompanyProfileStateManager>(() =>
      _i77.CompanyProfileStateManager(
          get<_i17.AuthService>(), get<_i42.CompanyService>()));
  gh.factory<_i78.GlobalStateManager>(() => _i78.GlobalStateManager(
      get<_i49.InActiveCaptainsStateManager>(),
      get<_i35.CaptainsStateManager>()));
  gh.factory<_i79.HomeScreen>(
      () => _i79.HomeScreen(get<_i48.HomeStateManager>()));
  gh.factory<_i80.InActiveCaptainsScreen>(() =>
      _i80.InActiveCaptainsScreen(get<_i49.InActiveCaptainsStateManager>()));
  gh.factory<_i81.MyOrdersStateManager>(() => _i81.MyOrdersStateManager(
      get<_i55.OrdersService>(), get<_i17.AuthService>()));
  gh.factory<_i82.OnGoingOrdersStateManager>(() =>
      _i82.OnGoingOrdersStateManager(
          get<_i55.OrdersService>(), get<_i17.AuthService>()));
  gh.factory<_i83.OrderDetailsStateManager>(
      () => _i83.OrderDetailsStateManager(get<_i55.OrdersService>()));
  gh.factory<_i84.OrdersAccountScreen>(
      () => _i84.OrdersAccountScreen(get<_i54.OrdersAccountStateManager>()));
  gh.factory<_i85.OrdersScreen>(
      () => _i85.OrdersScreen(get<_i81.MyOrdersStateManager>()));
  gh.factory<_i86.PaymentsFromCaptainStateManager>(() =>
      _i86.PaymentsFromCaptainStateManager(
          get<_i34.CaptainsService>(), get<_i57.PaymentsService>()));
  gh.factory<_i87.PaymentsToCaptainScreen>(() =>
      _i87.PaymentsToCaptainScreen(get<_i58.PaymentsToCaptainStateManager>()));
  gh.factory<_i88.ProductCategoriesScreen>(() =>
      _i88.ProductCategoriesScreen(get<_i59.ProductsCategoryStateManager>()));
  gh.factory<_i89.SettingsModule>(
      () => _i89.SettingsModule(get<_i61.SettingsScreen>()));
  gh.factory<_i90.StoreCategoriesScreen>(() =>
      _i90.StoreCategoriesScreen(get<_i63.StoreCategoriesStateManager>()));
  gh.factory<_i91.StoreProductScreen>(
      () => _i91.StoreProductScreen(get<_i65.StoreProductsStateManager>()));
  gh.factory<_i92.StoreProfileStateManager>(
      () => _i92.StoreProfileStateManager(get<_i66.StoresService>()));
  gh.factory<_i93.StoresScreen>(
      () => _i93.StoresScreen(get<_i67.StoresStateManager>()));
  gh.factory<_i94.CaptainBalanceScreen>(
      () => _i94.CaptainBalanceScreen(get<_i69.CaptainBalanceStateManager>()));
  gh.factory<_i95.CaptainFilterScreen>(
      () => _i95.CaptainFilterScreen(get<_i70.CaptainFilterStateManager>()));
  gh.factory<_i96.CaptainLogsScreen>(
      () => _i96.CaptainLogsScreen(get<_i71.CaptainLogsStateManager>()));
  gh.factory<_i97.CaptainProfileScreen>(
      () => _i97.CaptainProfileScreen(get<_i72.CaptainProfileStateManager>()));
  gh.factory<_i98.CaptainsPaymentsScreen>(() =>
      _i98.CaptainsPaymentsScreen(get<_i73.CaptainsPaymentsStateManager>()));
  gh.factory<_i99.CategoriesModule>(() => _i99.CategoriesModule(
      get<_i90.StoreCategoriesScreen>(),
      get<_i88.ProductCategoriesScreen>(),
      get<_i91.StoreProductScreen>()));
  gh.factory<_i100.ChatModule>(
      () => _i100.ChatModule(get<_i75.ChatPage>(), get<_i17.AuthService>()));
  gh.factory<_i101.CompanyFinanceScreen>(
      () => _i101.CompanyFinanceScreen(get<_i76.CompanyFinanceStateManager>()));
  gh.factory<_i102.CompanyProfileScreen>(
      () => _i102.CompanyProfileScreen(get<_i77.CompanyProfileStateManager>()));
  gh.factory<_i103.FiltersModule>(
      () => _i103.FiltersModule(get<_i95.CaptainFilterScreen>()));
  gh.factory<_i104.LogsModule>(
      () => _i104.LogsModule(get<_i96.CaptainLogsScreen>()));
  gh.factory<_i105.OnGoingOrdersScreen>(
      () => _i105.OnGoingOrdersScreen(get<_i82.OnGoingOrdersStateManager>()));
  gh.factory<_i106.OrderDetailsScreen>(
      () => _i106.OrderDetailsScreen(get<_i83.OrderDetailsStateManager>()));
  gh.factory<_i107.OrdersModule>(() => _i107.OrdersModule(
      get<_i85.OrdersScreen>(),
      get<_i106.OrderDetailsScreen>(),
      get<_i105.OnGoingOrdersScreen>()));
  gh.factory<_i108.PaymentsFromCaptainScreen>(() =>
      _i108.PaymentsFromCaptainScreen(
          get<_i86.PaymentsFromCaptainStateManager>()));
  gh.factory<_i109.PaymentsModule>(() => _i109.PaymentsModule(
      get<_i108.PaymentsFromCaptainScreen>(),
      get<_i87.PaymentsToCaptainScreen>()));
  gh.factory<_i110.StoreInfoScreen>(
      () => _i110.StoreInfoScreen(get<_i92.StoreProfileStateManager>()));
  gh.factory<_i111.StoresModule>(() => _i111.StoresModule(
      get<_i93.StoresScreen>(), get<_i110.StoreInfoScreen>()));
  gh.factory<_i112.CaptainsModule>(() => _i112.CaptainsModule(
      get<_i80.InActiveCaptainsScreen>(),
      get<_i97.CaptainProfileScreen>(),
      get<_i94.CaptainBalanceScreen>(),
      get<_i98.CaptainsPaymentsScreen>()));
  gh.factory<_i113.CompanyModule>(() => _i113.CompanyModule(
      get<_i102.CompanyProfileScreen>(), get<_i101.CompanyFinanceScreen>()));
  gh.factory<_i114.MainScreen>(() => _i114.MainScreen(
      get<_i79.HomeScreen>(),
      get<_i90.StoreCategoriesScreen>(),
      get<_i74.CaptainsScreen>(),
      get<_i80.InActiveCaptainsScreen>(),
      get<_i93.StoresScreen>(),
      get<_i61.SettingsScreen>(),
      get<_i102.CompanyProfileScreen>(),
      get<_i94.CaptainBalanceScreen>(),
      get<_i98.CaptainsPaymentsScreen>(),
      get<_i85.OrdersScreen>(),
      get<_i105.OnGoingOrdersScreen>(),
      get<_i101.CompanyFinanceScreen>(),
      get<_i84.OrdersAccountScreen>(),
      get<_i95.CaptainFilterScreen>()));
  gh.factory<_i115.MainModule>(() => _i115.MainModule(get<_i114.MainScreen>()));
  gh.factory<_i116.MyApp>(() => _i116.MyApp(
      get<_i13.AppThemeDataService>(),
      get<_i7.LocalizationService>(),
      get<_i45.FireNotificationService>(),
      get<_i5.LocalNotificationService>(),
      get<_i62.SplashModule>(),
      get<_i68.AuthorizationModule>(),
      get<_i100.ChatModule>(),
      get<_i89.SettingsModule>(),
      get<_i115.MainModule>(),
      get<_i99.CategoriesModule>(),
      get<_i111.StoresModule>(),
      get<_i112.CaptainsModule>(),
      get<_i113.CompanyModule>(),
      get<_i107.OrdersModule>(),
      get<_i109.PaymentsModule>(),
      get<_i103.FiltersModule>(),
      get<_i104.LogsModule>()));
  return get;
}

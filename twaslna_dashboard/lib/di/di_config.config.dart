// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../main.dart' as _i145;
import '../module_auth/authoriazation_module.dart' as _i82;
import '../module_auth/manager/auth_manager/auth_manager.dart' as _i16;
import '../module_auth/presistance/auth_prefs_helper.dart' as _i3;
import '../module_auth/repository/auth/auth_repository.dart' as _i14;
import '../module_auth/service/auth_service/auth_service.dart' as _i17;
import '../module_auth/state_manager/login_state_manager/login_state_manager.dart'
    as _i26;
import '../module_auth/state_manager/register_state_manager/register_state_manager.dart'
    as _i31;
import '../module_auth/ui/screen/login_screen/login_screen.dart' as _i60;
import '../module_auth/ui/screen/register_screen/register_screen.dart' as _i71;
import '../module_captain/captains_module.dart' as _i143;
import '../module_captain/manager/captains_manager.dart' as _i38;
import '../module_captain/repository/captain_repository.dart' as _i18;
import '../module_captain/service/captains_service.dart' as _i40;
import '../module_captain/state_manager/captain_balance_state_manager.dart'
    as _i83;
import '../module_captain/state_manager/captain_captains_payment_list_state_manager.dart'
    as _i87;
import '../module_captain/state_manager/captain_list.dart' as _i41;
import '../module_captain/state_manager/captain_profile_state_manager.dart'
    as _i86;
import '../module_captain/state_manager/in_active_captains_state_manager.dart'
    as _i59;
import '../module_captain/ui/screen/captain_balance_screen.dart' as _i120;
import '../module_captain/ui/screen/captain_profile_screen.dart' as _i123;
import '../module_captain/ui/screen/captains_list_screen.dart' as _i89;
import '../module_captain/ui/screen/catpains_payment_screen.dart' as _i124;
import '../module_captain/ui/screen/in_active_captains_screen.dart' as _i97;
import '../module_categories/categories_module.dart' as _i125;
import '../module_categories/manager/categories_manager.dart' as _i42;
import '../module_categories/repository/categories_repository.dart' as _i19;
import '../module_categories/service/store_categories_service.dart' as _i43;
import '../module_categories/state_manager/products_category_state_manager.dart'
    as _i69;
import '../module_categories/state_manager/store_categories_state_manager.dart'
    as _i74;
import '../module_categories/state_manager/store_products_state_manager.dart'
    as _i77;
import '../module_categories/ui/screen/product_categories_screen.dart' as _i109;
import '../module_categories/ui/screen/store_categories_screen.dart' as _i113;
import '../module_categories/ui/screen/store_products_screen.dart' as _i115;
import '../module_chat/chat_module.dart' as _i126;
import '../module_chat/manager/chat/chat_manager.dart' as _i44;
import '../module_chat/presistance/chat_hive_helper.dart' as _i4;
import '../module_chat/repository/chat/chat_repository.dart' as _i20;
import '../module_chat/service/chat/char_service.dart' as _i45;
import '../module_chat/state_manager/chat_state_manager.dart' as _i46;
import '../module_chat/ui/screens/chat_page/chat_page.dart' as _i90;
import '../module_clients/clients_module.dart' as _i128;
import '../module_clients/manager/clients_manager.dart' as _i47;
import '../module_clients/repository/clients_repository.dart' as _i21;
import '../module_clients/service/clients_service.dart' as _i49;
import '../module_clients/state_manager/captain_list.dart' as _i50;
import '../module_clients/state_manager/captain_profile_state_manager.dart'
    as _i91;
import '../module_clients/ui/screen/clients_list_screen.dart' as _i93;
import '../module_clients/ui/screen/clients_profile_screen.dart' as _i127;
import '../module_company/company_module.dart' as _i144;
import '../module_company/manager/company_manager.dart' as _i51;
import '../module_company/repository/company_repository.dart' as _i22;
import '../module_company/service/company_service.dart' as _i52;
import '../module_company/state_manager/company_financial_state_manager.dart'
    as _i94;
import '../module_company/state_manager/company_profile_state_manager.dart'
    as _i95;
import '../module_company/ui/screen/company_finance_screen.dart' as _i129;
import '../module_company/ui/screen/company_profile_screen.dart' as _i130;
import '../module_filters/filters_module.dart' as _i131;
import '../module_filters/manager/filters_manager.dart' as _i53;
import '../module_filters/repository/filters_repository.dart' as _i23;
import '../module_filters/service/filters_service.dart' as _i54;
import '../module_filters/state_manager/captain_filter_state_manager.dart'
    as _i84;
import '../module_filters/state_manager/store_filter_state_manager.dart'
    as _i78;
import '../module_filters/ui/screen/captain_filter_screen.dart' as _i121;
import '../module_filters/ui/screen/store_filter_screen.dart' as _i117;
import '../module_localization/presistance/localization_preferences_helper/localization_preferences_helper.dart'
    as _i6;
import '../module_localization/service/localization_service/localization_service.dart'
    as _i7;
import '../module_logs/logs_module.dart' as _i132;
import '../module_logs/manager/logs_manager.dart' as _i61;
import '../module_logs/repository/logs_repository.dart' as _i27;
import '../module_logs/service/logs_service.dart' as _i62;
import '../module_logs/state_manager/captain_logs_state_manager.dart' as _i85;
import '../module_logs/state_manager/store_logs_state_manager.dart' as _i75;
import '../module_logs/ui/screen/captain_logs_screen.dart' as _i122;
import '../module_logs/ui/screen/store_logs_screen.dart' as _i114;
import '../module_main/main_module.dart' as _i133;
import '../module_main/manager/home_manager.dart' as _i56;
import '../module_main/repository/home_repository.dart' as _i24;
import '../module_main/sceen/home_screen.dart' as _i96;
import '../module_main/sceen/main_screen.dart' as _i98;
import '../module_main/service/home_service.dart' as _i57;
import '../module_main/state_manager/home_state_manager.dart' as _i58;
import '../module_network/http_client/http_client.dart' as _i12;
import '../module_notifications/preferences/notification_preferences/notification_preferences.dart'
    as _i9;
import '../module_notifications/repository/notification_repo.dart' as _i29;
import '../module_notifications/service/fire_notification_service/fire_notification_service.dart'
    as _i55;
import '../module_notifications/service/local_notification_service/local_notification_service.dart'
    as _i5;
import '../module_orders/manager/my_orders_manager.dart' as _i63;
import '../module_orders/orders_module.dart' as _i137;
import '../module_orders/repository/orders_repository.dart' as _i28;
import '../module_orders/service/orders_service.dart' as _i65;
import '../module_orders/state_manager/captains_from_state_manager.dart'
    as _i64;
import '../module_orders/state_manager/my_orders_state_manager.dart' as _i99;
import '../module_orders/state_manager/ongoing_orders_state_manager.dart'
    as _i100;
import '../module_orders/state_manager/order_details_state_manager.dart'
    as _i101;
import '../module_orders/state_manager/order_tim_line_state_manager.dart'
    as _i102;
import '../module_orders/state_manager/orders_without_pending_state_manager.dart'
    as _i103;
import '../module_orders/ui/screen/my_orders_screen.dart' as _i105;
import '../module_orders/ui/screen/OngoingOrdersScreen.dart' as _i134;
import '../module_orders/ui/screen/order_accounts_screen.dart' as _i104;
import '../module_orders/ui/screen/order_details_screen.dart' as _i135;
import '../module_orders/ui/screen/order_timeline_screen.dart' as _i136;
import '../module_orders/ui/screen/orders_without_pending_screen.dart' as _i106;
import '../module_payments/manager/payments_manager.dart' as _i66;
import '../module_payments/payments_module.dart' as _i139;
import '../module_payments/repository/payments_repository.dart' as _i30;
import '../module_payments/service/payments_service.dart' as _i67;
import '../module_payments/state_manager/payments_from_state_manager.dart'
    as _i107;
import '../module_payments/state_manager/payments_to_state_manager.dart'
    as _i68;
import '../module_payments/ui/screen/paymen_from_captain_screen.dart' as _i138;
import '../module_payments/ui/screen/payment_to_captain_screen.dart' as _i108;
import '../module_reports/manager/reports_manager.dart' as _i33;
import '../module_reports/report_module.dart' as _i111;
import '../module_reports/repository/reports_repository.dart' as _i32;
import '../module_reports/service/reports_service.dart' as _i34;
import '../module_reports/state_manager/captains_report_state_manager.dart'
    as _i39;
import '../module_reports/state_manager/clients_report_state_manager.dart'
    as _i48;
import '../module_reports/state_manager/products_report_state_manager.dart'
    as _i70;
import '../module_reports/state_manager/stores_report_state_manager.dart'
    as _i36;
import '../module_reports/ui/screen/captains_reports_screen.dart' as _i88;
import '../module_reports/ui/screen/clients_reports_screen.dart' as _i92;
import '../module_reports/ui/screen/products_reports_screen.dart' as _i110;
import '../module_reports/ui/screen/stores_reports_screen.dart' as _i79;
import '../module_settings/settings_module.dart' as _i112;
import '../module_settings/ui/settings_page/settings_page.dart' as _i72;
import '../module_splash/splash_module.dart' as _i73;
import '../module_splash/ui/screen/splash_screen.dart' as _i35;
import '../module_stores/manager/stores_manager.dart' as _i76;
import '../module_stores/repository/stores_repository.dart' as _i37;
import '../module_stores/service/store_service.dart' as _i80;
import '../module_stores/state_manager/store_profile_state_manager.dart'
    as _i116;
import '../module_stores/state_manager/stores_inactive_state_manager.dart'
    as _i118;
import '../module_stores/state_manager/stores_state_manager.dart' as _i81;
import '../module_stores/stores_module.dart' as _i142;
import '../module_stores/ui/screen/store_info_screen.dart' as _i140;
import '../module_stores/ui/screen/stores_inactive_screen.dart' as _i141;
import '../module_stores/ui/screen/stores_screen.dart' as _i119;
import '../module_theme/pressistance/theme_preferences_helper.dart' as _i10;
import '../module_theme/service/theme_service/theme_service.dart' as _i13;
import '../module_upload/manager/upload_manager/upload_manager.dart' as _i15;
import '../module_upload/repository/upload_repository/upload_repository.dart'
    as _i11;
import '../module_upload/service/image_upload/image_upload_service.dart'
    as _i25;
import '../utils/global/global_state_manager.dart' as _i146;
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
  gh.factory<_i21.ClientsRepository>(() =>
      _i21.ClientsRepository(get<_i12.ApiClient>(), get<_i17.AuthService>()));
  gh.factory<_i22.CompanyRepository>(() =>
      _i22.CompanyRepository(get<_i12.ApiClient>(), get<_i17.AuthService>()));
  gh.factory<_i23.FiltersRepository>(() =>
      _i23.FiltersRepository(get<_i12.ApiClient>(), get<_i17.AuthService>()));
  gh.factory<_i24.HomeRepository>(() =>
      _i24.HomeRepository(get<_i12.ApiClient>(), get<_i17.AuthService>()));
  gh.factory<_i25.ImageUploadService>(
      () => _i25.ImageUploadService(get<_i15.UploadManager>()));
  gh.factory<_i26.LoginStateManager>(
      () => _i26.LoginStateManager(get<_i17.AuthService>()));
  gh.factory<_i27.LogsRepository>(() =>
      _i27.LogsRepository(get<_i12.ApiClient>(), get<_i17.AuthService>()));
  gh.factory<_i28.MyOrdersRepository>(() =>
      _i28.MyOrdersRepository(get<_i12.ApiClient>(), get<_i17.AuthService>()));
  gh.factory<_i29.NotificationRepo>(() =>
      _i29.NotificationRepo(get<_i12.ApiClient>(), get<_i17.AuthService>()));
  gh.factory<_i30.PaymentsRepository>(() =>
      _i30.PaymentsRepository(get<_i12.ApiClient>(), get<_i17.AuthService>()));
  gh.factory<_i31.RegisterStateManager>(
      () => _i31.RegisterStateManager(get<_i17.AuthService>()));
  gh.factory<_i32.ReportRepository>(() =>
      _i32.ReportRepository(get<_i12.ApiClient>(), get<_i17.AuthService>()));
  gh.factory<_i33.ReportsManager>(
      () => _i33.ReportsManager(get<_i32.ReportRepository>()));
  gh.factory<_i34.ReportsService>(
      () => _i34.ReportsService(get<_i33.ReportsManager>()));
  gh.factory<_i35.SplashScreen>(
      () => _i35.SplashScreen(get<_i17.AuthService>()));
  gh.factory<_i36.StoresReportStateManager>(
      () => _i36.StoresReportStateManager(get<_i34.ReportsService>()));
  gh.factory<_i37.StoresRepository>(() =>
      _i37.StoresRepository(get<_i12.ApiClient>(), get<_i17.AuthService>()));
  gh.factory<_i38.CaptainManager>(
      () => _i38.CaptainManager(get<_i18.CaptainRepository>()));
  gh.factory<_i39.CaptainsReportStateManager>(
      () => _i39.CaptainsReportStateManager(get<_i34.ReportsService>()));
  gh.factory<_i40.CaptainsService>(
      () => _i40.CaptainsService(get<_i38.CaptainManager>()));
  gh.factory<_i41.CaptainsStateManager>(
      () => _i41.CaptainsStateManager(get<_i40.CaptainsService>()));
  gh.factory<_i42.CategoriesManager>(
      () => _i42.CategoriesManager(get<_i19.CategoriesRepository>()));
  gh.factory<_i43.CategoriesService>(
      () => _i43.CategoriesService(get<_i42.CategoriesManager>()));
  gh.factory<_i44.ChatManager>(
      () => _i44.ChatManager(get<_i20.ChatRepository>()));
  gh.factory<_i45.ChatService>(() => _i45.ChatService(get<_i44.ChatManager>()));
  gh.factory<_i46.ChatStateManager>(
      () => _i46.ChatStateManager(get<_i45.ChatService>()));
  gh.factory<_i47.ClientsManager>(
      () => _i47.ClientsManager(get<_i21.ClientsRepository>()));
  gh.factory<_i48.ClientsReportStateManager>(
      () => _i48.ClientsReportStateManager(get<_i34.ReportsService>()));
  gh.factory<_i49.ClientsService>(
      () => _i49.ClientsService(get<_i47.ClientsManager>()));
  gh.factory<_i50.ClientsStateManager>(
      () => _i50.ClientsStateManager(get<_i49.ClientsService>()));
  gh.factory<_i51.CompanyManager>(
      () => _i51.CompanyManager(get<_i22.CompanyRepository>()));
  gh.factory<_i52.CompanyService>(
      () => _i52.CompanyService(get<_i51.CompanyManager>()));
  gh.factory<_i53.FiltersManager>(
      () => _i53.FiltersManager(get<_i23.FiltersRepository>()));
  gh.factory<_i54.FiltersService>(
      () => _i54.FiltersService(get<_i53.FiltersManager>()));
  gh.factory<_i55.FireNotificationService>(() => _i55.FireNotificationService(
      get<_i9.NotificationsPrefsHelper>(), get<_i29.NotificationRepo>()));
  gh.factory<_i56.HomeManager>(
      () => _i56.HomeManager(get<_i24.HomeRepository>()));
  gh.factory<_i57.HomeService>(() => _i57.HomeService(get<_i56.HomeManager>()));
  gh.factory<_i58.HomeStateManager>(
      () => _i58.HomeStateManager(get<_i57.HomeService>()));
  gh.factory<_i59.InActiveCaptainsStateManager>(
      () => _i59.InActiveCaptainsStateManager(get<_i40.CaptainsService>()));
  gh.factory<_i60.LoginScreen>(
      () => _i60.LoginScreen(get<_i26.LoginStateManager>()));
  gh.factory<_i61.LogsManager>(
      () => _i61.LogsManager(get<_i27.LogsRepository>()));
  gh.factory<_i62.LogsService>(() => _i62.LogsService(get<_i61.LogsManager>()));
  gh.factory<_i63.MyOrdersManager>(
      () => _i63.MyOrdersManager(get<_i28.MyOrdersRepository>()));
  gh.factory<_i64.OrdersAccountStateManager>(
      () => _i64.OrdersAccountStateManager(get<_i40.CaptainsService>()));
  gh.factory<_i65.OrdersService>(
      () => _i65.OrdersService(get<_i63.MyOrdersManager>()));
  gh.factory<_i66.PaymentsManager>(
      () => _i66.PaymentsManager(get<_i30.PaymentsRepository>()));
  gh.factory<_i67.PaymentsService>(
      () => _i67.PaymentsService(get<_i66.PaymentsManager>()));
  gh.factory<_i68.PaymentsToCaptainStateManager>(() =>
      _i68.PaymentsToCaptainStateManager(
          get<_i40.CaptainsService>(), get<_i67.PaymentsService>()));
  gh.factory<_i69.ProductsCategoryStateManager>(() =>
      _i69.ProductsCategoryStateManager(get<_i43.CategoriesService>(),
          get<_i17.AuthService>(), get<_i25.ImageUploadService>()));
  gh.factory<_i70.ProductsReportStateManager>(
      () => _i70.ProductsReportStateManager(get<_i34.ReportsService>()));
  gh.factory<_i71.RegisterScreen>(
      () => _i71.RegisterScreen(get<_i31.RegisterStateManager>()));
  gh.factory<_i72.SettingsScreen>(() => _i72.SettingsScreen(
      get<_i17.AuthService>(),
      get<_i7.LocalizationService>(),
      get<_i13.AppThemeDataService>(),
      get<_i55.FireNotificationService>()));
  gh.factory<_i73.SplashModule>(
      () => _i73.SplashModule(get<_i35.SplashScreen>()));
  gh.factory<_i74.StoreCategoriesStateManager>(() =>
      _i74.StoreCategoriesStateManager(get<_i43.CategoriesService>(),
          get<_i17.AuthService>(), get<_i25.ImageUploadService>()));
  gh.factory<_i75.StoreLogsStateManager>(
      () => _i75.StoreLogsStateManager(get<_i62.LogsService>()));
  gh.factory<_i76.StoreManager>(
      () => _i76.StoreManager(get<_i37.StoresRepository>()));
  gh.factory<_i77.StoreProductsStateManager>(() =>
      _i77.StoreProductsStateManager(get<_i43.CategoriesService>(),
          get<_i17.AuthService>(), get<_i25.ImageUploadService>()));
  gh.factory<_i78.StoresFilterStateManager>(
      () => _i78.StoresFilterStateManager(get<_i54.FiltersService>()));
  gh.factory<_i79.StoresReportScreen>(
      () => _i79.StoresReportScreen(get<_i36.StoresReportStateManager>()));
  gh.factory<_i80.StoresService>(
      () => _i80.StoresService(get<_i76.StoreManager>()));
  gh.factory<_i81.StoresStateManager>(() => _i81.StoresStateManager(
      get<_i80.StoresService>(),
      get<_i17.AuthService>(),
      get<_i25.ImageUploadService>(),
      get<_i43.CategoriesService>()));
  gh.factory<_i82.AuthorizationModule>(() => _i82.AuthorizationModule(
      get<_i60.LoginScreen>(), get<_i71.RegisterScreen>()));
  gh.factory<_i83.CaptainBalanceStateManager>(
      () => _i83.CaptainBalanceStateManager(get<_i40.CaptainsService>()));
  gh.factory<_i84.CaptainFilterStateManager>(
      () => _i84.CaptainFilterStateManager(get<_i54.FiltersService>()));
  gh.factory<_i85.CaptainLogsStateManager>(
      () => _i85.CaptainLogsStateManager(get<_i62.LogsService>()));
  gh.factory<_i86.CaptainProfileStateManager>(
      () => _i86.CaptainProfileStateManager(get<_i40.CaptainsService>()));
  gh.factory<_i87.CaptainsPaymentsStateManager>(
      () => _i87.CaptainsPaymentsStateManager(get<_i40.CaptainsService>()));
  gh.factory<_i88.CaptainsReportScreen>(
      () => _i88.CaptainsReportScreen(get<_i39.CaptainsReportStateManager>()));
  gh.factory<_i89.CaptainsScreen>(
      () => _i89.CaptainsScreen(get<_i41.CaptainsStateManager>()));
  gh.factory<_i90.ChatPage>(() => _i90.ChatPage(
      get<_i46.ChatStateManager>(),
      get<_i25.ImageUploadService>(),
      get<_i17.AuthService>(),
      get<_i4.ChatHiveHelper>()));
  gh.factory<_i91.ClientProfileStateManager>(
      () => _i91.ClientProfileStateManager(get<_i49.ClientsService>()));
  gh.factory<_i92.ClientsReportScreen>(
      () => _i92.ClientsReportScreen(get<_i48.ClientsReportStateManager>()));
  gh.factory<_i93.ClientsScreen>(
      () => _i93.ClientsScreen(get<_i50.ClientsStateManager>()));
  gh.factory<_i94.CompanyFinanceStateManager>(() =>
      _i94.CompanyFinanceStateManager(
          get<_i17.AuthService>(), get<_i52.CompanyService>()));
  gh.factory<_i95.CompanyProfileStateManager>(() =>
      _i95.CompanyProfileStateManager(
          get<_i17.AuthService>(), get<_i52.CompanyService>()));
  gh.factory<_i96.HomeScreen>(
      () => _i96.HomeScreen(get<_i58.HomeStateManager>()));
  gh.factory<_i97.InActiveCaptainsScreen>(() =>
      _i97.InActiveCaptainsScreen(get<_i59.InActiveCaptainsStateManager>()));
  gh.factory<_i98.MainScreen>(() => _i98.MainScreen(get<_i96.HomeScreen>()));
  gh.factory<_i99.MyOrdersStateManager>(() => _i99.MyOrdersStateManager(
      get<_i65.OrdersService>(), get<_i17.AuthService>()));
  gh.factory<_i100.OnGoingOrdersStateManager>(() =>
      _i100.OnGoingOrdersStateManager(
          get<_i65.OrdersService>(), get<_i17.AuthService>()));
  gh.factory<_i101.OrderDetailsStateManager>(
      () => _i101.OrderDetailsStateManager(get<_i65.OrdersService>()));
  gh.factory<_i102.OrderTimeLineStateManager>(
      () => _i102.OrderTimeLineStateManager(get<_i65.OrdersService>()));
  gh.factory<_i103.OrderWithoutPendingStateManager>(() =>
      _i103.OrderWithoutPendingStateManager(
          get<_i65.OrdersService>(), get<_i17.AuthService>()));
  gh.factory<_i104.OrdersAccountScreen>(
      () => _i104.OrdersAccountScreen(get<_i64.OrdersAccountStateManager>()));
  gh.factory<_i105.OrdersScreen>(
      () => _i105.OrdersScreen(get<_i99.MyOrdersStateManager>()));
  gh.factory<_i106.OrdersWithoutPendingScreen>(() =>
      _i106.OrdersWithoutPendingScreen(
          get<_i103.OrderWithoutPendingStateManager>()));
  gh.factory<_i107.PaymentsFromCaptainStateManager>(() =>
      _i107.PaymentsFromCaptainStateManager(
          get<_i40.CaptainsService>(), get<_i67.PaymentsService>()));
  gh.factory<_i108.PaymentsToCaptainScreen>(() =>
      _i108.PaymentsToCaptainScreen(get<_i68.PaymentsToCaptainStateManager>()));
  gh.factory<_i109.ProductCategoriesScreen>(() =>
      _i109.ProductCategoriesScreen(get<_i69.ProductsCategoryStateManager>()));
  gh.factory<_i110.ProductsReportScreen>(
      () => _i110.ProductsReportScreen(get<_i70.ProductsReportStateManager>()));
  gh.factory<_i111.ReportsModule>(() => _i111.ReportsModule(
      get<_i110.ProductsReportScreen>(),
      get<_i79.StoresReportScreen>(),
      get<_i88.CaptainsReportScreen>(),
      get<_i92.ClientsReportScreen>()));
  gh.factory<_i112.SettingsModule>(
      () => _i112.SettingsModule(get<_i72.SettingsScreen>()));
  gh.factory<_i113.StoreCategoriesScreen>(() =>
      _i113.StoreCategoriesScreen(get<_i74.StoreCategoriesStateManager>()));
  gh.factory<_i114.StoreLogsScreen>(
      () => _i114.StoreLogsScreen(get<_i75.StoreLogsStateManager>()));
  gh.factory<_i115.StoreProductScreen>(
      () => _i115.StoreProductScreen(get<_i77.StoreProductsStateManager>()));
  gh.factory<_i116.StoreProfileStateManager>(
      () => _i116.StoreProfileStateManager(get<_i80.StoresService>()));
  gh.factory<_i117.StoresFilterScreen>(
      () => _i117.StoresFilterScreen(get<_i78.StoresFilterStateManager>()));
  gh.factory<_i118.StoresInActiveStateManager>(() =>
      _i118.StoresInActiveStateManager(
          get<_i80.StoresService>(),
          get<_i17.AuthService>(),
          get<_i25.ImageUploadService>(),
          get<_i43.CategoriesService>()));
  gh.factory<_i119.StoresScreen>(
      () => _i119.StoresScreen(get<_i81.StoresStateManager>()));
  gh.factory<_i120.CaptainBalanceScreen>(
      () => _i120.CaptainBalanceScreen(get<_i83.CaptainBalanceStateManager>()));
  gh.factory<_i121.CaptainFilterScreen>(
      () => _i121.CaptainFilterScreen(get<_i84.CaptainFilterStateManager>()));
  gh.factory<_i122.CaptainLogsScreen>(
      () => _i122.CaptainLogsScreen(get<_i85.CaptainLogsStateManager>()));
  gh.factory<_i123.CaptainProfileScreen>(
      () => _i123.CaptainProfileScreen(get<_i86.CaptainProfileStateManager>()));
  gh.factory<_i124.CaptainsPaymentsScreen>(() =>
      _i124.CaptainsPaymentsScreen(get<_i87.CaptainsPaymentsStateManager>()));
  gh.factory<_i125.CategoriesModule>(() => _i125.CategoriesModule(
      get<_i113.StoreCategoriesScreen>(),
      get<_i109.ProductCategoriesScreen>(),
      get<_i115.StoreProductScreen>()));
  gh.factory<_i126.ChatModule>(
      () => _i126.ChatModule(get<_i90.ChatPage>(), get<_i17.AuthService>()));
  gh.factory<_i127.ClientProfileScreen>(
      () => _i127.ClientProfileScreen(get<_i91.ClientProfileStateManager>()));
  gh.factory<_i128.ClientsModule>(() => _i128.ClientsModule(
      get<_i127.ClientProfileScreen>(), get<_i93.ClientsScreen>()));
  gh.factory<_i129.CompanyFinanceScreen>(
      () => _i129.CompanyFinanceScreen(get<_i94.CompanyFinanceStateManager>()));
  gh.factory<_i130.CompanyProfileScreen>(
      () => _i130.CompanyProfileScreen(get<_i95.CompanyProfileStateManager>()));
  gh.factory<_i131.FiltersModule>(() => _i131.FiltersModule(
      get<_i121.CaptainFilterScreen>(), get<_i117.StoresFilterScreen>()));
  gh.factory<_i132.LogsModule>(() => _i132.LogsModule(
      get<_i122.CaptainLogsScreen>(), get<_i114.StoreLogsScreen>()));
  gh.factory<_i133.MainModule>(
      () => _i133.MainModule(get<_i98.MainScreen>(), get<_i96.HomeScreen>()));
  gh.factory<_i134.OnGoingOrdersScreen>(
      () => _i134.OnGoingOrdersScreen(get<_i100.OnGoingOrdersStateManager>()));
  gh.factory<_i135.OrderDetailsScreen>(
      () => _i135.OrderDetailsScreen(get<_i101.OrderDetailsStateManager>()));
  gh.factory<_i136.OrderTimLineScreen>(
      () => _i136.OrderTimLineScreen(get<_i102.OrderTimeLineStateManager>()));
  gh.factory<_i137.OrdersModule>(() => _i137.OrdersModule(
      get<_i105.OrdersScreen>(),
      get<_i135.OrderDetailsScreen>(),
      get<_i134.OnGoingOrdersScreen>(),
      get<_i136.OrderTimLineScreen>(),
      get<_i106.OrdersWithoutPendingScreen>(),
      get<_i104.OrdersAccountScreen>()));
  gh.factory<_i138.PaymentsFromCaptainScreen>(() =>
      _i138.PaymentsFromCaptainScreen(
          get<_i107.PaymentsFromCaptainStateManager>()));
  gh.factory<_i139.PaymentsModule>(() => _i139.PaymentsModule(
      get<_i138.PaymentsFromCaptainScreen>(),
      get<_i108.PaymentsToCaptainScreen>()));
  gh.factory<_i140.StoreInfoScreen>(
      () => _i140.StoreInfoScreen(get<_i116.StoreProfileStateManager>()));
  gh.factory<_i141.StoresInActiveScreen>(() =>
      _i141.StoresInActiveScreen(get<_i118.StoresInActiveStateManager>()));
  gh.factory<_i142.StoresModule>(() => _i142.StoresModule(
      get<_i119.StoresScreen>(),
      get<_i140.StoreInfoScreen>(),
      get<_i141.StoresInActiveScreen>()));
  gh.factory<_i143.CaptainsModule>(() => _i143.CaptainsModule(
      get<_i97.InActiveCaptainsScreen>(),
      get<_i123.CaptainProfileScreen>(),
      get<_i120.CaptainBalanceScreen>(),
      get<_i124.CaptainsPaymentsScreen>(),
      get<_i89.CaptainsScreen>()));
  gh.factory<_i144.CompanyModule>(() => _i144.CompanyModule(
      get<_i130.CompanyProfileScreen>(), get<_i129.CompanyFinanceScreen>()));
  gh.factory<_i145.MyApp>(() => _i145.MyApp(
      get<_i13.AppThemeDataService>(),
      get<_i7.LocalizationService>(),
      get<_i55.FireNotificationService>(),
      get<_i5.LocalNotificationService>(),
      get<_i73.SplashModule>(),
      get<_i82.AuthorizationModule>(),
      get<_i126.ChatModule>(),
      get<_i112.SettingsModule>(),
      get<_i133.MainModule>(),
      get<_i125.CategoriesModule>(),
      get<_i142.StoresModule>(),
      get<_i143.CaptainsModule>(),
      get<_i144.CompanyModule>(),
      get<_i137.OrdersModule>(),
      get<_i139.PaymentsModule>(),
      get<_i131.FiltersModule>(),
      get<_i132.LogsModule>()));
  gh.singleton<_i146.GlobalStateManager>(_i146.GlobalStateManager(
      get<_i59.InActiveCaptainsStateManager>(),
      get<_i41.CaptainsStateManager>()));
  return get;
}

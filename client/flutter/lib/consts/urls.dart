class Urls {
  static const String DOMAIN = 'http://167.99.255.30';
  static const String BASE_API = DOMAIN + '';
  static const String IMAGES_ROOT = DOMAIN + '/upload/';
  static const UPLOAD_API = BASE_API + '/uploadfile';
  static const SIGN_UP_API = BASE_API + '/user';
  static const OWNER_PROFILE_API = BASE_API + '/userprofile';
  static const CREATE_TOKEN_API = BASE_API + '/login_check';
  static const REPORT_API = BASE_API + '/report';
  static const NOTIFICATION_API = BASE_API + '/notificationtoken';
  static const COMPANYINFO_API = BASE_API + '/companyinfoforuser';
  static const NOTIFICATIONNEWCHAT_API = BASE_API + '/notificationnewchat';
  static const NOTIFICATIONTOADMIN_API = BASE_API + '/notificationtoadmin';
  static const GET_TOP_PRODUCTS_API = BASE_API + '/productstopwanted';
  static const GET_STORE_CATEGORIES_API = BASE_API + '/storecategories';
  static const GET_STORE_CATEGORY_LIST_API = BASE_API + '/storeownerbycategoryid/';
  static const GET_MOST_WANTED_STORE_PRODUCTS = BASE_API + '/productstopwantedofspecificstoreowner';
  static const GET_PRODUCTS_CATEGORY_API = BASE_API + '/storeProductsCategory';
}

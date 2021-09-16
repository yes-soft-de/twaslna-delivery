class Urls {
  static const String DOMAIN = 'http://167.172.175.77';
  static const String BASE_API = DOMAIN + '';
  static const String IMAGES_ROOT = DOMAIN + '/upload/';
  static const UPLOAD_API = BASE_API + '/uploadfile';
  static const SIGN_UP_API = BASE_API + '/createAdmin';
  static const OWNER_PROFILE_API = BASE_API + '/userprofile';
  static const CREATE_TOKEN_API = BASE_API + '/login_check';
  static const REPORT_API = BASE_API + '/report';
  static const NOTIFICATION_API = BASE_API + '/notificationtoken';
  static const COMPANYINFO_API = BASE_API + '/companyinfoforuser';
  static const NOTIFICATIONNEWCHAT_API = BASE_API + '/notificationnewchat';
  static const NOTIFICATIONTOADMIN_API = BASE_API + '/notificationtoadmin';
  static const CREATE_CAPTAIN_PROFILE = BASE_API + '/captainprofile' ;
  static const CAPTAIN_ACTIVE_STATUS_API = BASE_API + '/captainisactive';
  static const ORDER_STATUS_API = BASE_API + '/orderDetails/';
  static const NEARBY_ORDERS_API = BASE_API + '/closestOrders';
  static const CAPTAIN_ACCEPTED_ORDERS_API = BASE_API + '/getAcceptedOrder';
  static const ACCEPT_ORDER_API = BASE_API + '/acceptedOrder';
  static const CAPTAIN_ORDER_UPDATE_API = BASE_API + '/orderUpdateState';
  static const ORDER_UPDATE_BILL_API = BASE_API + '/orderUpdateInvoiceByCaptain';
  static const UPDATES_API = BASE_API + '/updateall';
  static const ORDER_BY_ID = BASE_API + '/orderStatus/';
  static const SEND_TO_RECORD = BASE_API + '/record';
  static const CAPTAIN_PROFILE_API = BASE_API + '/captainprofile' ;
  static const TERMS_CAPTAIN = BASE_API + '/termscaptain';
  static const LOG_API = BASE_API + '/getRecords';
  static const CAPTAIN_BALANCE_ACCOUNT = BASE_API + '/captainFinancialAccount';
  static const CAPTAIN_BALANCE_LAST_MONTH = BASE_API + '/captainFinancialAccountInLastMonth';
  static const GET_ORDER_LOGS = BASE_API + '/orderLogs';
  static const CHECK_USER_ROLE = BASE_API + '/checkUserType';
  static const STORE_CATEGORIES = BASE_API + '/storecategories';
  static const CREATE_STORE_CATEGORIES = BASE_API + '/createstorecategory';
  static const GET_STORES_BY_CATEGORY = BASE_API + '/storeownerbycategoryid';
  static const GET_STORES = BASE_API + '/storeOwners';
  static const CREATE_STORES = BASE_API + '/storeownercreatbyadmin';
  static const GET_PRODUCTS_CATEGORY = BASE_API + '/storeProductsCategory/';
  static const GET_PRODUCTS = BASE_API + '/productsStoreByProfileId/';
  static const CREATE_PRODUCTS_CATEGORY = BASE_API + '/StoreProductCategory';
  static const CREATE_PRODUCTS = BASE_API + '/createproductbyadmin';
  static const CREATE_PRODUCTS_CATEGORY_FOR_STORE = '/StoreProductCategory';
  static const GET_IN_ACTIVE_CAPTAINS = BASE_API + '/getcaptainsinactive';
  static const ACTIVATE_CAPTAIN = BASE_API + '/captainprofileupdatebyadmin';
  static const GET_CAPTAIN_PROFILE = BASE_API +'/captainProfile/';
  static const UPDATE_STORE_CATEGORY = BASE_API + '/updateStorecategory';
  static const UPDATE_STORE = BASE_API + '/storeownerprofileupdatebyadmin';
  static const UPDATE_PRODUCT_CATEGORY = BASE_API + '/storeProductCategory';
  static const UPDATE_PRODUCT = BASE_API + '/updateProductByAdmin';
  static const GET_PROFILE_COMPANY = BASE_API + '/companyinfoall';
  static const CREATE_COMPANY_PROFILE = BASE_API + '/companyinfo';
  static const GET_CAPTAINS_LIST = BASE_API + '/captains';
  static const GET_REPORT = BASE_API + '/countReport';
  static const GET_ACCOUNT_BALANCE_CAPTAIN = BASE_API + '/captainFinancialAccountForAdmin/';
  static const GET_ACCOUNT_BALANCE_CAPTAIN_LAST_MONTH = BASE_API + '/captainFinancialAccountInLastMonthForAdmin/';
  static const GET_UNFINISHED_PAYMENT = BASE_API + '/captainsUnfinishedPayments';
  static const GET_UNFINISHED_ORDER = BASE_API + '/getPendingOrders';
  static const GET_ONGOING_ORDERS = BASE_API + '/getOrders';
  static const GET_ORDER_DETAILS = BASE_API + '/orderDetailsForAdmin/';




}

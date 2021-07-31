import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_auth/enums/auth_source.dart';
import 'package:twaslna_delivery/module_auth/exceptions/auth_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class AuthPrefsHelper {
  var box = Hive.box('Authorization');

  Future<void> setUserId(String userId) async {
    SharedPreferences preferencesHelper = await SharedPreferences.getInstance();
    await preferencesHelper.setString('uid', userId);
    return;
  }

  Future<String?> getUserId() async {
    SharedPreferences preferencesHelper = await SharedPreferences.getInstance();
    return preferencesHelper.getString('uid');
  }

   void setUsername(String username) {
     box.put('username', username);
  }

  String? getUsername() {
    return box.get('username');
  }

  Future<void> setEmail(String email) async {
    SharedPreferences preferencesHelper = await SharedPreferences.getInstance();
    await preferencesHelper.setString('email', email);
  }

  Future<String?> getEmail() async {
    SharedPreferences preferencesHelper = await SharedPreferences.getInstance();
    return preferencesHelper.getString('email');
  }

  void setPassword(String password) {
    box.put('password', password);
  }

  String? getPassword() {
    return box.get('password');
  }

  void setUserCreated(bool created) {
    box.put('created',created);
  }
  bool getUserCreated() {
    return box.get('created') ?? false;
  }
  void clearUserCreated() {
     box.delete('created');
  }
  bool isSignedIn() {
    try {
      String? uid = getToken();
      return uid != null;
    } catch (e) {
      return false;
    }
  }

  Future<AuthSource?> getAuthSource() async {
    SharedPreferences preferencesHelper = await SharedPreferences.getInstance();
    int? index = preferencesHelper.getInt('auth_source');
    if (index != null) {
      return AuthSource.values[index];
    } else {}
  }

  Future<void> setAuthSource([AuthSource? authSource]) async {
    SharedPreferences preferencesHelper = await SharedPreferences.getInstance();
    if (authSource != null) {
     await preferencesHelper.setInt(
        'auth_source',
        authSource.index,
      );
    }
  }

  /// @Function saves token string
  /// @returns void
  void setToken(String? token){
    if (token != null) {
      box.put('token',token);
      box.put(
        'token_date',
        DateTime.now().toIso8601String(),
      );
    }
  }

  void deleteToken()  {
    box.delete('token');
    box.delete('token_date');
  }

  Future<void> cleanAll() async {
    await box.clear();
  }

  /// @return String Token String
  /// @throw Unauthorized Exception when token is null
  String? getToken() {
    var token = box.get('token');
    if (token == null) {
      throw AuthorizationException('Token not found');
    }
    return token;
  }

  /// @return DateTime tokenDate
  /// @throw UnauthorizedException when token date not found
  DateTime getTokenDate() {
    var dateStr = box.get('token_date');
    if (dateStr == null) {
      throw AuthorizationException('Token date not found');
    }
    return DateTime.parse(dateStr);
  }
}

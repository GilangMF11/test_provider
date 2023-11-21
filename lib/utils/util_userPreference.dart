import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const _keyToken = 'token';
  static const _keyName = 'name';
  static const _keyStatus = 'status';
  static const _keyUsername = 'username';
  static const _keyPassword = 'password';

  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyToken);
  }

  static Future<String?> getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyName);
  }

  static Future<String?> getStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyStatus);
  }

  static Future<String?> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUsername);
  }

  static Future<String?> getPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyPassword);
  }

  static Future<bool> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_keyToken, token);
  }

  static Future<bool> saveName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_keyName, name);
  }

  static Future<bool> saveStatus(String status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_keyStatus, status);
  }

  static Future<bool> saveUsername(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_keyUsername, username);
  }

  static Future<bool> savePassword(String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_keyPassword, password);
  }

  
}

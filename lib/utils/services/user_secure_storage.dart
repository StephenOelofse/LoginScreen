import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static const _storage = FlutterSecureStorage();

  static const _keyUsername = 'username';
  static const _rememberMe = 'rememberme';

  static Future setUsername(String username) async =>
      await _storage.write(key: _keyUsername, value: username);

  static Future getUsername() async => await _storage.read(key: _keyUsername);

  static Future setRememberMe(String checkbox) async =>
      await _storage.write(key: _rememberMe, value: checkbox);

  static Future getRememberMe() async => await _storage.read(key: _rememberMe);
}

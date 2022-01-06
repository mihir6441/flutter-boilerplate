import 'package:rxdart/src/transformers/flat_map.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  static const _keyUserToken = 'keyUserToken';
  static const _keyUserProfile = 'keyUserProfile';
  static const keyLanguageCode = 'language_code';
  static const keyIsGuestUser = 'guest_user';
  static const keyFullName = 'name';
  static const keyEmail = 'email';

  Future<bool> isLoggedIn() async {
    final preferences = await _getPreferences();
    return preferences.containsKey(_keyUserToken) &&
        preferences.containsKey(_keyUserProfile);
  }

  Future<bool> isGuestUser() async {
    final preferences = await _getPreferences();
    return preferences.getBool(keyIsGuestUser) ?? false;
  }

  void setGuestUser(bool isGuestUser) async {
    (await _getPreferences()).setBool(keyIsGuestUser, isGuestUser);
  }

  Future<SharedPreferences> _getPreferences() async =>
      await SharedPreferences.getInstance();

  Future<String?> getUserToken() async {
    return (await _getPreferences()).getString(_keyUserToken);
  }

  void setUserToken(String? token) async {
    if (token == null || token.isEmpty) {
      (await _getPreferences()).remove(_keyUserToken);
    } else {
      (await _getPreferences()).setString(_keyUserToken, token);
    }
  }

  /// Get [String] from the [SharedPreferences]
  Stream<String?> getString(String key) {
    return _getSharedPreference()
        .map((preference) => preference.getString(key));
  }

  /// Set [String] to the [SharedPreferences]
  Stream<bool> setString(String key, String value) {
    return _getSharedPreference().flatMap(
        (preference) => _convertToRx(preference.setString(key, value)));
  }

  Stream<SharedPreferences> _getSharedPreference() {
    return _convertToRx(_getPreferences());
  }

  Stream<T> _convertToRx<T>(Future<T> future) {
    return future.asStream();
  }
}

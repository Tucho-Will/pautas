import 'package:shared_preferences/shared_preferences.dart';

class PreferencesStorage {
  static Future<SharedPreferences> getInstance() async {
    return await SharedPreferences.getInstance();
  }
}

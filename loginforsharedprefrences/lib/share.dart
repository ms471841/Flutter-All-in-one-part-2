import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  static String sharedPreferenceUserLoggedInKey = "ISLOGGEDIN";

// SAVE DATA

//saving data in SharedPreferences
  //
  static Future<bool> saveUserLoggedInSharedPreference(
      bool isUserLoggedIn) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(
        sharedPreferenceUserLoggedInKey, isUserLoggedIn);
  }

//fetch data from sharedpreferences
  static Future<bool?> getUserLoggedInSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return await preferences.getBool(sharedPreferenceUserLoggedInKey);
  }
}

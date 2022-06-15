import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as developer;

class UserDataService {
  UserDataService();

  Future<bool> checkIfUserDataExistInSharedPref() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getKeys().isEmpty ? false : true;
    } catch (e) {
      developer.log(e.toString(), name: 'SharedPrefGate');
      return false;
    }
  }

  saveUserInfo(int liveExpectancy, String birthDate) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt("live_expectancy", liveExpectancy);
    prefs.setString("birth_date", birthDate);
  }

  Future<Map<String, dynamic>?> readUserDataFromSharedPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final birthDate = prefs.getString('birth_date');
    final expectedYears = prefs.getInt('live_expectancy');

    if (birthDate == null || expectedYears == null) {
      return null;
    } else {
      return {"birth_date": birthDate, "live_expectancy": expectedYears};
    }
  }
}

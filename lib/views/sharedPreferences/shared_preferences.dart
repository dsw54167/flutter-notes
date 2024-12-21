import 'package:shared_preferences/shared_preferences.dart';

class LoginSupport {

  void loginUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('logged_in', true);
  }

  void logoutUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('logged_in', false);
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('logged_in') ?? false;
  }
}

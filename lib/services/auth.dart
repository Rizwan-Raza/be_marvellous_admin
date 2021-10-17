import 'package:shared_preferences/shared_preferences.dart';

class Login {
  bool isLogin = false;
  late SharedPreferences prefs;
  init() async {
    prefs = await SharedPreferences.getInstance();
    isLogin = prefs.getBool("isLogin") ?? false;
  }

  Login() {
    init();
  }

  bool login(String username, String password) {
    if (username == "admin" && password == "bsdk") {
      isLogin = true;
      prefs.setBool("isLogin", true);
    } else {
      isLogin = false;
      prefs.setBool("isLogin", false);
    }
    return isLogin;
  }

  void logout() {
    isLogin = false;
    prefs.setBool("isLogin", false);
  }
}

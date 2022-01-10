import 'package:be_marvellous_admin/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login {
  bool _isLogin = false;
  late SharedPreferences prefs;
  init() async {
    prefs = await SharedPreferences.getInstance();
    _isLogin = prefs.getBool("isLogin") ?? false;
  }

  Login() {
    init();
  }

  bool login(String username, String password) {
    if (username == "admin" && password == "bsdk") {
      _isLogin = true;
      prefs.setBool("isLogin", true);
    } else {
      _isLogin = false;
      prefs.setBool("isLogin", false);
    }
    return _isLogin;
  }

  void logout() {
    _isLogin = false;
    prefs.setBool("isLogin", false);
  }

  get isLogin async {
    _isLogin = prefs.getBool("isLogin") ?? false;
    return _isLogin;
  }

  Widget getScreen(Widget screen) {
    if (_isLogin) {
      return screen;
    } else {
      return LoginScreen();
    }
  }
}

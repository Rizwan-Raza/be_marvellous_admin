class Login {
  bool isLogin = false;

  bool login(String username, String password) {
    if (username == "admin" && password == "bsdk") {
      isLogin = true;
    } else {
      isLogin = false;
    }
    return isLogin;
  }

  void logout() {
    isLogin = false;
  }
}

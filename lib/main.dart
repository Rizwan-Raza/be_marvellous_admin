import 'package:be_marvellous_admin/screens/dashboard.dart';
import 'package:be_marvellous_admin/screens/login.dart';
import 'package:be_marvellous_admin/screens/settings.dart';
import 'package:be_marvellous_admin/screens/watchlist.dart';
import 'package:be_marvellous_admin/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Login login = Login();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Login>(
          create: (_) => login,
        ),
      ],
      child: FutureBuilder(
          future: login.isLogin,
          builder: (context, snapshot) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Be Marvellous | Admin Panel',
              theme: ThemeData(
                fontFamily: 'Product-Sans',
                primarySwatch: Colors.red,
              ),
              initialRoute: "/",
              routes: {
                "/": (context) => login.getScreen(LoginScreen()),
                "/login": (context) => login.getScreen(DashboardScreen()),
                "/dashboard": (context) => login.getScreen(DashboardScreen()),
                "/watchlist": (context) => login.getScreen(WatchListScreen()),
                "/settings": (context) => login.getScreen(SettingsScreen()),
              },
            );
          }),
    );
  }
}

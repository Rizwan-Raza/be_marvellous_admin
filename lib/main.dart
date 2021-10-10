import 'package:be_marvellous_admin/screens/dashboard.dart';
import 'package:be_marvellous_admin/screens/login.dart';
import 'package:be_marvellous_admin/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Login>(
          create: (_) => Login(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Be Marvellous | Admin Panel',
        theme: ThemeData(
          fontFamily: 'Product-Sans',
          primarySwatch: Colors.red,
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => Provider.of<Login>(context).isLogin
              ? DashboardScreen()
              : LoginScreen(),
          "/login": (context) => Provider.of<Login>(context).isLogin
              ? DashboardScreen()
              : LoginScreen(),
          "/dashboard": (context) => Provider.of<Login>(context).isLogin
              ? DashboardScreen()
              : LoginScreen(),
        },
      ),
    );
  }
}

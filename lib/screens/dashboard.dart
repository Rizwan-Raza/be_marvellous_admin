import 'package:be_marvellous_admin/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Be Marvellous - Admin Panel"),
        actions: [
          ElevatedButton(
            child: Text("Logout"),
            onPressed: () {
              Provider.of<Login>(context, listen: false).logout();
              Navigator.pushReplacementNamed(context, "/login");
            },
          )
        ],
      ),
      body: Center(
        child: Text("Laudu Lalit"),
      ),
    );
  }
}

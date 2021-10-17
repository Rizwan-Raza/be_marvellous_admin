import 'package:be_marvellous_admin/widgets/skeleton.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Skeleton(
        child: Center(
      child: Text("Laudu Lalit Dash"),
    ));
  }
}

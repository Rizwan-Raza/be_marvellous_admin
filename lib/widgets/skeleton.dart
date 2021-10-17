import 'package:be_marvellous_admin/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Skeleton extends StatelessWidget {
  final Widget child;
  const Skeleton({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'BE MARVELLOUS',
                  style: TextStyle(
                      fontFamily: 'Marvel',
                      fontSize: 60.0,
                      color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
            ListTile(
              title: Text('Watch List'),
              leading: Icon(Icons.toc),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Characters'),
              leading: Icon(Icons.face),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Movies'),
              leading: Icon(Icons.movie),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('TV Shows'),
              leading: Icon(Icons.tv),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(),
            ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, "/settings");
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'BE MARVELLOUS',
              style: TextStyle(fontFamily: 'Marvel', fontSize: 32),
            ),
            Text(" - Admin Panel"),
          ],
        ),
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
      body: child,
    );
  }
}

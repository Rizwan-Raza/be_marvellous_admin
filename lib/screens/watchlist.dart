import 'dart:developer';

import 'package:be_marvellous_admin/services/scrapper.dart';
import 'package:be_marvellous_admin/services/settings_service.dart';
import 'package:be_marvellous_admin/widgets/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WatchListScreen extends StatefulWidget {
  const WatchListScreen({Key? key}) : super(key: key);

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  late SettingServices _settingServices;
  @override
  void initState() {
    super.initState();
    _settingServices = Provider.of<SettingServices>(context, listen: false);
    _settingServices.getSetting("hostname").then((value) {
      hostname = value;
      _settingServices.getSetting("watchlistLink").then((value) {
        watchlist = value;
        _settingServices.getSetting("pages").then((value) {
          pages = value;
          _settingServices.getSetting("limit").then((value) {
            limit = value;
            Scrapper(hostname!).isEverythingOk(watchlist!).then((value) {
              if (value) {
                setState(() {
                  isEverythingOk = true;
                });
              }
            });
          });
        });
      });
    });
  }

  bool isEverythingOk = false;
  String? hostname;
  String? watchlist;
  String? pages;
  String? limit;
  @override
  Widget build(BuildContext context) {
    return Skeleton(
        child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: ListView(
        children: [
          ListTile(
              title: Text("Hostname"),
              subtitle: Text(hostname ?? ""),
              trailing: hostname != null
                  ? Icon(Icons.check, color: Colors.green)
                  : CircularProgressIndicator()),
          ListTile(
            title: Text("Watchlist Link"),
            subtitle: Text(watchlist ?? ""),
            trailing: watchlist != null
                ? Icon(Icons.check, color: Colors.green)
                : CircularProgressIndicator(),
          ),
          ListTile(
            title: Text("Page Numbers"),
            subtitle: Text(pages != null ? pages.toString() : ""),
            trailing: pages != null
                ? Icon(Icons.check, color: Colors.green)
                : CircularProgressIndicator(),
          ),
          ListTile(
            title: Text("Limit"),
            subtitle: Text(limit != null ? limit.toString() : ""),
            trailing: limit != null
                ? Icon(Icons.check, color: Colors.green)
                : CircularProgressIndicator(),
          ),
          ListTile(
            title: Text("Scrapable"),
            subtitle: Text(isEverythingOk ? "Yes" : ""),
            trailing: isEverythingOk
                ? Icon(Icons.check, color: Colors.green)
                : CircularProgressIndicator(),
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: isEverythingOk
                      ? () {
                          // if (_formKey.currentState!.validate()) {
                          //   _formKey.currentState!.save();
                          // } else {
                          //   return;
                          // }
                          // if (!loginBloc.login(username, password)) {
                          //   ScaffoldMessenger.of(context)
                          //       .showMaterialBanner(MaterialBanner(
                          //     backgroundColor: Colors.yellow[100],
                          //     actions: [
                          //       TextButton(
                          //         child: Text("Close"),
                          //         onPressed: () {
                          //           ScaffoldMessenger.of(context)
                          //               .clearMaterialBanners();
                          //         },
                          //       )
                          //     ],
                          //     content: Text("Authetication Failed"),
                          //   ));
                          //   Future.delayed(
                          //       const Duration(seconds: 5),
                          //       ScaffoldMessenger.of(context)
                          //           .clearMaterialBanners);
                          // } else {
                          //   Navigator.pushReplacementNamed(context, "/dashboard");
                          // }
                        }
                      : null,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Start Scrapping",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  )),
            ],
          ),
        ],
      ),
    ));
  }
}

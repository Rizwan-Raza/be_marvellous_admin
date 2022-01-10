import 'dart:async';

import 'package:be_marvellous_admin/services/scrapper.dart';
import 'package:be_marvellous_admin/widgets/skeleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WatchListScreen extends StatefulWidget {
  const WatchListScreen({Key? key}) : super(key: key);

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  late Future<DocumentSnapshot<Map<String, dynamic>>> hostname;
  late Future<DocumentSnapshot<Map<String, dynamic>>> watchlistLink;

  @override
  void initState() {
    super.initState();
    hostname =
        FirebaseFirestore.instance.collection('settings').doc('hostname').get();
    watchlistLink = FirebaseFirestore.instance
        .collection('settings')
        .doc('watchlistLink')
        .get();
  }

  bool hostOk = false;
  bool linkOk = false;
  bool everythingOk = false;
  String host = "";
  String link = "";
  @override
  Widget build(BuildContext context) {
    return Skeleton(
        child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Hostname"),
              FutureBuilder(
                  future: hostname,
                  builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.exists) {
                        Timer(const Duration(milliseconds: 500), () {
                          if (mounted)
                            setState(() {
                              hostOk = true;
                            });
                        });

                        host = (snapshot.data?.data()
                            as Map<String, dynamic>)['hostname'];
                        return Icon(Icons.check, color: Colors.green);
                      } else
                        return Icon(Icons.close, color: Colors.red);
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            ],
          ),
          if (hostOk)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Watchlist Link"),
                FutureBuilder(
                    future: watchlistLink,
                    builder:
                        (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data!.exists) {
                          Timer(const Duration(milliseconds: 500), () {
                            if (mounted)
                              setState(() {
                                linkOk = true;
                              });
                          });

                          link = (snapshot.data?.data()
                              as Map<String, dynamic>)['watchlistLink'];
                          return Icon(Icons.check, color: Colors.green);
                        } else
                          return Icon(Icons.close, color: Colors.red);
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    }),
              ],
            ),
          if (linkOk)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Scrapable"),
                FutureBuilder(
                    future: Scrapper(host).isEverythingOk(link),
                    builder: (context, AsyncSnapshot<bool> snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data!) {
                          Timer(const Duration(milliseconds: 500), () {
                            if (mounted)
                              setState(() {
                                everythingOk = true;
                              });
                          });
                          return Icon(Icons.check, color: Colors.green);
                        } else
                          return Icon(Icons.close, color: Colors.red);
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    }),
              ],
            ),
          ElevatedButton(
              onPressed: hostOk && linkOk && everythingOk
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
    ));
  }
}

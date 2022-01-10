import 'package:be_marvellous_admin/widgets/skeleton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    return Skeleton(
      child: Column(
        children: [
          Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FutureBuilder(
                      future: FirebaseFirestore.instance
                          .collection('settings')
                          .doc('hostname')
                          .get(),
                      builder:
                          (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if (snapshot.hasData) {
                          Map<String, dynamic> data =
                              snapshot.data!.data() as Map<String, dynamic>;
                          return Container(
                            padding: EdgeInsets.all(20.0),
                            child: TextFormField(
                              initialValue: "${data['hostname']}",
                              keyboardType: TextInputType.url,
                              style: TextStyle(color: Colors.red),
                              decoration: InputDecoration(
                                  labelText: 'Hostname',
                                  hintText: "Hostname",
                                  icon: Icon(Icons.domain)),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter scrap hostname';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                setState(() {
                                  loading = true;
                                });
                                firestore
                                    .collection('settings')
                                    .doc('hostname')
                                    .set({
                                  'hostname': value,
                                }).then((value) => {
                                          ScaffoldMessenger.of(context)
                                              .showMaterialBanner(
                                                  MaterialBanner(
                                            backgroundColor: Colors.yellow[100],
                                            actions: [
                                              TextButton(
                                                child: Text('OK'),
                                                onPressed: () {
                                                  ScaffoldMessenger.of(context)
                                                      .hideCurrentMaterialBanner();
                                                },
                                              )
                                            ],
                                            content: Text('Changes saved'),
                                          )),
                                          setState(() {
                                            loading = false;
                                          }),
                                          Future.delayed(
                                              const Duration(seconds: 5),
                                              ScaffoldMessenger.of(context)
                                                  .clearMaterialBanners)
                                        });
                              },
                            ),
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                  FutureBuilder(
                      future: FirebaseFirestore.instance
                          .collection('settings')
                          .doc('watchlistLink')
                          .get(),
                      builder:
                          (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if (snapshot.hasData) {
                          Map<String, dynamic> data =
                              snapshot.data!.data() as Map<String, dynamic>;
                          return Container(
                            padding: EdgeInsets.all(20.0),
                            child: TextFormField(
                              initialValue: "${data['watchlistLink']}",
                              keyboardType: TextInputType.url,
                              style: TextStyle(color: Colors.red),
                              decoration: InputDecoration(
                                  labelText: 'Watchlist Link',
                                  hintText: "Watchlist Link",
                                  icon: Icon(Icons.link)),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter watchlistLink';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                setState(() {
                                  loading = true;
                                });
                                firestore
                                    .collection('settings')
                                    .doc('watchlistLink')
                                    .set({
                                  'watchlistLink': value,
                                }).then((value) => {
                                          ScaffoldMessenger.of(context)
                                              .showMaterialBanner(
                                                  MaterialBanner(
                                            backgroundColor: Colors.yellow[100],
                                            actions: [
                                              TextButton(
                                                child: Text('OK'),
                                                onPressed: () {
                                                  ScaffoldMessenger.of(context)
                                                      .hideCurrentMaterialBanner();
                                                },
                                              )
                                            ],
                                            content: Text('Changes saved'),
                                          )),
                                          setState(() {
                                            loading = false;
                                          }),
                                          Future.delayed(
                                              const Duration(seconds: 5),
                                              ScaffoldMessenger.of(context)
                                                  .clearMaterialBanners)
                                        });
                              },
                            ),
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                          } else {
                            return;
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            loading ? "Saving ..." : "Save",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

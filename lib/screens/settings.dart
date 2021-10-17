import 'package:be_marvellous_admin/widgets/skeleton.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 32.0),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: 32.0,
                ),
                Container(
                    padding: EdgeInsets.all(20.0),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.red),
                      decoration: InputDecoration(
                          hintText: "Username", icon: Icon(Icons.person)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        // username = value!;
                      },
                    )),
                Container(
                    padding: EdgeInsets.all(20.0),
                    child: TextFormField(
                      obscureText: true,
                      style: TextStyle(color: Colors.red),
                      decoration: InputDecoration(
                          hintText: "Password", icon: Icon(Icons.lock)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        // password = value!;
                      },
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(right: 20.0),
                        child: InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Forgot Password?"),
                                    content: Text(
                                        "Oh, you dumbass. Think hard and try to remember your password. \nTake a chill pill. 💊"),
                                  );
                                });
                          },
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(color: Colors.black45),
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                        } else {
                          return;
                        }
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
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 18),
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

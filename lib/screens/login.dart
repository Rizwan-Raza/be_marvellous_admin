import 'package:be_marvellous_admin/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String username = "admin";
    String password = "chutiye";
    Login loginBloc = Provider.of<Login>(context);

    return Scaffold(
      body: Container(
        color: Colors.red[100],
        alignment: Alignment.center,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              height: constraints.maxHeight * .8,
              width: constraints.maxWidth * .8,
              child: Container(
                decoration: new BoxDecoration(boxShadow: [
                  new BoxShadow(
                      blurRadius: 15,
                      color: Colors.red.shade200,
                      spreadRadius: 10,
                      offset: Offset.fromDirection(1, 20)),
                ]),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.white,
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
                                          hintText: "Username",
                                          icon: Icon(Icons.person)),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your username';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        username = value!;
                                      },
                                    )),
                                Container(
                                    padding: EdgeInsets.all(20.0),
                                    child: TextFormField(
                                      obscureText: true,
                                      style: TextStyle(color: Colors.red),
                                      decoration: InputDecoration(
                                          hintText: "Password",
                                          icon: Icon(Icons.lock)),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter your password';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        password = value!;
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
                                                    title: Text(
                                                        "Forgot Password?"),
                                                    content: Text(
                                                        "Oh, you dumbass. Think hard and try to remember your password. \nTake a chill pill. 💊"),
                                                  );
                                                });
                                          },
                                          child: Text(
                                            "Forgot Password",
                                            style: TextStyle(
                                                color: Colors.black45),
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
                                        if (!loginBloc.login(
                                            username, password)) {
                                          ScaffoldMessenger.of(context)
                                              .showMaterialBanner(
                                                  MaterialBanner(
                                            backgroundColor: Colors.yellow[100],
                                            actions: [
                                              TextButton(
                                                child: Text("Close"),
                                                onPressed: () {
                                                  ScaffoldMessenger.of(context)
                                                      .clearMaterialBanners();
                                                },
                                              )
                                            ],
                                            content:
                                                Text("Authetication Failed"),
                                          ));
                                          Future.delayed(
                                              const Duration(seconds: 5),
                                              ScaffoldMessenger.of(context)
                                                  .clearMaterialBanners);
                                        } else {
                                          Navigator.pushReplacementNamed(
                                              context, "/dashboard");
                                        }
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
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(32),
                        color: Colors.red[100],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "ic_launcher-web.png",
                              height: 120,
                            ),
                            SizedBox(height: 32),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                "Be Marvellous",
                                style: TextStyle(
                                    fontSize: 32, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              "Admin Panel",
                              style: TextStyle(
                                color: Colors.red[300],
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text("More info"),
                                          content: Text(
                                            "This panel is specifically for admins, if you are not an admin then please close it and use the app instead. \nIf you are interested to enroll yourself as an admin for Be Marvellous. \nContact RexTerminous for it.",
                                          ),
                                        );
                                      });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.info),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      Text("Show more"),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

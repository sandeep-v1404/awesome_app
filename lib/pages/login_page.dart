import 'package:awesome_app/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changeButton = false;

  final formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("LoginPage"),
        ),
        body: Stack(
          children: [
            Image.asset(
              "assets/code.jfif",
              fit: BoxFit.contain,
              color: Colors.black.withOpacity(0.7),
              colorBlendMode: BlendMode.darken,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                                controller: _usernameController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    hintText: "Enter Email",
                                    labelText: "Username")),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                                controller: _passwordController,
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: "Enter Password",
                                    labelText: "Password")),
                            SizedBox(
                              height: 20,
                            ),
                            // ElevatedButton(
                            //   onPressed: () {
                            //     Constants.prefs.setBool("loggedIn", true);
                            //     // Navigator.push(
                            //     //     context,
                            //     //     MaterialPageRoute(
                            //     //         builder: (context) => HomePage()));
                            //     Navigator.pushReplacementNamed(
                            //         context, HomePage.routeName);
                            //   },
                            //   child: Text("Sign In"),
                            // )
                            InkWell(
                                onTap: () async {
                                  setState(() {
                                    changeButton = true;
                                  });
                                  await Future.delayed(Duration(seconds: 1));
                                  Navigator.pushNamed(
                                      context, MyRoutes.homeRoute);
                                },
                                child: AnimatedContainer(
                                  duration: Duration(seconds: 1),
                                  width: changeButton ? 50 : 100,
                                  height: 50,
                                  alignment: Alignment.center,
                                  child: changeButton
                                      ? Icon(
                                          Icons.done,
                                          color: Colors.white,
                                        )
                                      : Text(
                                          "Login",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurple,
                                      borderRadius: BorderRadius.circular(
                                          changeButton ? 50 : 8)),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

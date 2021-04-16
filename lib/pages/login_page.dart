import 'package:awesome_app/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      Navigator.pushReplacementNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = true;
      });
    }
  }

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
                    key: _formKey,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: _usernameController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Username cannot be empty";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: "Enter Username",
                                  labelText: "Username"),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _passwordController,
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Password cannot be empty";
                                } else if (value.length < 6) {
                                  return "Password length should be atleast 6";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: "Enter Password",
                                  labelText: "Password"),
                            ),
                            SizedBox(
                              height: 40,
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
                            Material(
                              color: Colors.deepPurple,
                              borderRadius:
                                  BorderRadius.circular(changeButton ? 50 : 8),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(
                                    changeButton ? 50 : 8),
                                onTap: () => moveToHome(context),
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
                                ),
                              ),
                            )
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

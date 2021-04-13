import 'package:awesome_app/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  // Widgets App , Material App, Cupertino
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}

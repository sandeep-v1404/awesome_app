import 'package:flutter/material.dart';

void main() {
  // Widgets App , Material App, Cupertino
  runApp(MaterialApp(
    home: HomePage(),
    theme: ThemeData(primarySwatch: Colors.purple),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Awesome App 1"),
      ),
      body: Container(
        child: Text("Hi Flutter"),
      ),
    );
  }
}

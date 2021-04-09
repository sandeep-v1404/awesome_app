import 'package:flutter/material.dart';

void main() {
  // Widgets App , Material App, Cupertino
  runApp(MaterialApp(
    home: HomePage(),
    theme: ThemeData(primarySwatch: Colors.purple),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var myText = "Change My name";
  TextEditingController _nameController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Awesome App 1"),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Card(
            child: Column(
              children: [
                Image.asset(
                  "assets/code.jfif",
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  myText,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter your name",
                          labelText: "Name")),
                )
              ],
            ),
          ),
        ),
      )),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Sandeep"),
              accountEmail: Text("valpasanisandeep@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1480455624313-e29b44bbfde1?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MzJ8fHxlbnwwfHx8&w=1000&q=80"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("I am Sandeep"),
              subtitle: Text("Developer"),
              trailing: Icon(Icons.edit),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("Email"),
              subtitle: Text("valpasanisandeep@gmail.com"),
              trailing: Icon(Icons.edit),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          myText = _nameController.text;
          setState(() {});
        },
        child: Icon(Icons.send),
      ),
    );
  }
}

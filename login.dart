import 'package:firebasedatabase/home.dart';
import 'package:flutter/material.dart';
TextEditingController Usernamecon = new TextEditingController();
String Username;
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Bill Calculator app'),
      ),
      body: Center(
        child: Card(
          elevation: 16.0,
          child: ListView(
            children: [
              ListTile(
                title: Center(child: Text('Bill Calculator')),
              ),
              ListTile(
                title: TextField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    hintText: 'Enter your name',
                  ),
                  controller: Usernamecon,
                ),
              ),
              ListTile(
                trailing: MaterialButton(
                  color: Colors.green,
                  elevation: 8.0,
                  child: Text('Open'),
                  onPressed: (){
                    Username=Usernamecon.text;
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Home();
                    }));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

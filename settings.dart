import 'dart:collection';

import 'package:firebasedatabase/login.dart';
import 'package:firebasedatabase/show.dart';
import 'package:flutter/material.dart';
import 'package:firebasedatabase/home.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
int co=0;
TextEditingController Itemname=TextEditingController();
TextEditingController itemrate=TextEditingController();

final DBreference=FirebaseDatabase.instance.reference();
class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Future showdialog1(BuildContext context,String message)async{
    return showDialog(context: context,
        child: new AlertDialog(
          title: new Text(message),
          content: Text('Please '
              'Click Show and'
              'Delete the Entire Data'),
          actions: [
            new FlatButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('OK'))
          ],
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Card(
          elevation: 16.0,
          child: Container(
            height: MediaQuery.of(context).size.height*0.8,
            width: MediaQuery.of(context).size.width*0.9,
            color: Colors.white60,
            child: ListView(
              children: [
                ListTile(
                  title: Center(child: Text('UserDetails')),
                ),
                ListTile(
                  title: Text('Itemname:'),
                  subtitle: TextField(
                    controller: Itemname,
                  ),
                ),
                ListTile(
                  title: Text('Itemrate'),
                  subtitle: TextField(
                    controller: itemrate,
                  ),
                ),
                ListTile(
                  title:  FlatButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Show();
                    }));
                  }, child: Text('Show')),
                  trailing:
                      FlatButton(
                        child: Text('Save'),
                        onPressed: (){
                          Writedata();
                        },
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Writedata()
  {

    if(co<10)
    {
      if(itemrate.text.isNotEmpty && Itemname.text.isNotEmpty) {
        DBreference.child(Username).push().set({
          'Itemname': Itemname.text,
          'Itemrate': itemrate.text,
        });
        Itemname.clear();
        itemrate.clear();
      }
    }
    else if(co>9)
    {
        showdialog1(context, 'Maximum 10 Items can be Store');
    }
    co++;
  }

}

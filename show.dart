import 'package:firebasedatabase/login.dart';
import 'package:firebasedatabase/settings.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'dart:async';
import 'dart:io' show Platform;


List<int> rate=new List();
List item=new List();
class Show extends StatefulWidget {
  Show({this.app});
  final FirebaseApp app;
  @override
  _ShowState createState() => _ShowState();
}
class _ShowState extends State<Show> {
  final referenceDatabase=FirebaseDatabase.instance;
  DatabaseReference _movieref;
  @override
  void initState() {
    final FirebaseDatabase database = FirebaseDatabase(app: widget.app);
    _movieref = database.reference().child(Username);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final ref=referenceDatabase.reference();
    return Scaffold(
      appBar: AppBar(
        title: Text('Show details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Flexible(
                    child: new FirebaseAnimatedList(
                      shrinkWrap: true,
                      query: _movieref,
                      itemBuilder: (BuildContext context,
                          DataSnapshot snapshot,
                          Animation<double> animation,
                          int index){
                        return new ListTile(
                          title: Row(
                            children: [
                              Text(snapshot.value['Itemname'].toString().toUpperCase(),style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                              SizedBox(width: 20.0,),
                             Text("Rate - ${snapshot.value['Itemrate']}",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          trailing: IconButton(icon: Icon(Icons.delete,),
                            onPressed: (){

                              _movieref.child(snapshot.key).remove();
                            },
                          ),
                        );

                      }
                  ),
                  ),
                  RaisedButton(
                    color: Colors.red,
                    onPressed: (){
                      co=0;
                      referenceDatabase.reference().child(Username).remove();
                    },child: Text('Delete all Data'),)
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

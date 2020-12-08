import 'package:firebasedatabase/result/result.dart';
import 'package:firebasedatabase/settings.dart';
import 'package:firebasedatabase/show.dart';
import 'package:flutter/material.dart';
import 'package:firebasedatabase/home.dart';

import 'login.dart';
 void main()
 {
   runApp(MyApp());
 }
 class MyApp extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       title: 'FlutterDatabase',
       home: Login(),
       routes: {
         '/settings' : (context) => Settings(),
         '/show' : (context) => Show(),
         'result/result' : (context) => Resultbf(),
       },
     );
   }
 }

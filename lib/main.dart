import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:newfirebase/home.dart';

Future<void> main() async {

  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBDeHEx_cf61tweulDXOt152vloTDC4bp0",
          appId: "1:923718910068:android:53ead621b861fa966f1121",
          messagingSenderId: "923718910068",
          authDomain:"my-first-firebase-21626.firebaseapp.com",
          databaseURL: "https://{my-first-firebase-21626}.firebaseio.com",
          projectId: "my-first-firebase-21626")
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
  var screenHight;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: HomePage()
    );
  }
}



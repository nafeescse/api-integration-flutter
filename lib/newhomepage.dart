
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newfirebase/assistant/user_info.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String userName = "";

  @override
  void initState(){
    super.initState();
    getSharedPreferenceData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userName),
      ),
    );
  }

  void getSharedPreferenceData() async {
    UserInfo user = new UserInfo();
    await user.getName().then((value) {
      setState((){
        userName = value;
      });
    });
  }
}

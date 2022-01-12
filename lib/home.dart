import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:newfirebase/newhomepage.dart';
import 'package:newfirebase/assistant/user_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var screenHight;
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  bool ok = false;
  final _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    screenHight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.purple,
      body: Column(
        children: [
          Container(
            height: screenHight * .22,
            color: Colors.purple,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.five_g,
                  color: Colors.white,
                  size: 50,
                ),
                Text(
                  "VISION GO",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            height: screenHight * .78,
            width: MediaQuery.of(context).size.width * 1,
            padding: EdgeInsets.all(25),
            child: Form(
              key: _globalKey,
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hosgeldik", style: TextStyle(fontSize: 35)),
                Row(
                  children: [
                    Text('Not assined yet?', style: TextStyle(fontSize: 15)),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Sign Up Now',
                          style: TextStyle(fontSize: 15, color: Colors.red),
                        ))
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: TextFormField(
                      autovalidate: true,
                      controller: _emailcontroller,
                      autofocus: true,
                      validator: (value) {
                        if (RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value!)) {
                          return null;
                        } else {
                          return "Invalid Email";
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Enter Email',
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(Icons.circle),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: TextFormField(
                      autovalidate: true,
                      controller: _passwordcontroller,
                      autofocus: true,
                      validator: (value) {
                        if (RegExp(
                            r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8}")
                            .hasMatch(value!)) {
                          return null;
                        } else {
                          return "Invalid Password";
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Enter Password',
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(CupertinoIcons.checkmark_alt_circle),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Checkbox(value: ok,
                            onChanged: (val){
                              setState(() {
                                ok =!ok;
                              });
                            }),
                        Text('Remember Me'),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 62),
                      child: TextButton(
                        child: Text('Forget Password?'),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Center(
                      child: MaterialButton(
                        onPressed: () {
                          if(_globalKey.currentState!. validate()){
                            UserInfo user = UserInfo();
                            if(ok){
                              user.saveUserNameToSharedPreference(_emailcontroller.text);
                            }
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                          }
                        },
                        minWidth: MediaQuery.of(context).size.width * 0.4,
                        height: 50,
                        color: Colors.purple,
                        highlightColor: Colors.blue,
                        splashColor: Colors.purple,
                        visualDensity: VisualDensity.compact,
                        elevation: 20,
                        hoverElevation: 20,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Text("SUBMIT", style: TextStyle(color: Colors.white),),
                      )
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(0, 1, 0, 2),
                    child: Center(
                      child: Column(
                        children: [
                          Text('Or Login With'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(onPressed:  () {

                              },
                                icon: Icon(Icons.facebook),  color: Colors.blue,),
                              IconButton(onPressed:  () {

                              },
                                icon: Icon(Icons.facebook),  color: Colors.blue,),
                              IconButton(onPressed:  () {

                              },
                                icon: Icon(Icons.facebook),  color: Colors.blue,),

                            ],
                          )
                        ],
                      ),
                    ))
              ],
            ),)
          ),
        ],
      ),
    );
  }
}

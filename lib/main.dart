/*
      First Page of app
*/
import 'package:flutter/material.dart';
import 'package:flutter_splash_screen/flutter_splash_screen.dart';
import 'Login.dart';
import 'Signup.dart';
import 'HomePage.dart';
import 'ResetPwd.dart';
import 'dart:ui';
import 'dart:async';

void main(){
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new MyApp(),
        routes: {
          '/sinup':(_) => Signup(),
          '/home':(_) => HomePage(),
          '/login':(_) => Login(),
          '/resetpwd':(_) => ResetPwd(),
        },
      )
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    // First 3 sec will display SplashScreen  after 3 sec navigate to login screen

    Timer(
        Duration(seconds: 3),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => Login())));

    return Scaffold(
      backgroundColor: Colors.white,
      body: new Container(
          padding: new EdgeInsets.only(
              left: 20,
              right: 20,
          ),
          child: new Form(
            child: new ListView(
              children: <Widget>[
                  Container(
                    child: Image(
                      image: AssetImage('images/appicon.png'),
                      height: 600.0,
                      width: 600.0,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30,bottom: 0),
                    padding: const EdgeInsets.only(
                      top: 20,
                      bottom: 0,
                    ),
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Text(
                      "H@ckMe",
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w800,
                        fontFamily: "cursive",
                      ),
                    ),
                  ),
                  ),

      ],),
    ),
    ),
    );
  }
}


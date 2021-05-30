/*
      Spinner shows after clicking on login button
*/
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:ui';
import 'dart:async';
import 'HomePage.dart';

class SpinnerLogin extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Timer(
        Duration(seconds: 2),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => HomePage())));

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.lightBlue[50],
          body: Center(child: SpinKitDoubleBounce(color:Colors.lightBlue[900]),)
      ),
    );


  }
}


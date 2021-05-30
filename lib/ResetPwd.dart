/*
        Reset Password Page
*/
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'dart:io';
import 'Login.dart';
import 'Signup.dart';

class ResetPwd extends StatefulWidget{
  @override
  _ResetPwdState createState() =>_ResetPwdState();
}
class _ResetPwdState extends State<ResetPwd>{

  //  To get text from TextField
  TextEditingController textFieldController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;
  String _email="";

  // Method to reset password
  @override
  Future<void> resetPassword(String email, BuildContext context) async {
    var textToSendBack;
    try{
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      sleep(const Duration(seconds:1));
      textToSendBack = textFieldController.text;
      // get the text in the TextField and send it back to the FirstScreen
      Navigator.pop(context, textToSendBack);
    }
    catch(e){
      //  Navigate to signup page because account not exist
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => new Signup()));
    }
  }

  // show Dialog msg when email is null
  void _showcontent(String err) {
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Reset Password Error'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: [
                new Text(err),
              ],
            ),
          ),
          backgroundColor: Colors.lightBlue[50],
          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
          actions: [
            new FlatButton(
              child: new Text('OK'),
              textColor: Colors.lightBlue[900],
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Reset Password"),),
      body: new Container(
        padding: new EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 10
        ),
        child: new Form(
          child: new ListView(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 0, bottom: 0),
                child: Image(
                  image: AssetImage('images/appicon.png'),
                  height: 250.0,
                  width: 250.0,
                ),
              ),
              Container(
                 padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                height: 100.0,
                child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: textFieldController,
                    // Use email input type for emails.
                    style: TextStyle(fontSize: 17.0),
                    decoration: new InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: 'you@example.com',
                      labelText: 'E-mail Address',
                      helperText: "",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Colors.blue[100], width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),

                    ),
                    autofocus: false,
                    onChanged: (value){
                      setState((){
                        _email =value;
                      });
                    }
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                padding: const EdgeInsets.only(
                  left: 100,
                  right: 100,
                ),
                height: 40.0,
                child: RaisedButton(
                  child: Text('Send E-mail'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  elevation: 7.0,
                  onPressed: (){

                    if(_email== null || _email==""){
                    _showcontent("Email can't be NULL");
                    }
                    else if(_email != null) {
                      resetPassword(_email, context);
                    }

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
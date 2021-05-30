import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Signup extends StatefulWidget{
  @override
  _SignupState createState() =>_SignupState();
}
class _SignupState extends State<Signup>{

  final _firestore = Firestore.instance;
  //final _auth = FirebaseAuth.instance;
  String _email="";
  String _password="";
  String _name="";
  String _pnumber="";
  bool _showPassword = false;


  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }


  void _showcontent(String err) {
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Signup Error'),
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
      appBar: AppBar(title: Text("Signup"),),
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
                    keyboardType: TextInputType.text,
                    // Use email input type for emails.
                    style: TextStyle(fontSize: 17.0),
                    decoration: new InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Joy Williams',
                      labelText: 'Name',
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
                        _name =value;
                      });
                    }
                ),
              ),
              Container(
                //margin: const EdgeInsets.only(top: 10.0),
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                height: 100.0,
                child: TextField(
                    keyboardType: TextInputType.number,
                    // Use email input type for emails.
                    style: TextStyle(fontSize: 17.0),
                    decoration: new InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      hintText: '1234567890',
                      labelText: 'Phone Number',
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
                        _pnumber =value;
                      });
                    }
                ),
              ),
              Container(
                //margin: const EdgeInsets.only(top: 10.0),
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                height: 100.0,
                child: TextField(
                    keyboardType: TextInputType.emailAddress,
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
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                height: 100.0,
                child: TextField(
                    style: TextStyle(fontSize: 17.0),
                    autofocus: false,
                    decoration: new InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'Password',
                      suffixIcon: GestureDetector(
                        onTap: () {
                          _togglevisibility();
                        },
                        child: Icon(
                          _showPassword ? Icons.visibility : Icons
                              .visibility_off, color: Colors.grey,),
                      ),
                      labelText: 'Enter your password',
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
                    obscureText: !_showPassword,
                    onChanged: (value){
                      setState((){
                        _password = value;
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
                  child: Text('Sign Up'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  elevation: 7.0,
                  onPressed: (){  //async{
                    FlutterToast.showToast(
                      msg: _email+" "+_password,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.indigo,
                      textColor: Colors.white,
                    );

                    if(_name== null){
                      _showcontent("Name can't be NULL");
                    }
                    else if(_pnumber == null){
                      _showcontent("Password Can't be null");
                    }
                    else if(_name != null && _pnumber!= null) {
                      FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: _email, password: _password)
                          .then((signedInUser) {
                        _firestore.collection('users')
                            .add({
                          'email': _email,
                          'pass': _password,
                          'name': _name,
                          'phone_number': _pnumber,
                          'autologin': false,
                          'notification': true,
                        })
                            .then((value) {
                          if (signedInUser != null) {
                            Navigator.pop(context);
                          }
                        })
                            .catchError((e) {
                          print(e);
                          String errorMessage = e.message;
                          _showcontent(errorMessage);
                        })
                        ;
                      }
                      )
                          .catchError((e) {
                        print(e);
                        String errorMessage = e.message;
                        _showcontent(errorMessage);
                      });
                    }

                    /*try{
                      final newuser =await _auth.createUserWithEmailAndPassword(
                          email: _email,
                          password: _password
                      );
                      if(newuser != null){
                        Navigator.pop(context);
                      }
                    }
                    catch(e){
                      print(e);
                      String errorMessage=e.message;
                      _showcontent(errorMessage);
                    }*/

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
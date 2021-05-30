import 'package:flutter/material.dart';
import 'Signup.dart';
import 'ResetPwd.dart';
import 'HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SpinnerLogin.dart';
import 'package:flutter/scheduler.dart';

class Data {
  static String text;
  static String name;
  static bool notification;
  static bool autologin;
  static var docid;
  static String Uid;
  static String Pwd;

  Data(String s, String n){
    text=s;
    name=n;
  }
}

class SpinData {
  static String classname;
  SpinData(String n){
    classname=n;
  }
}



class Login extends StatefulWidget{

  @override
  _LoginState createState()  => _LoginState();
}
class _LoginState extends State<Login>{

  final _firestore = Firestore.instance;
  String _email="";
  String _password="";
  String _name="";
  bool _showPassword = false;


  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  TextEditingController textController = TextEditingController(text: '');
  TextEditingController textControllerpwd = TextEditingController(text: '');

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
                if(err == "There is no user record corresponding to this identifier. The user may have been deleted.")
                  Navigator.of(context).pushNamed('/sinup');
              },
            ),
          ],
        );
      },
    );
  }


  void _awaitReturnValueFromSecondScreen(BuildContext context) async {

    // start the SecondScreen and wait for it to finish with a result
    String result = await Navigator.of(context).pushNamed('/resetpwd');
    // after the SecondScreen result comes back update the Text widget with it
    setState(() {
      try{
        textController.text = result;
        _email = result;
        textControllerpwd.text = " ";
        _password=" ";
      }
      catch(exception){

      }
    });
  }

  getStringValuesSF() async{
    var prefs = await SharedPreferences.getInstance();
    bool CheckValue = prefs.containsKey('userid');

    if(CheckValue){
      _email = prefs.getString('userid').toString().trim();
      textController.text =_email;
      _password = prefs.getString('password').toString().trim();
      textControllerpwd.text =_password;
    }
    else{
      textController = TextEditingController(text: '');
      textControllerpwd = TextEditingController(text: '');
    }
  }

  initState() {
    super.initState();
    Future.delayed(const Duration(seconds:1), () => getStringValuesSF());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home => center => Text
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('H@ckMe Login'),
          centerTitle: true,
          backgroundColor: Colors.lightBlue[700],
        ),

        body:  SafeArea(
          bottom: false,
          top: false,
          child: new Container(
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
                  //margin: const EdgeInsets.only(top: 10.0),
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  height: 100.0,
                  child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: textController,
                      // Use email input type for emails.
                      style: TextStyle(fontSize: 17.0),
                      decoration: new InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: 'you@example.com',
                        labelText: 'E-mail Address',
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
                    bottom: 0,
                  ),
                  height: 70.0,
                  child: TextField(
                      style: TextStyle(fontSize: 17.0),
                      controller: textControllerpwd,
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
                  padding: const EdgeInsets.only(
                    bottom: 30,
                    //right:0,
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () async{
                        var result = await
                        Navigator.push(context, new MaterialPageRoute(
                            builder: (context) => new ResetPwd())
                        );
                        //Navigator.of(context).pushNamed('/resetpwd');
                        // after the SecondScreen result comes back update the Text widget with it
                        setState(() {
                          textController.text = result;
                        });
                        //Navigator.of(context).pushNamed('/resetpwd');
                        //_awaitReturnValueFromSecondScreen(context);
                      },
                      textColor: Colors.blue,
                      child: Text('Forgot Password?',
                        //textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 100,
                    right: 100,
                  ),
                  height: 40.0,
                  child: RaisedButton(
                    child: Text('Login'),
                    color: Colors.blue,
                    textColor: Colors.white,
                    elevation: 7.0,
                    onPressed: () async{

                      SharedPreferences prefs = await SharedPreferences.getInstance();


                      _firestore.collection("users").getDocuments().then((querySnapshot) {
                        querySnapshot.documents.forEach((result) {
                          print(result.data);
                          if(result.data['email']==_email) {
                            Data.docid=result.documentID;
                            _name = result.data['name'];
                            Data.autologin = result.data['autologin'];
                            Data.notification = result.data['notification'];
                          }
                        });
                      });


                      FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: _email, password: _password)
                          .then((FirebaseUser){

                        final data = Data(_email,_name);
                        //SpinData("Login");
                        //Navigator.of(context).pushReplacementNamed('/home',arguments: data);

                        Data.Uid = _email;
                        Data.Pwd = _password;

                        if(Data.autologin){
                          //add data
                          prefs.setString('userid', Data.Uid);
                          prefs.setString('password', Data.Pwd);
                        }
                        else{
                          //remove data
                          prefs.remove("userid");
                          prefs.remove("password");
                        }

                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => HomePage()));

                      })
                      .catchError((e){
                        print(e);
                        String errorMessage=e.message;
                        _showcontent(errorMessage);
                      });

                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 30,
                    right:30,
                    bottom: 40,
                  ),
                  child: new FlatButton(
                    onPressed: () {
                      Navigator.push(context, new MaterialPageRoute(
                          builder: (context) => new Signup())
                      );
                      //Navigator.of(context).pushNamed('/sinup');
                    },
                    textColor: Colors.blue[400],
                    child: new Text(
                        "Don't have an account? Click Here",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0,)),
                  ),
                ),
              ],
            ),
          ),
        ),
        ),
      ),
    );
  }
}



















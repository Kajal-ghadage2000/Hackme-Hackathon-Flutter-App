import 'package:flutter/material.dart';
import '../Login.dart';
import '../HomePage.dart';
import '../ResetPwd.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class ThirdFragment extends StatelessWidget{
  final _firestore = Firestore.instance;
  var email = Data.text;

  void _awaitReturnValueFromResetPwd(BuildContext context) async {
    // start the SecondScreen and wait for it to finish with a result
    var result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new ResetPwd()),
    );
    // after the SecondScreen result comes back update the Text widget with it
    if(result.length > 0)
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => new Login()));
  }

  createAlertDialogPhone(BuildContext context){
    TextEditingController customController = TextEditingController();
    return showDialog(context: context,builder: (context) {
      return AlertDialog(
        title: Text("Enter your new Phone Number"),
        content: TextField(
          keyboardType: TextInputType.number,
          controller: customController,
        ),
        actions: <Widget>[
          MaterialButton(
            //elevation:5.0,
            child: Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop(customController.text.toString());
            },

          ),

          MaterialButton(
            //elevation:5.0,
            child: Text("submit"),
            onPressed: () async{
              if(customController.text.toString() != "") {
                await _firestore
                    .collection('users')
                    .document(Data.docid)
                    .updateData({'phone_number': customController.text});
              }
              Navigator.of(context).pop(customController.text.toString());

            },

          ),
        ],
      );
    },);
  }

  createAlertDialogPassword(BuildContext context){

    TextEditingController customController = TextEditingController();

    return showDialog(context: context,builder: (context) {
      return AlertDialog(
        title: Text("Enter your new Password"),
        content: TextField(
          controller: customController,
        ),
        actions: <Widget>[
          MaterialButton(
            //elevation:5.0,
            child: Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop(customController.text.toString());
            },

          ),
          MaterialButton(
            //elevation:5.0,
            child: Text("submit"),
            onPressed: () async{

              if(customController.text.toString() != "") {
                await _firestore
                    .collection('users')
                    .document(Data.docid)
                    .updateData({'pass': customController.text});
              }
              Navigator.of(context).pop(customController.text.toString());
              },

          ),

        ],
      );
    },);
  }

  addStringToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if(Data.autologin == true){
      //add data
      prefs.setString('userid', Data.Uid);
      prefs.setString('password', Data.Pwd);
    }
    else{
      //remove data
      prefs.remove("userid");
      prefs.remove("password");
    }
  }

  @override
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner: false;
    return MaterialApp(
      //home => center => Text
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: new AppBar(
          //backgroundColor: Colors.grey[200],
          backgroundColor: Colors.grey[200],
          elevation: 0,
          centerTitle: true,
          title: Text('Settings',
            style: new TextStyle(
              color:  Colors.grey[800],
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: 27,
            ),),
          leading: ClipOval(
            child: Container(
              margin: EdgeInsets.only(top:5.0, left: 5.0),
              child: Material(
                color: Colors.blue, // button color
                child: InkWell(
                  splashColor: Colors.grey, // inkwell color
                  child: SizedBox(width: 56, height: 56, child: Icon(Icons.menu)),
                  onTap: () {Scaffold.of(context).openDrawer();},
                ),
              ),
            ),
          ),
          iconTheme: IconThemeData(
              color: Colors.white
          ),
        ),

        backgroundColor: Colors.grey[200],
        body: new Container(
          //_getDrawerItemWidget(_selectedDrawerIndex),
          padding: new EdgeInsets.only(top: 22.0),
          child: SettingsList(
            sections: [
              SettingsSection(
                title: 'Account',
                tiles: [
                  SettingsTile(
                    title: 'Change Phone Number',
                    leading: Icon(Icons.local_phone, color: Colors.lightBlue[300]),
                    onTap: () {createAlertDialogPhone(context);},
                  ),
                  SettingsTile(
                    title: 'Change Password',
                    leading: Icon(Icons.lock, color: Colors.red[300]),
                    onTap: () {
                      _awaitReturnValueFromResetPwd(context);
                    },
                  ),
                ],
              ),
              SettingsSection(
                title: 'Common Settings',
                tiles: [
                  SettingsTile.switchTile(
                    title: 'Send Notification',
                    leading: Icon(Icons.add_alert, color: Colors.blue[400]),
                    switchValue: Data.notification,
                    onToggle: (bool value)  async{

                      Data.notification = value;
                      await _firestore
                            .collection('users')
                            .document(Data.docid)
                            .updateData({'notification': value});

                    },
                  ),
                  SettingsTile.switchTile(
                    title: 'Auto Login',
                    leading: Icon(Icons.lock_open, color: Colors.green),
                    switchValue: Data.autologin,
                    onToggle: (bool value) async{

                      Data.autologin = value;
                      await _firestore
                          .collection('users')
                          .document(Data.docid)
                          .updateData({'autologin': value});
                      addStringToSF();

                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
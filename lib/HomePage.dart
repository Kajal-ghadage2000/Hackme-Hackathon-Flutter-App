import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'fragments/host_fragment.dart';
import 'fragments/settings_fragment.dart';
import 'fragments/notification_fragment.dart';
import 'fragments/home_fragment.dart';
import 'Login.dart';
import 'main.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Apptitle {
  static String title;
  Apptitle(String s){title=s;}
}


class HomePage extends StatefulWidget{
  @override
  _HomePageState createState()  => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  String _email="";
  String _password="";
  int index = 0;
  var apptitle = new Apptitle("Home");

  List<Widget> list = [
    HackthonFragment(),
    SecondFragment(),
    ThirdFragment(),
  ];

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      //home => center => Text
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.lightBlue[50],
        /*appBar: AppBar(
          centerTitle: true,
          title: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                color: Colors.blue,
              ),
              Text(
                Apptitle.title,
              ),
            ],
          ),
        ),*/
        body: list[index],
        drawer: MyDrawer(onTap: (ctx, i){
          setState((){
            index=i;
            Navigator.pop(ctx);
          });
          },),
      ),
    );
  }
}


class MyDrawer extends StatelessWidget{

  final Function onTap;
  MyDrawer({
    this.onTap
});

  @override
  Widget build(BuildContext context) {

    //get the first and last initial/character from a name string
    String getInitials(String bank_account_name) => bank_account_name.isNotEmpty
        ? bank_account_name.trim().split(' ').map((l) => l[0]).take(2).join()
        : '';

    String f_name=getInitials(Data.name);

    return SizedBox(
      width: MediaQuery.of(context).size.width*0.8,
      child: Drawer(
            child: new Form(
                child: new ListView(
                  children: <Widget>[
                    DrawerHeader(
                      decoration: BoxDecoration(color: Colors.blue, image: DecorationImage(
                      image: AssetImage("images/d.jpeg"),
                      fit: BoxFit.cover)),
                          child: Padding(
                            padding: EdgeInsets.all(6),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                /*Container(
                                  width: 60,
                                  height: 60,
                                  //color: Colors.lightBlue[400],
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage("images/profile.png"),
                                    ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),*/
                                CircleAvatar(
                                  backgroundColor:
                                  Theme.of(context).platform == TargetPlatform.android
                                      ? Colors.white
                                      : Colors.blue,
                                  radius: 27.0,
                                  child: Text(
                                    f_name.toUpperCase(),
                                    style: TextStyle(fontSize: 28.0),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  Data.name,
                                  style: TextStyle(
                                    fontSize:17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  Data.text,
                                  style: TextStyle(
                                    fontSize:16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ListTile(
                          leading: Icon(Icons.home, color: Colors.blue),
                          title: Text('Home'),
                          onTap: (){
                            Apptitle.title="Home";
                            onTap(context,0);
                            },
                        ),
                    ListTile(
                          leading: Icon(Icons.laptop, color: Colors.lightBlue[300]),
                          title: Text('Host Event'),
                          onTap: (){
                            Apptitle.title="Host Event";
                            onTap(context,1);
                          },
                        ),
                    ListTile(
                          leading: Icon(Icons.add_alert, color: Colors.lightBlue),
                          title: Text('Notification'),
                          onTap: (){
                            Apptitle.title="Notification";
                            onTap(context,2);
                          },
                        ),
                    ListTile(
                          leading: Icon(Icons.settings, color: Colors.lightBlue[300]),
                          title: Text('Settings'),
                          onTap: (){
                            Apptitle.title="Settings";
                            onTap(context,2);
                          },
                        ),
                    Divider(height: 8,),
                    ListTile(
                          leading: Icon(Icons.exit_to_app, color: Colors.red[300]),
                          title: Text('Logout'),
                          onTap: (){
                            Navigator.pop(context);
                            Navigator.pushReplacement(context,MaterialPageRoute(builder: (_) => new Login()));
                            },
            ),
          ],
        ),

    ),),
    );
  }
}
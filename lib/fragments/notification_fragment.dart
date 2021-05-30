/*
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class NotificationFragment extends StatefulWidget {
  final String title = 'Firebase Messaging Demo';
  @override
  _NotificationFragmentState createState() => new _NotificationFragmentState();
}

class _NotificationFragmentState extends State<NotificationFragment> {

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final firestoreInstance = Firestore.instance;
  List events = [];

  _getToken() {
    _firebaseMessaging.getToken().then((deviceToken) {
      print("Device Token:$deviceToken");
    });
  }

  Future getPosts() async {
    return await firestoreInstance
        .collection("Notifications")
        .orderBy('created', descending: false)
        .getDocuments();
  }

  _configureFirebaseListeners() {
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('onMessage: $message');
        _setMessage(message);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('onLaunch: $message');
        _setMessage(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print('onResume: $message');
        _setMessage(message);
      },
    );
  }

  _setMessage(Map<String, dynamic> message) async {
    print("hello2");
    final data = message['data'];
    var date = new DateTime.now().toString();
    var dateParse = DateTime.parse(date);
    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
    dynamic currentTime = DateFormat.jm().format(DateTime.now());
    firestoreInstance.collection("Notifications").add({
      "name": data,
      "date": formattedDate,
      "time": currentTime,
      "created": FieldValue.serverTimestamp()
    }).then((value) {
      print(value.documentID);
    });
  }

  void initState() {
    super.initState();

    _getToken();

    _configureFirebaseListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horizontal ListView'),
      ),
      body: Column(
        children: [
          Text("Notifications",
              style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2,
                  color: Colors.grey[90])),
          SizedBox(
            height: 10.0,
          ),
          SizedBox(
            height: 0.0,
            width: 50.0,
            child: Divider(
              color: Colors.black54,
            ),
          ),
          Expanded(
            child: Container(
              child: FutureBuilder(
                future: getPosts(),
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: Container(
                            color: Colors.lightBlue[50],
                            child: Center(
                                child: Center(
                                  child: Text("loading...."),
                                ))));
                  } else {
                    return GroupedListView(
                      groupBy: (element) => element['date'],
                      elements: snapshot.data.documents,
                      order: GroupedListOrder.DESC,
                      groupSeparatorBuilder: (var value) => Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Center(
                          child: Text(
                            value,
                            style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 2,
                                color: Colors.grey[800]),
                          ),
                        ),
                      ),
                      itemBuilder: (c, element) {
                        return Card(
                          elevation: 8.0,
                          margin: new EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 6.0),
                          child: Container(
                            child: Column(children: [
                              ListTile(
                                title: Center(
                                  child: SafeArea(
                                    child: Row(children: [
                                      Text(
                                        element['name']['titleName'],
                                        style: GoogleFonts.inter(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w800,
                                            letterSpacing: 2,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Flexible(
                                        fit: FlexFit.loose,
                                        child: Icon(
                                          Icons.open_in_new,
                                          size: 18,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ]),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 0.0,
                                width: 50.0,
                                child: Divider(
                                  color: Colors.red,
                                ),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 5.0),
                                leading: ImageIcon(
                                    AssetImage("images/name.png"),
                                    size: 25,
                                    color: Colors.blue),
                                title: Text(element['name']['message'],
                                    style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 2,
                                        color: Colors.grey[800])),
                                trailing: Text(element['time'],
                                    style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 2,
                                        color: Colors.grey)),
                              ),
                            ]),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}




class Message {
  String title;
  String body;
  String message;
  String location;
  String enddate;
  String startdate;
  String time;
  var date;
  Message(title, body, message, location, startdate, enddate, date, time) {
    this.title = title;
    this.body = body;
    this.message = message;
    this.location = location;
    this.enddate = enddate;
    this.startdate = startdate;
    this.date = date;
    this.time = time;
  }
}


 */
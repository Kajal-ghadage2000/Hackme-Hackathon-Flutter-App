import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import '../host_fragment.dart';
import '../home_fragment.dart';
import '../../Homepage.dart';
import '../../DatabaseService.dart';
import '../../WebScreen.dart';

class ModelWebinar {
  var key;
  String name;
  String typeofeven;
  String date;
  String time;
  String url;

  ModelWebinar({this.name, this.typeofeven, this.date, this.time, this.url, this.key});

}

class Webinars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner: false;
    return Scaffold(
      body: ListPage(),
      backgroundColor: Colors.grey[200],
    );
  }
}

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  final GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  TextEditingController controller = new TextEditingController();
  List<ModelWebinar> _needs=[];
  List<ModelWebinar> _filteredneeds=[];
  String filter;

  @override
  initState() {
    super.initState();
    Apptitle.title = "Webinars & Workshops";
    getPosts();
  }

  Future getPosts() async {
    var _firestore = Firestore.instance;
    ModelWebinar modelWebinar;
    await _firestore.collection("Webinar-Events").getDocuments().then((
        querySnapshot) {
      querySnapshot.documents.forEach((result1) {
        modelWebinar = new ModelWebinar(
          name: result1.data['name'],
          typeofeven: result1.data['typeofeven'],
          time: result1.data['time'],
          date: result1.data['date'],
          url: result1.data['url'],
          key: result1.documentID,
        );
        _needs.add(modelWebinar);
        _filteredneeds.add(modelWebinar);
      });
    });
  }

  Future<Null> refreshList() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      getPosts();
    });
  }

  void filterdatafun(value)
  {
    print(_needs.where(
            (ModelWebinar) => ModelWebinar.name.toLowerCase().contains(value)
    ).toList());

    setState(() {
      _filteredneeds=[];
      _filteredneeds =
          _needs.where(
                  (ModelWebinar) => ModelWebinar.name.toLowerCase().contains(value.toLowerCase())
          ).toList();
    });
    _filteredneeds = _filteredneeds.toSet().toList();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  var AppBar = new Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Expanded(
        child: new Padding(
          padding: const EdgeInsets.only(left: 3.0, right: 3.0, bottom: 15.0),
          child: Text('Webinars & Workshops',
              textAlign: TextAlign.center,
            style: new TextStyle(
              color:  Colors.grey[800],
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: 25,
            ),
          ),
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Container(

      child: FutureBuilder(
          future: getPosts(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: Container(
                    //color: Colors.lightBlue[50],
                      child: Center(
                          child: Center(
                            child: SpinKitFadingCircle(color: Colors.black),
                          ))));
            } else {
              return RefreshIndicator(

                child: new Column(
                  children: <Widget>[

                    AppBar,

                    Padding(padding: EdgeInsets.only(left: 20, right:20, bottom:10),
                      child: new TextField(
                        onSubmitted: (value){
                          filterdatafun(value);
                        },
                        style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 1.5),
                        maxLines: 1,
                        controller: controller,
                        decoration: new InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.clear();
                              _filteredneeds =_needs;
                            },
                            icon: Icon(Icons.clear),
                          ),
                          hintText: "Search by Name",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(25.0)),
                            borderSide: BorderSide(
                                color: Colors.blue[400], width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(23.0)),
                            borderSide: BorderSide(color: Colors.blue[400]),
                          ),
                        ),
                      ),
                    ),

                    new Expanded(child: ListView.builder(
                        itemCount: _filteredneeds.length,
                        itemBuilder: (_, index) {
                          //return UI(list[index].name, list[index].location, list[index].enddate, list[index].startdate, list[index].url);
                          return Card(
                            color: Colors.grey[100],
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.white70,
                                  width: 1
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin: new EdgeInsets.symmetric(
                                horizontal: 15.0,
                                vertical: 10.0
                            ),
                            child: InkWell(
                              splashColor: Colors.blue[900],
                              onTap: () {
                                Data1.text = _filteredneeds[index].url;
                                Data1.title = _filteredneeds[index].name;
                                Data1.event = _filteredneeds[index].typeofeven;
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        WebScreen(_filteredneeds[index].url)));
                              },
                              child: Column(children: [
                                Center(
                                  child: ListTile(
                                    title: Center(
                                      child: SafeArea(
                                        child: Row(children: [
                                          Flexible(
                                            child: Text(
                                              _filteredneeds[index].name,
                                              style: TextStyle(letterSpacing: 2.5),
                                              softWrap: true,
                                              maxLines: 2, // new line
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ]),
                                      ),
                                    ),
                                    trailing:IconButton(
                                      icon: Icon(
                                        Icons.event,
                                        size: 20.0,
                                        //color: Colors.blueGrey[400],
                                      ),
                                      onPressed: () {

                                        DateTime start = DateTime.parse("${_filteredneeds[index].date} 05:30:00").toLocal();
                                        DateTime end = DateTime.parse("${_filteredneeds[index].date} 29:00:00").toLocal();
                                        var mytitle = "H@ckMe Workshop/Webinar- ${_filteredneeds[index].name}";

                                        Event event = Event(
                                          title: mytitle,
                                          description: _filteredneeds[index].url,
                                          location: "Online",
                                          startDate: start,
                                          endDate: end,
                                          allDay: false,
                                        );

                                        Add2Calendar.addEvent2Cal(event).then((success) {
                                          scaffoldState.currentState.showSnackBar(
                                              SnackBar(content: Text(success ? 'Success' : 'Error')));
                                        });

                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 3.0,
                                  width: 50.0,
                                  child: Divider(
                                    color: Colors.red[900],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 20.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_today,
                                        size: 18,
                                        color: Colors.grey[700],
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        ' ${_filteredneeds[index].date}',
                                        style: TextStyle(
                                            letterSpacing: 2, fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 20.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.timer,
                                        size: 18,
                                        color: Colors.grey[700],
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        ' ${_filteredneeds[index].time} ',
                                        style: TextStyle(
                                            letterSpacing: 2, fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 20.0),
                                  child: Row(
                                    children: [
                                      Icon( //chevron_right ,local_activity, developer_board, dashboard
                                        Icons.developer_board,
                                        size: 18,
                                        color: Colors.grey[700],
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        _filteredneeds[index].typeofeven,
                                        style: TextStyle(
                                            letterSpacing: 2,
                                            fontSize: 12,
                                            color: Colors.lightGreen[900]),
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          );
                        }),),

                  ],

                ),
                onRefresh: refreshList,
              );
            }
          }),
    );
  }
}



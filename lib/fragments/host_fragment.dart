import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../WebScreen.dart';
import '../HomePage.dart';


//webview
class Data1 {
  static String text;
  static String title;
  static String event;
  Data1(String s){
    text=s;
  }
}

class SecondFragment extends StatefulWidget {
  SecondFragment({Key key}) : super(key: key);

  @override
  _SecondFragmentState createState() => new _SecondFragmentState();
}

class _SecondFragmentState extends State<SecondFragment> {


  bool _loadingInProgress;
  var data = Data1("text");

  @override
  void initState() {
    super.initState();
    _loadingInProgress = true;
    _loadData();
    Data1.event = "Website to Host Event";
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: _buildBody(),
    );
  }


  Widget _buildBody() {
    if (_loadingInProgress) {
      return new Center(
        child: SpinKitFadingCircle(color: Colors.black),
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          drawer: MyDrawer(),
          appBar: new AppBar(
            //backgroundColor: Colors.grey[200],
            backgroundColor: Colors.grey[200],
            elevation: 0,
            centerTitle: true,
            title: Text('Host Event',
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
          body: ListView(
            children: <Widget>[
              /*Container(
                child: Text('Host Event',
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    color:  Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 27,
                  ),
                ),
              ),*/
              SizedBox(
                height: 20.0,
              ),
              Container(
                margin:EdgeInsets.only(left: 15.0, right: 15.0),
                child: Card(
                  //https://www.hackerearth.com/community-hackathons/
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: InkWell(
                    onTap: () {
                      Data1.text="https://www.hackerearth.com/community-hackathons/";
                      Data1.title="hackerearth";
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WebScreen(Data1.text)),
                      );
                      print("hbhjbj");
                    },
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                            ),
                            child: Image.network(
                                'https://www.hackerearth.com/community-hackathons/wp-content/themes/hacker-earth/assets/images/logo/HE_logo_pride.png',
                                width: 200,
                                height: 50,
                                fit:BoxFit.fill
                            ),
                          ),),
                        ListTile(
                          title: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Text('__________',
                              textAlign: TextAlign.center,
                              style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.blue[900],),// backgroundColor: Colors.white),
                            ),),
                          subtitle: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Text('Hackerearth help you put your coding skills to work. Solve interesting business problems and real-world challenges.',
                              textAlign: TextAlign.justify,
                              style: new TextStyle(fontSize: 15.0,  letterSpacing:1.5,color: Colors.grey[700],),),
                          ),),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                margin:EdgeInsets.only(left: 15.0, right: 15.0),
                child: Card(
                  //https://mlh.io/event-membership
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: InkWell(
                    onTap: () {
                      Data1.text="https://mlh.io/event-membership";
                      Data1.title="MLH";
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WebScreen(Data1.text)),
                      );
                      print("hbhjbj");
                    },
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                            ),
                            child: Image.network(
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/Mlh-logo-color.svg/1200px-Mlh-logo-color.svg.png',
                                width: 200,
                                height: 50,
                                fit:BoxFit.fill
                            ),
                          ),
                        ),
                        ListTile(
                          title: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Text('__________',
                              textAlign: TextAlign.center,
                              style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.blue[900],),// backgroundColor: Colors.white),
                            ),),
                          subtitle: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Text('Major League Hacking, officially abbreviated as MLH, is a company that operates a league for student hackathons.',
                              textAlign: TextAlign.justify,
                              style: new TextStyle(fontSize: 15.0,  letterSpacing:1.5  ,color: Colors.grey[700],),),
                          ),),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                margin:EdgeInsets.only(left: 15.0, right: 15.0),
                child: Card(
                  //https://org.devfolio.co/
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: InkWell(
                    onTap: () {
                      Data1.text="https://org.devfolio.co/signin";
                      Data1.title="Devfolio";
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WebScreen(Data1.text)),
                      );
                      print("hbhjbj");
                    },
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child:ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                            ),
                            child: Image.network(
                                'https://gblobscdn.gitbook.com/spaces%2F-LX2wpUXI1eWMY46nkHR%2Favatar-rectangle.png?alt=media',
                                width: 200,
                                height: 50,
                                fit:BoxFit.fill
                            ),
                          ),
                        ),
                        ListTile(
                          title: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Text('__________',
                              textAlign: TextAlign.center,
                              style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.blue[800],),// backgroundColor: Colors.white),
                            ),),
                          subtitle: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Text('Devfolio provides a platform for event coordinators to publish their hackathon events, and for participants to register and manage their profile across various events.',
                              textAlign: TextAlign.justify,
                              style: new TextStyle(fontSize: 15.0,  letterSpacing:1.5  ,color: Colors.grey[700],),),
                          ),),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                margin:EdgeInsets.only(left: 15.0, right: 15.0),
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: InkWell(

                    onTap: () {
                      Data1.text="https://www.eventbrite.com/manage/events/create";
                      Data1.title="Eventbrite";
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WebScreen(Data1.text)),
                      );
                      //print("hbhjbj");
                    },

                    child: Column(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                          child: Image.network(
                              'https://static-assets.technologyevaluation.com/SoftwareImages/0/0B/0B3E2A6CFAB584747115DE77BBF3AB7AEA322832/logo1.png',
                              width: 200,
                              height: 70,
                              fit:BoxFit.fill
                          ),
                        ),
                        ListTile(
                          //https://www.eventbrite.com/manage/events/create
                          title: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                            child: Text('__________',
                              textAlign: TextAlign.center,
                              style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,  color: Colors.blue[900],),
                            ),),
                          subtitle: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Text('Eventbrite regularly lists a number of engaging hackathons and challenges in various global destinations. If you search by city, you can find a good mix of upcoming tech conferences, hackathons and classes.',
                              textAlign: TextAlign.justify,
                              style: new TextStyle(fontSize: 15.0, letterSpacing:1.5, color: Colors.grey[700],),),
                          ),),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                margin:EdgeInsets.only(left: 15.0, right: 15.0),
                child: Card(
                  //https://codingame.typeform.com/to/LciOHS
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: InkWell(
                    onTap: () {
                      Data1.text="https://codingame.typeform.com/to/LciOHS";
                      Data1.title="Codingame For Work";
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WebScreen(Data1.text)),
                      );
                      print("hbhjbj");
                    },
                    child: Column(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                          child: Image.network(
                              'https://w1.codingame.com/work/wp-content/uploads/2020/03/logo-codingame-for-work.png',
                              width: 200,
                              height: 50,
                              fit:BoxFit.fill
                          ),
                        ),
                        ListTile(
                          title: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Text('__________',
                              textAlign: TextAlign.center,
                              style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.blue[900],),// backgroundColor: Colors.white),
                            ),),
                          subtitle: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Text('CodinGame is a challenge-based training platform for programmers where you can improve your coding skills with fun exercises.',
                              textAlign: TextAlign.justify,
                              style: new TextStyle(fontSize: 15.0,  letterSpacing:1.5  ,color: Colors.grey[700],),),
                          ),),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                margin:EdgeInsets.only(left: 15.0, right: 15.0),
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: InkWell(
                    onTap: () {
                      Data1.text="http://hackathonsnear.me/";
                      Data1.title="Hackathons Near Me";
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WebScreen(Data1.text)),
                      );
                      print("hbhjbj");
                    },
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                            ),
                            child: Image.network(
                                'http://hackathonsnear.me//img/logo.png?v2',
                                width: 200,
                                height: 50,
                                fit:BoxFit.fill
                            ),
                          ),
                        ),
                        ListTile(
                          title: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Text('__________',
                              textAlign: TextAlign.center,
                              style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.blue[900],),// backgroundColor: Colors.white),
                            ),),
                          subtitle: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Text('Hackathons Near Me specialises in letting programmers find hackathons in specific geographical areas. This includes both country and city, allowing people to really hone in on local, smaller scale events.',
                              textAlign: TextAlign.justify,
                              style: new TextStyle(fontSize: 15.0, letterSpacing:1.5  ,color: Colors.grey[700],),),
                          ),),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }


  Future _loadData() async {
    await new Future.delayed(new Duration(seconds: 2));
    _dataLoaded();
  }

  void _dataLoaded() {
    setState(() {
      _loadingInProgress = false;
    });
  }
}
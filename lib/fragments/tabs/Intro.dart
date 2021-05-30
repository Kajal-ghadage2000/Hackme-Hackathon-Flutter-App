import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import '../host_fragment.dart';
import '../../Homepage.dart';
import '../../Login.dart';
import '../../DatabaseService.dart';
import '../../WebScreen.dart';
import '../../ModelClass.dart';
import '../../Choice.dart';
import 'package:flutter_svg/svg.dart';

class All extends StatefulWidget{
  @override
  _AllState createState()  => _AllState();
}
class _AllState extends State<All> {

  double kDefaultPadding = 20.0;

  final List<String> numbers = [
    "images/lang/AI.png",
    "images/lang/cpp.png",
    "images/lang/big_data.png",
    "images/lang/cprog.png",
    "images/lang/ml.png",
    "images/lang/c#.png",
    "images/lang/data_analysis.png",
    "images/lang/data_science.jpg",
    "images/lang/html.png",
    "images/lang/java.png",
    "images/lang/js.png",
    "images/lang/python.png",
    "images/lang/software_e.png",
    "images/lang/sql.png",
  ];

  List<Choice> choices = const <Choice>[
    const Choice( title: '50+ Skills to Learn & Practice', description: 'From basic coding fundamentals to Java and AI, there are 300+ tests to learn, practice and compete in.', imglink:"images/icon_home1.png"),
    const Choice(title: 'Improve Yourself. Get Noticed', description: 'Participation increases your Skill Quotient, which can be seen by fellow developers and potential employers.', imglink:"images/icon_home2.png"),
    const Choice(title: 'Compete. Get Hired', description: 'Compete in over 300 challenges from top IT companies to win prizes or even get hired.', imglink:"images/icon_home3.png"),
    ];

  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKey1 = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        bottom: false,
        top: false,
        child: Column(

          children: <Widget>[

            Container(
              height: size.height * 0.2,

              child: Stack(

                children: <Widget>[
                  Container(

                    padding: EdgeInsets.only(
                      left: kDefaultPadding,
                      right: kDefaultPadding,
                      bottom: 36 + kDefaultPadding,
                    ),

                    height: size.height * 0.2 - 30,

                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(46),
                        bottomRight: Radius.circular(46),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Hi, '+ Data.name +"!",
                          style: Theme.of(context).textTheme.headline5.copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        //Image.asset("images/appicon.png")
                      ],
                    ),
                  ),],
              ),),

            Container(
              height: size.height * 0.5 + 100,
              child: new ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                padding: const EdgeInsets.only(
                  left: 15,
                  top: 0,
                  right: 15,
                ),
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(
                      top: 5,
                      bottom: 20,
                    ),
                    child: RichText(
                      text: TextSpan(
                          style: Theme.of(context).textTheme.body1.copyWith(fontSize: 22, ),
                          children: [
                            TextSpan(
                                text: 'Unique Platform* ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:  Colors.red,
                                )
                            ),
                            TextSpan(
                              text: 'to be part of ',
                            ),
                            TextSpan(
                                text: 'Hackthons, Coding Challenges, Webinars and Workshops. ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:  Colors.indigoAccent,
                                )
                            ),
                            TextSpan(
                              text: 'Best Platform for participating in',
                            ),
                            TextSpan(
                                text: ' Competitive Programming',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:  Colors.red,
                                )
                            ),
                          ]
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      top: 15,
                      bottom: 15,
                    ),
                    child: FlipCard(
                      key: cardKey,
                      flipOnTouch: false,
                      front: Container(
                        height: 90,
                        child: RaisedButton(
                          color: Colors.white,
                          onPressed: () => cardKey.currentState.toggleCard(),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text('For Developers',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  )
                              ),
                              new Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(Icons.arrow_forward_ios),
                                ],),
                              Text('Community',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    color:  Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      back: Container(
                        height: 90,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.green, Colors.blue])
                        ),
                        child: RaisedButton(
                          color: Colors.white,
                          onPressed: () => cardKey.currentState.toggleCard(),
                          child: Text('Practice programming, prepare for interviews, and level up your coding skills with a community of developers.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 15,
                            ),),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      bottom: 7,
                    ),
                    child: FlipCard(
                      key: cardKey1,
                      flipOnTouch: false,
                      front: Container(
                        height: 100,
                        child: RaisedButton(
                          color: Colors.white,
                          onPressed: () => cardKey1.currentState.toggleCard(),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text('For Businesses',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  )
                              ),
                              new Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(Icons.arrow_forward_ios),
                                ],),
                              Text('Hackathons',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  color:  Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      back: Container(
                        height: 120,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.green, Colors.blue])
                        ),
                        child: RaisedButton(
                          color: Colors.white,
                          onPressed: () => cardKey1.currentState.toggleCard(),
                          child: Text('Host virtual hackathons and bring together people with diverse skills and solve business challenges.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 15,
                            ),),
                        ),
                      ),
                    ),

                  ),
                  Container(
                    height: 380.0,
                    child: new ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(bottom: 35.0),
                      children: List.generate(choices.length, (index) {
                        return Center(
                          child: ChoiceCard(choice: choices[index], item: choices[index]),
                        );
                      }
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text('Skills',
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            color:  Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 100.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 2.0,right: 2.0, bottom: 2.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: numbers.length, itemBuilder: (context, index) {
                        return Container(
                          height: 90,
                          width: 90,
                          child: Card(
                            color: Colors.white,
                            child: Container(
                              child: Center(child: Image.asset(numbers[index],
                                width: 75.0,
                                height: 75.0,
                                fit: BoxFit.cover,),
                              ),
                            ),),);},),),),
                ],),),

          ],),

      ),
    );
  }
}

/*
class All extends StatelessWidget {
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
  List<Model> _needs=[];
  List<Model> _filteredneeds=[];
  String filter;

  // List<Model> _needs = [];
  /*@override
  void initState() {
    super.initState();
    _setupNeeds();
  }

  _setupNeeds() async {
    List<Model> needs = await DatabaseService.getModels();
    print(_needs.length);
    setState(() {
      _needs = needs;
    });
  }*/

  @override
  initState() {
    super.initState();
    Apptitle.title = "Home";
    getPosts();
  }

  Future getPosts() async {
    var _firestore = Firestore.instance;
    Model model;
    await _firestore.collection("Hackthon-Events").getDocuments().then((
        querySnapshot) {
      querySnapshot.documents.forEach((result) {
        model = new Model(
          name: result.data['name'],
          location: result.data['location'],
          enddate: result.data['enddate'],
          startdate: result.data['startdate'],
          url: result.data['url'],
          key: result.documentID,
        );
        _needs.add(model);
        _filteredneeds.add(model);
      });
      //return _needs;
      /*setState(() {
        //filter = controller.text;
      });*/
    });
  }

  Future<Null> refreshList() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      getPosts();
    });
    //return null;
  }

  void filterdatafun(value)
  {
    print(_needs.where(
            (Model) => Model.name.toLowerCase().contains(value)
    ).toList());

    setState(() {
      _filteredneeds=[];
      _filteredneeds =
          _needs.where(
                  (Model) => Model.name.toLowerCase().contains(value.toLowerCase())
          ).toList();
    });
    _filteredneeds = _filteredneeds.toSet().toList();
  }
  /*
  Future loadData async()
  {
    Model model;
    _firestore.collection("Hackthon-Events").getDocuments().then((
        querySnapshot) {
      querySnapshot.documents.forEach((result) {
        model = new Model(
          name: result.data['name'],
          location: result.data['location'],
          enddate: result.data['enddate'],
          startdate: result.data['startdate'],
          url: result.data['url'],
          key: result.documentID,
        );
        _needs.add(model);
      });
      return _needs;
      /*setState(() {
        //filter = controller.text;
      });*/
    });
  }

  Future<Null> _getData() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      loadData();
    });
    return null;
  }
*/
  /* List<Item> Remedios = List();
  Item item;
  DatabaseReference itemRef;
  String filter;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    item = Item("", "");
    final FirebaseDatabase database = FirebaseDatabase.instance; //Rather then just writing FirebaseDatabase(), get the instance.
    itemRef = database.reference().child('Hackthon-Events');
    itemRef.onChildAdded.listen(_onEntryAdded);
    itemRef.onChildChanged.listen(_onEntryChanged);
    controller.addListener(() {
      setState(() {
        filter = controller.text;
      });
    });
  }

  _onEntryAdded(Event event) {
    setState(() {
      Remedios.add(Item.fromSnapshot(event.snapshot));
    });
  }

  _onEntryChanged(Event event) {
    var old = Remedios.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });
    setState(() {
      Remedios\[Remedios.indexOf(old)\] = Item.fromSnapshot(event.snapshot);
    });
  }

  void handleSubmit() {
    final FormState form = formKey.currentState;

    if (form.validate()) {
      form.save();
      form.reset();
      itemRef.push().set(item.toJson());
    }
  }*/


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
/*
    Future getPosts() async {
      var firestore = Firestore.instance;
      QuerySnapshot qn =
      await firestore.collection("Hackthon-Events").getDocuments();
      //print("heee");

      return qn.documents;
    }

    Future<Null> refreshList() async {
      await Future.delayed(Duration(seconds: 2));
      setState(() {
        getPosts();
      });
      return null;
    }
*/

  var AppBar = new Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Expanded(
        child: new Padding(
          padding: const EdgeInsets.only(left: 3.0, right: 3.0, bottom: 10.0),
          child: Text('Home',
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

    /* Widget UI(String name, String location, String enddate, String startdate, String url)
      {
        return Card(
          color: Colors.grey[100],
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: Colors.white70, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          margin: new EdgeInsets.symmetric(
              horizontal: 15.0, vertical: 10.0),
          child: InkWell(
            splashColor: Colors.blue[900],
            onTap: () {
              Data1.text = url;
              Data1.title = name;
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      WebScreen(url)));
            },
            child: Column(children: [
              Center(
                child: ListTile(
                    title: Center(
                      child: SafeArea(
                        child: Row(children: [
                          Text(
                            name,
                            style: TextStyle(
                                letterSpacing: 2.5),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Flexible(
                            fit: FlexFit.loose,
                            child: Icon(
                              Icons.open_in_new,
                              size: 18,
                              color: Colors.blue[700],
                            ),
                          ),
                        ]),
                      ),
                    )),
              ),
              SizedBox(
                height: 0.0,
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
                      ' ${startdate} to ${enddate} ',
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
                      Icons.add_location,
                      size: 18,
                      color: Colors.grey[700],
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      location,
                      style: TextStyle(
                          letterSpacing: 2,
                          fontSize: 12,
                          color: Colors.lightGreen[900]),
                    )
                  ],
                ),
              )
            ]),
          ),
        );
      }*/

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
                    Padding(padding: EdgeInsets.all(15.0),
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
                          hintText: "Search by Name or Location",
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
                      ),),
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
                                Data1.event = "challenges";
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
                                          Text(
                                            _filteredneeds[index].name,
                                            style: TextStyle(
                                                letterSpacing: 2.5),
                                          ),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          Flexible(
                                            fit: FlexFit.loose,
                                            child: Icon(
                                              Icons.open_in_new,
                                              size: 18,
                                              color: Colors.blue[700],
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

                                        DateTime start = DateTime.parse("${_filteredneeds[index].startdate} 05:30:00").toLocal();
                                        DateTime end = DateTime.parse("${_filteredneeds[index].enddate} 29:00:00").toLocal();
                                        var mytitle = "H@ckMe - ${_filteredneeds[index].name}";

                                        Event event = Event(
                                          title: mytitle,
                                          description: _filteredneeds[index].url,
                                          location: _filteredneeds[index].location,
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
                                  height: 0.0,
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
                                        ' ${_filteredneeds[index].startdate} to ${_filteredneeds[index].enddate} ',
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
                                        Icons.add_location,
                                        size: 18,
                                        color: Colors.grey[700],
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        _filteredneeds[index].location,
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
                  ],),
                onRefresh: refreshList,
              );
            }
          }),
    );
  }
}
*/


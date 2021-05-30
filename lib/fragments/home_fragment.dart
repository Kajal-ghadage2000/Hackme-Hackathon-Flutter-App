import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'tabs/Intro.dart';
import 'tabs/Hackthons.dart';
import 'tabs/Coding.dart';
import 'tabs/Webinars.dart';
import '../HomePage.dart';

class HackthonFragment extends StatefulWidget{
  @override
  _HackthonFragmentState createState()  => _HackthonFragmentState();
}

class _HackthonFragmentState extends State<HackthonFragment>{

  int _page = 0;
  // context;
  GlobalKey _bottomNavigationKey = GlobalKey();
  final PageController _pageController = PageController();

  final List<Widget> _tabItems = [new All(), new Hackthons(), new Coding(), new Webinars()];
  //final List<var> _appbardesign = [ blueappbar, greyappbar,greyappbar,greyappbar,];



  AppBar appbarfun(BuildContext context){

    var greyappbar = AppBar(
      //backgroundColor: Colors.grey[200],
      backgroundColor: Colors.grey[200],
      elevation: 0,
      centerTitle: true,
      title: Text(Apptitle.title,
        style: new TextStyle(
          color:  Colors.grey[200],),
      ),
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
    );


    var blueappbar = AppBar(
      //backgroundColor: Colors.grey[200],
      backgroundColor: Colors.blue,
      elevation: 0,
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
    );



    if(_page==0){
      return blueappbar;
    }
    else{
      return greyappbar;
    }
  }

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        drawer: MyDrawer(),
        appBar: appbarfun(context),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
            height: 45,
          backgroundColor: Colors.grey[200],
          color: Colors.blue,
          animationCurve: Curves.easeInOut,
          items: <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
            ImageIcon(AssetImage("images/hackathon1.png"), size: 30, color: Colors.white),
            ImageIcon(AssetImage("images/coding.png"), size: 30, color: Colors.white),
            ImageIcon(AssetImage("images/webinar1.png"), size: 30, color: Colors.white),
          ],
          onTap: (index) {
          //Handle button tap
          setState(() {
            _page = index;
            print(_page);
          });
          },
        ),
        body: _tabItems[_page],
      )
  );
  }
}

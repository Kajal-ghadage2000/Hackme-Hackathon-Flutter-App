/*
        Used to display 3 cards at home page where app info is present
 */
import 'package:flutter/material.dart';

class Choice {
  final String title;
  final String description;
  final String imglink;

  const Choice({this.title, this.description, this.imglink});
}


class ChoiceCard extends StatelessWidget {
  const ChoiceCard(
      {Key key, this.choice, this.onTap, @required this.item, this.selected: false}
      ) : super(key: key);

  final Choice choice;
  final VoidCallback onTap;
  final Choice item;
  final bool selected;


  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;
    if (selected)
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);
    return Card(
        color: Colors.white,
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [Colors.blueAccent, Colors.deepPurple[200], Colors.indigo[200]],
              stops: [0.3, 0.5, 0.7],
              center: Alignment(0.1, 0.3),
              focal: Alignment(-0.1, 0.6),
              focalRadius: 2,
            ),
          ),
          child: Column(
          children: <Widget>[
            new Container(
              width: 120.0,
              padding: const EdgeInsets.all(10.0),
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  /*Center(
                    child: Image.asset(choice.imglink,
                      width: 75.0,
                      height: 75.0,
                      fit: BoxFit.cover),
                  ),*/
                  Text(choice.title, style: Theme.of(context).textTheme.title, textAlign: TextAlign.justify,),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(choice.description,
                    //textAlign: TextAlign.justify,
                    style: TextStyle(
                    fontSize: 14,
                  ),),
                ],
              ),

            )
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),),
    );
  }
}
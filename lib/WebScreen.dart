/*
      Display webpages
*/
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'fragments/host_fragment.dart';
import 'Login.dart';

class WebScreen extends StatefulWidget {
  String URL;

  WebScreen(this.URL);
  @override
  State<StatefulWidget> createState() {
    return WebScreenState(this.URL);
  }
}

class WebScreenState extends State<WebScreen> {
  String URL;
  bool isLoading = true;

  initState() {
    super.initState();
    isLoading = true;
  }

  WebScreenState(this.URL);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: Text(Data1.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.share,
                color: Colors.white,
              ),
              onPressed: () async{
                // do something
                var msg = 'Hi '+ Data.name + ", Here is your " + Data1.event + " : " + URL;
                await Share.text('Hi, Here is your ', msg, 'text/plain');
              },
            )
          ],
        ),

        body: Stack(children: <Widget>[
          new WebView(
            initialUrl: URL,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (_) {
              setState(() {
                isLoading = false;
              });
              },
          ),
          isLoading
          ? Center(
              child: SpinKitFadingCircle(color: Colors.black),
            )
          : Container(),
    ]));
  }
}

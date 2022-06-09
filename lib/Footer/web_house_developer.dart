import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebHouseDevelopMent extends StatefulWidget {
  const WebHouseDevelopMent({Key? key}) : super(key: key);

  @override
  _WebHouseDevelopMentState createState() => _WebHouseDevelopMentState();
}

class _WebHouseDevelopMentState extends State<WebHouseDevelopMent> {

  bool isLoading = true;

  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Develop By Web House Nepal",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            WebView(
              key: _key,
              initialUrl: "https://webhousenepal.com/",
              javascriptMode: JavascriptMode.unrestricted,
              // onWebViewCreated: (WebViewController webViewController) {
              //   _controllerCompleter.complete(webViewController);
              // },
              onPageFinished: (finish) {
                setState(() {
                  isLoading = false;
                });
              },
            ),
            isLoading
                ? Center(
              child: CircularProgressIndicator(),
            )
                : Stack(),
          ],
        ),
      ),
    );
  }
}

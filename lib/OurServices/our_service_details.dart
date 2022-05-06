import 'package:flutter/material.dart';

class OurServiceDetails extends StatefulWidget {
  const OurServiceDetails({Key? key}) : super(key: key);

  @override
  _OurServiceDetailsState createState() => _OurServiceDetailsState();
}

class _OurServiceDetailsState extends State<OurServiceDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.menu),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[200],
        elevation: 0.0,
        toolbarHeight: 70,
        title: Text(
          "Our Services",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
                //  _scaffoldState.currentState.openDrawer();
              },
              // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      body: Center(
          child: Text(
        "Updating...",
        style: TextStyle(
            color: Colors.grey, fontSize: 25, fontWeight: FontWeight.bold),
      )),
    );
  }
}

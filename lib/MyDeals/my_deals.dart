import 'package:flutter/material.dart';
import 'package:sasto_wholesale/MyDeals/AllDeals/all_deals.dart';
import 'package:sasto_wholesale/MyDeals/AvailableDeals/available_deals.dart';
import 'package:sasto_wholesale/MyDeals/ExpiredDeals/expired_deals.dart';
import 'package:sasto_wholesale/MyDeals/UsedDeals/used_deals.dart';

class MyDeals extends StatefulWidget {
  const MyDeals({Key? key}) : super(key: key);

  @override
  _MyDealsState createState() => _MyDealsState();
}

class _MyDealsState extends State<MyDeals> {
  bool _messageSelected = true;

  void appBarChange() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: _appBarMenu(context),
        body: Column(
          children: <Widget>[
            TabBar(
                indicatorColor: Colors.black,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                labelPadding: EdgeInsets.symmetric(horizontal: 20.0),
                tabs: [
                  Tab(

                    child: Row(

                      children: <Widget>[
                        Text("All", style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: <Widget>[
                        Text("Available", style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),

                  Tab(
                    child: Row(
                      children: <Widget>[
                        Text("Used", style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: <Widget>[
                        Text("Expired", style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ]
            ),
            Expanded(
              flex: 1,
              child: TabBarView(
                children: [
                  AllDeals(),
                  AvailableDeals(),
                  UsedDeals(),
                  ExpiredDeals(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  _appBarMenu(BuildContext context) {
    return
      AppBar(
        title: Center(child: Text("My Deals", style: TextStyle(color: Colors.black),)),
        leading: Builder(builder: (BuildContext context) {
          return
            IconButton(
                icon:  Icon(Icons.arrow_back_ios_outlined, color: Colors.black,), onPressed: (){
              Navigator.pop(context);
            }
            );
        }),
        //elevation: 0.0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      );
  }
}

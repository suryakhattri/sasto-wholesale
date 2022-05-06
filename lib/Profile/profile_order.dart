import 'package:flutter/material.dart';
import 'package:sasto_wholesale/MyDeals/AllDeals/all_deals.dart';
import 'package:sasto_wholesale/MyDeals/AvailableDeals/available_deals.dart';
import 'package:sasto_wholesale/Profile/Order/details_screen.dart';
import 'package:sasto_wholesale/Profile/Order/history_screen.dart';

class ProfileOrder extends StatefulWidget {
  const ProfileOrder({Key? key}) : super(key: key);

  @override
  _ProfileOrderState createState() => _ProfileOrderState();
}

class _ProfileOrderState extends State<ProfileOrder> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        color: Colors.white,
        child: Column(
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
                        Text("Details", style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: <Widget>[
                        Text("History", style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ]
            ),
            Expanded(
              flex: 1,
              child: TabBarView(
                children: [
                  DetailsScreen(),
                  HistoryScreen(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

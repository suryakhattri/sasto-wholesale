import 'package:flutter/material.dart';
import 'package:sasto_wholesale/MyOrder/All/all_order.dart';
import 'package:sasto_wholesale/MyOrder/Cancelled/cancel_order.dart';
import 'package:sasto_wholesale/MyOrder/Delivered/deliver_order.dart';
import 'package:sasto_wholesale/MyOrder/Processing/processing_order.dart';
import 'package:sasto_wholesale/MyOrder/Unpaid/unpaid_order.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({Key? key}) : super(key: key);

  @override
  _MyOrderState createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  bool _messageSelected = true;

  void appBarChange() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
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
                        Text("Unpaid", style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),

                  Tab(
                    child: Row(
                      children: <Widget>[
                        Text("Processing", style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: <Widget>[
                        Text("Delivered", style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: <Widget>[
                        Text("Cancelled", style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ]
            ),
            Expanded(
              flex: 1,
              child: TabBarView(
                children: [
                  AllOrder(),
                  UnpaidOrder(),
                  ProcessingOrder(),
                  DeliverOrder(),
                  CancelOrder(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  _appBarMenu(BuildContext context) {
    return AppBar(
        title: Center(child: Text("My Order", style: TextStyle(color: Colors.black),)),
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

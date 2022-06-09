import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sasto_wholesale/MyOrder/manage_order.dart';
import 'package:sasto_wholesale/MyOrder/All/all_order_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AllOrder extends StatefulWidget {
  const AllOrder({Key? key}) : super(key: key);

  @override
  _AllOrderState createState() => _AllOrderState();
}

class _AllOrderState extends State<AllOrder> {
  late Future<List<Datum>>? allOrder;

  @override
  void initState() {
    super.initState();
    allOrder = fetchAllOrder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FutureBuilder<List<Datum>>(
          future: allOrder,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Datum> _allOrder = snapshot.data!;
              return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _allOrder.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new ManageOrder(orderId: _allOrder[index].id,)));
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Material(
                              elevation: 5,
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      //height: 80,
                                      decoration: BoxDecoration(
                                          color: Colors.blue[900],
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          )),
                                      child: ListTile(
                                        title: Text(
                                          "Order #${_allOrder[index].id}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        subtitle: Text(
                                          _allOrder[index]
                                              .updatedAt
                                              .toIso8601String(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 15),
                                        ),
                                        trailing:
                                            _allOrder[index].status == "pending"
                                                ? MaterialButton(
                                                    elevation: 2,
                                                    color: Colors.blue,
                                                    focusElevation: 4,
                                                    hoverElevation: 4,
                                                    highlightElevation: 8,
                                                    disabledElevation: 0,
                                                    onPressed: () {
                                                      // Navigator.push(
                                                      //     context,
                                                      //     MaterialPageRoute(
                                                      //         builder: (context) =>
                                                      //             new ManageOrder()));
                                                    },
                                                    child: Text(
                                                      'Pay Now',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 15),
                                                    ),
                                                  )
                                                : Text(""),
                                      ),
                                    ),
                                    ListView.builder(
                                        itemCount:
                                            _allOrder[index].orderLists.length,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10.0),
                                            child: Column(
                                              children: [
                                                ListTile(
                                                  onTap: () {},
                                                  title: Text(
                                                    _allOrder[index]
                                                        .orderLists[index]
                                                        .productName,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  trailing: Text(
                                                    "Rs: ${_allOrder[index].orderLists[index].unitPrice.toString()} * ${_allOrder[index].orderLists[index].quantity}",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Divider(
                                                  thickness: 0.5,
                                                  color: Colors.grey,
                                                  endIndent: 5,
                                                  indent: 5,
                                                ),
                                              ],
                                            ),
                                          );
                                        })
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 20),
                child: CircularProgressIndicator(
                    // backgroundColor: Colors.grey,
                    //color: Colors.purple,
                    // valueColor: ,
                    ));
          },
        ),
      ),
    );
  }
}

//Fetch Api
Future<List<Datum>> fetchAllOrder() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String loginToken = preferences.getString("login_token");

  var header = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $loginToken'
  };

  final response = await http.get(
      Uri.parse('https://seller.sastowholesale.com/api/customer/orders'),
      headers: header);
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body)["data"];
    print("data: ${jsonResponse}");
    return jsonResponse.map((data) => new Datum.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load manage order Item');
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sasto_wholesale/MyOrder/All/all_order_model.dart';
import 'package:sasto_wholesale/MyOrder/Processing/processing_order_details_page.dart';
import 'package:sasto_wholesale/MyOrder/manage_order.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProcessingOrder extends StatefulWidget {
  const ProcessingOrder({Key? key}) : super(key: key);

  @override
  _ProcessingOrderState createState() => _ProcessingOrderState();
}

class _ProcessingOrderState extends State<ProcessingOrder> {

  late Future<AllOrderModel> _processingOrderModel;

  @override
  void initState() {
    super.initState();
    _processingOrderModel = fetchProcessingMyOrder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: FutureBuilder<AllOrderModel>(
            future: _processingOrderModel,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.data.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  new ProcessingOrderDetailsPage(
                                      orderId:
                                      snapshot.data!.data[index].id)));
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
                                            "Order #${snapshot.data!.data[index].id}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                          subtitle: Text(
                                            "Placed on ${snapshot.data!.data[index].updatedAt.year}",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 15),
                                          ),
                                          // trailing: RaisedButton(
                                          //   elevation: 2,
                                          //   color: Colors.blue,
                                          //   focusElevation: 4,
                                          //   hoverElevation: 4,
                                          //   highlightElevation: 8,
                                          //   disabledElevation: 0,
                                          //   onPressed: () {
                                          //     //Navigator.push(context, MaterialPageRoute(builder: (context)=> new ManageOrder()));
                                          //   },
                                          //   child: Text(
                                          //     'Manage',
                                          //     style: TextStyle(
                                          //         color: Colors.white,
                                          //         fontWeight: FontWeight.bold,
                                          //         fontSize: 15),
                                          //   ),
                                          // )
                                        ),
                                      ),
                                      ListView.builder(
                                          itemCount: snapshot.data!.data[index].orderLists.length,
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
                                                      snapshot.data!.data[index].orderLists[index].productName,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                          FontWeight.bold),
                                                    ),
                                                    trailing: Text(
                                                      "Rs: ${snapshot.data!.data[index].orderLists[index].unitPrice.toString()} * ${snapshot.data!.data[index].orderLists[index].quantity}",
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
          )),
    );
  }
}

Future<AllOrderModel> fetchProcessingMyOrder() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String loginToken = preferences.getString("login_token");

  var header = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $loginToken'
  };

  final response = await http.get(
      Uri.parse('https://seller.sastowholesale.com/api/customer/orders?status=processing'),
      headers: header);
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    print("data: ${jsonResponse}");
    return new AllOrderModel.fromJson(jsonResponse);
  } else {
    throw Exception('Failed to load manage order Item');
  }
}


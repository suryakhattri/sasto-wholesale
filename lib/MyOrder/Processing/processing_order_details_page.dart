import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:sasto_wholesale/MyOrder/manage_order_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timelines/timelines.dart';

const kTileHeight = 50.0;

const completeColor = Color(0xff5e6172);
const inProgressColor = Color(0xff5ec792);
const todoColor = Color(0xffd1d2d7);

class ProcessingOrderDetailsPage extends StatefulWidget {
  const ProcessingOrderDetailsPage({Key? key, required this.orderId}) : super(key: key);

  final int orderId;

  @override
  _ProcessingOrderDetailsPageState createState() => _ProcessingOrderDetailsPageState();
}

class _ProcessingOrderDetailsPageState extends State<ProcessingOrderDetailsPage> {
  late Future<ManageOrderModel> _manageOrderModel;

  int _processIndex = 1;

  Color getColor(int index) {
    if (index == _processIndex) {
      return inProgressColor;
    } else if (index < _processIndex) {
      return completeColor;
    } else {
      return todoColor;
    }
  }

  @override
  void initState() {
    super.initState();

    _manageOrderModel = fetchManageOrder(widget.orderId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarMenu(context),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            _OrderManageHeader(),
            SizedBox(
              height: 10,
            ),
            _statusBar(),
            _shippingAddress(),
            SizedBox(
              height: 20,
            ),
            _billingAddress(),
            SizedBox(
              height: 20,
            ),
            _totalSummary(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

//Shipping Address Widget
  Widget _shippingAddress() {
    return FutureBuilder<ManageOrderModel>(
        future: _manageOrderModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data!.shippingAddress.fullName);
            return Padding(
              padding: EdgeInsets.only(left: 10, right: 10.0),
              child: Material(
                elevation: 5,
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding:
                    const EdgeInsets.only(left: 30.0, top: 10, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Shipping Address",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          snapshot.data!.shippingAddress.fullName,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 17),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          snapshot.data!.shippingAddress.phone,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 17),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          snapshot.data!.shippingAddress.streetAddress,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 17),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          snapshot.data!.shippingAddress.nearestLandmark,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 17),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${snapshot.data!.shippingAddress.city}, ${snapshot.data!.shippingAddress.country}",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 20),
            //child: CircularProgressIndicator(
            // backgroundColor: Colors.grey,
            //color: Colors.purple,
            // valueColor: ,
          );
        });
  }

  //Billing Address Widget
  Widget _billingAddress() {
    return FutureBuilder<ManageOrderModel>(
        future: _manageOrderModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data!.billingAddress.fullName);
            return Padding(
              padding: EdgeInsets.only(left: 10, right: 10.0),
              child: Material(
                elevation: 5,
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding:
                    const EdgeInsets.only(left: 30.0, top: 10, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Billing Address",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          snapshot.data!.billingAddress.fullName,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 17),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          snapshot.data!.billingAddress.phone,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 17),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          snapshot.data!.billingAddress.streetAddress,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 17),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          snapshot.data!.shippingAddress.nearestLandmark,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 17),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${snapshot.data!.billingAddress.city}, ${snapshot.data!.shippingAddress.country}",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 20),
            //child: CircularProgressIndicator(
            // backgroundColor: Colors.grey,
            //color: Colors.purple,
            // valueColor: ,
          );
        });
  }

  //Total Summary Widget

  Widget _totalSummary() {
    return FutureBuilder<ManageOrderModel>(
        future: _manageOrderModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data!.shippingAddress.fullName);
            return Padding(
              padding: EdgeInsets.only(left: 10, right: 10.0),
              child: Material(
                elevation: 5,
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, top: 10, bottom: 10, right: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Summary",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Subotal:",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 17),
                            ),
                            Text(
                              snapshot.data!.subtotalPrice.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 17),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Shipping Charge:",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 17),
                            ),
                            Text(
                              snapshot.data!.shippingCharge.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 17),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total:",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            Text(
                              snapshot.data!.totalPrice.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Paid By: ${snapshot.data!.paymentType} (${snapshot.data!.paymentStatus})",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 20),
            //child: CircularProgressIndicator(
            // backgroundColor: Colors.grey,
            //color: Colors.purple,
            // valueColor: ,
          );
        });
  }

  //order management Widget
  Widget _OrderManageHeader() {
    return FutureBuilder<ManageOrderModel>(
        future: _manageOrderModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Material(
                elevation: 5,
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Text(
                                  "My Orders",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              ListTile(
                                visualDensity: VisualDensity.compact,
                                dense: true,
                                title: Text(
                                  "Order #${snapshot.data!.id}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                subtitle: Text(
                                  "Placed on ${snapshot.data!.updatedAt.year}",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                trailing: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  // mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                          text: "Total:",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: snapshot.data!.totalPrice
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                          ]),
                                    ),
                                    Text(
                                      "${snapshot.data!.paymentStatus} Payment",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                              // ListTile(
                              //   title: Text("Placed on Tue Feb 15 2022"),
                              //   trailing: Text("Pending"),
                              // ),
                            ],
                          ),
                        );
                      }),
                ),
              ),
            );
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
        });
  }

  Widget _statusBar() {
    return FutureBuilder<ManageOrderModel>(
        future: _manageOrderModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: 1,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                  ),
                  child: Material(
                    elevation: 5,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 10.0),
                      child: Container(
                        // height: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Sold By: ${snapshot.data!.soldBy}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextButton(
                                  // elevation: 2,
                                  // color: Colors.blue,
                                  // focusElevation: 4,
                                  // hoverElevation: 4,
                                  // highlightElevation: 8,
                                  // disabledElevation: 0,
                                  onPressed: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             new ManageOrder()));
                                  },
                                  child: Text(
                                    'Chat Now',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                              ],
                            ),

                            Container(
                              height: 120,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0, top: 10.0),
                                child: Timeline.tileBuilder(
                                  theme: TimelineThemeData(
                                    direction: Axis.horizontal,
                                    connectorTheme: ConnectorThemeData(
                                      space: 30.0,
                                      thickness: 5.0,
                                    ),
                                  ),
                                  builder: TimelineTileBuilder.connected(
                                    connectionDirection:
                                    ConnectionDirection.before,
                                    itemExtentBuilder: (_, __) =>
                                    MediaQuery.of(context).size.width /
                                        _processes.length,
                                    oppositeContentsBuilder: (context, index) {
                                      // return Padding(
                                      //   padding: const EdgeInsets.only(bottom: 15.0),
                                      //   child: Image.asset(
                                      //     'assets/images/process_timeline/status${index + 1}.png',
                                      //     width: 50.0,
                                      //     color: getColor(index),
                                      //   ),
                                      // );
                                    },
                                    contentsBuilder: (context, index) {
                                      return Padding(
                                          padding:
                                          const EdgeInsets.only(top: 15.0),
                                          child:
                                          // ? Text(
                                          //     "${snapshot.data!.paymentStatus}",
                                          //     style: TextStyle(
                                          //       fontWeight: FontWeight.bold,
                                          //       color: getColor(index),
                                          //     ),
                                          //   )
                                          Text(
                                            _processes[index],
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: getColor(index),
                                            ),
                                          )
                                      );
                                    },
                                    indicatorBuilder: (_, index) {
                                      var color;
                                      var child;
                                      if (index == _processIndex) {
                                        color = inProgressColor;
                                        child = Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CircularProgressIndicator(
                                            strokeWidth: 3.0,
                                            valueColor: AlwaysStoppedAnimation(
                                                Colors.white),
                                          ),
                                        );
                                      } else if (index < _processIndex) {
                                        color = completeColor;
                                        child = Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 15.0,
                                        );
                                      } else {
                                        color = todoColor;
                                      }

                                      if (index <= _processIndex) {
                                        return Stack(
                                          children: [
                                            CustomPaint(
                                              size: Size(30.0, 30.0),
                                              painter: _BezierPainter(
                                                color: color,
                                                drawStart: index > 0,
                                                drawEnd: index < _processIndex,
                                              ),
                                            ),
                                            DotIndicator(
                                              size: 30.0,
                                              color: color,
                                              child: child,
                                            ),
                                          ],
                                        );
                                      } else {
                                        return Stack(
                                          children: [
                                            CustomPaint(
                                              size: Size(15.0, 15.0),
                                              painter: _BezierPainter(
                                                color: color,
                                                drawEnd: index <
                                                    _processes.length - 1,
                                              ),
                                            ),
                                            OutlinedDotIndicator(
                                              borderWidth: 4.0,
                                              color: color,
                                            ),
                                          ],
                                        );
                                      }
                                    },
                                    connectorBuilder: (_, index, type) {
                                      if (index > 0) {
                                        if (index == _processIndex) {
                                          final prevColor = getColor(index - 1);
                                          final color = getColor(index);
                                          List<Color> gradientColors;
                                          if (type == ConnectorType.start) {
                                            gradientColors = [
                                              Color.lerp(
                                                  prevColor, color, 0.5)!,
                                              color
                                            ];
                                          } else {
                                            gradientColors = [
                                              prevColor,
                                              Color.lerp(prevColor, color, 0.5)!
                                            ];
                                          }
                                          return DecoratedLineConnector(
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: gradientColors,
                                              ),
                                            ),
                                          );
                                        } else {
                                          return SolidLineConnector(
                                            color: getColor(index),
                                          );
                                        }
                                      } else {
                                        return null;
                                      }
                                    },
                                    itemCount: _processes.length,
                                  ),
                                ),
                              ),
                            ),
                            // snapshot.data!.paymentStatus == "pending"
                            //     ? Padding(
                            //   padding: const EdgeInsets.only(
                            //       left: 20.0, right: 10, top: 20),
                            //   child: Row(
                            //     mainAxisAlignment:
                            //     MainAxisAlignment.spaceBetween,
                            //     // crossAxisAlignment: CrossAxisAlignment.center,
                            //     children: [
                            //       MaterialButton(
                            //         elevation: 2,
                            //         color: Colors.red,
                            //         focusElevation: 4,
                            //         hoverElevation: 4,
                            //         highlightElevation: 8,
                            //         disabledElevation: 0,
                            //         onPressed: () {
                            //           // Navigator.push(
                            //           //     context,
                            //           //     MaterialPageRoute(
                            //           //         builder: (context) =>
                            //           //             new ManageOrder()));
                            //         },
                            //         child: Text(
                            //           'Cancel Order',
                            //           style: TextStyle(
                            //               color: Colors.white,
                            //               fontWeight: FontWeight.bold,
                            //               fontSize: 17),
                            //         ),
                            //       ),
                            //       //SizedBox(width: 10,),
                            //       MaterialButton(
                            //         elevation: 2,
                            //         color: Colors.blue,
                            //         focusElevation: 4,
                            //         hoverElevation: 4,
                            //         highlightElevation: 8,
                            //         disabledElevation: 0,
                            //         onPressed: () {
                            //           // Navigator.push(
                            //           //     context,
                            //           //     MaterialPageRoute(
                            //           //         builder: (context) =>
                            //           //             new ManageOrder()));
                            //         },
                            //         child: Text(
                            //           'Payment',
                            //           style: TextStyle(
                            //               color: Colors.white,
                            //               fontWeight: FontWeight.bold,
                            //               fontSize: 17),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // )
                            //     : Container(),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: ListView.builder(
                                  itemCount: snapshot.data!.orderLists.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        ListTile(
                                          onTap: () {},
                                          leading: Image.network(snapshot
                                              .data!
                                              .orderLists[index]
                                              .productImageUrl),
                                          title: Text(
                                            snapshot.data!.orderLists[index]
                                                .productName,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          trailing: Text(
                                            "Rs: ${snapshot.data!.orderLists[index].unitPrice.toString()} * ${snapshot.data!.orderLists[index].quantity.toString()}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 0.5,
                                          color: Colors.grey,
                                          endIndent: 5,
                                          indent: 5,
                                        ),
                                      ],
                                    );
                                  }),
                            ),
                            // // TimelineTile(
                            //      axis: TimelineAxis.horizontal
                            //  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 20),
            //child: CircularProgressIndicator(
            // backgroundColor: Colors.grey,
            //color: Colors.purple,
            // valueColor: ,
            // ),
          );
        });
  }

  _appBarMenu(BuildContext context) {
    return AppBar(
      title: Center(
          child: Text(
            "Manage Order",
            style: TextStyle(color: Colors.black),
          )),
      leading: Builder(builder: (BuildContext context) {
        return IconButton(
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            });
      }),
      //elevation: 0.0,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
    );
  }
}

//Fetch Api
Future<ManageOrderModel> fetchManageOrder(var orderId) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String loginToken = preferences.getString("login_token")!;

  var header = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $loginToken'
  };

  final response = await http.get(
      Uri.parse('https://seller.sastowholesale.com/api/customer/orders/' + orderId.toString() + 'status=processing'),
      headers: header);
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    print("data: ${jsonResponse}");
    return new ManageOrderModel.fromJson(jsonResponse);
  } else {
    throw Exception('Failed to load manage order Item');
  }
}

/// hardcoded bezier painter
/// TODO: Bezier curve into package component
class _BezierPainter extends CustomPainter {
  const _BezierPainter({
    required this.color,
    this.drawStart = true,
    this.drawEnd = true,
  });

  final Color color;
  final bool drawStart;
  final bool drawEnd;

  Offset _offset(double radius, double angle) {
    return Offset(
      radius * cos(angle) + radius,
      radius * sin(angle) + radius,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;

    final radius = size.width / 2;

    var angle;
    var offset1;
    var offset2;

    var path;

    if (drawStart) {
      angle = 3 * pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);
      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(0.0, size.height / 2, -radius,
            radius) // TODO connector start & gradient
        ..quadraticBezierTo(0.0, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
    if (drawEnd) {
      angle = -pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);

      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(size.width, size.height / 2, size.width + radius,
            radius) // TODO connector end & gradient
        ..quadraticBezierTo(size.width, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(_BezierPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.drawStart != drawStart ||
        oldDelegate.drawEnd != drawEnd;
  }
}

final _processes = [
  'Cancelled',
  'Pending',
  'Processing',
  'Shipped',
  'Delivered',

];

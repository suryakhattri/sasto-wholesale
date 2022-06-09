import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sasto_wholesale/Products/products_list.dart';
import 'package:sasto_wholesale/SastoWholesaleMall/sasto_wholesale_mall_all_product_list.dart';
import 'package:sasto_wholesale/SastoWholesaleMall/vendor_sasto_wholesale_mall_model.dart';
import 'package:sasto_wholesale/TopProducts/top_product_all_item_model.dart';
import 'package:http/http.dart' as http;

class SastoWholesaleMallAllProduct extends StatefulWidget {
  const SastoWholesaleMallAllProduct({Key? key, required this.vendorId}) : super(key: key);

  final int vendorId;
 // final String title;

  @override
  _SastoWholesaleMallAllProductState createState() =>
      _SastoWholesaleMallAllProductState();
}

class _SastoWholesaleMallAllProductState
    extends State<SastoWholesaleMallAllProduct> {
  late Future<VendorModel> _vendorModel;

  @override
  void initState() {
    super.initState();
    print(widget.vendorId);
    _vendorModel = fetchVendor(widget.vendorId);
  }


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
          "Sasto Wholesale Mall",
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
      body: FutureBuilder<VendorModel>(
        future: _vendorModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 150.0,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/2.jpeg"),
                            fit: BoxFit.fill,
                            colorFilter: new ColorFilter.mode(
                                Colors.black.withOpacity(1.0),
                                BlendMode.softLight),
                          ),
                        ),
                        child: Center(
                            child: Text(
                              snapshot.data!.data.shopName,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          child: DefaultTabController(
                            length: 2,
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  TabBar(
                                      indicatorColor: Colors.black,
                                      isScrollable: true,
                                      indicatorSize: TabBarIndicatorSize.label,
                                      labelPadding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                      tabs: [
                                        Container(
                                          child: Tab(
                                            child: Row(
                                              children: <Widget>[
                                                Text(
                                                  "Products",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 17.0,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Tab(
                                          child: Row(
                                            children: <Widget>[
                                              Text(
                                                "Company Profile",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]),
                                  Expanded(
                                    flex: 1,
                                    child: TabBarView(
                                      children: [
                                        SastoWholesaleMallAllProductList(vendorId: snapshot.data!.data.userId,),
                                        Center(child: Text("No data Available"))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
    );
  }
}

//Vendor Api
Future<VendorModel> fetchVendor(var vendorId) async {
  final response = await http.get(Uri.parse(
      'https://seller.sastowholesale.com/api/vendors/'+vendorId.toString()));
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    print("${response.body}");
    return new VendorModel.fromJson(jsonResponse);
  } else {
    throw Exception('Failed to load data');
  }
}


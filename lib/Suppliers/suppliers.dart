import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sasto_wholesale/SastoWholesaleMall/sasto_wholesale_mall_all_product.dart';
import 'package:sasto_wholesale/Suppliers/suppliers_model.dart';
import 'package:sasto_wholesale/Suppliers/suppliers_product_list.dart';
import 'package:sasto_wholesale/TopProducts/top_product_all_item_model.dart';
import 'package:http/http.dart' as http;

class Suppliers extends StatefulWidget {
  const Suppliers({Key? key, required this.slug}) : super(key: key);
  final String slug;

  @override
  _SuppliersState createState() => _SuppliersState();
}

class _SuppliersState extends State<Suppliers> {
  late Future<List<SuppliersDataModel>> _suppliersData;
  final Image noImage = Image.asset("assets/images/noImage.jpeg");

  @override
  void initState() {
    super.initState();
    _suppliersData = fetchSuppliersItem(widget.slug);
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
          "Suppliers",
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
      //backgroundColor: Color.fromARGB(255, 98, 134, 166),
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder<List<SuppliersDataModel>>(
            future: _suppliersData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<SuppliersDataModel> _supplierData = snapshot.data!;
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                        right: 15.0,
                      ),
                      child: Container(
                        // color: Color.fromARGB(255, 98, 134, 166),
                        color: Colors.grey[200],
                        child: GridView.builder(
                            physics: ScrollPhysics(),
                            itemCount: _supplierData.length,
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.80,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              new SastoWholesaleMallAllProduct(vendorId: _supplierData[index].id)));
                                },
                                child: Material(
                                  elevation: 5,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      //  SizedBox(height: 30.0,),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 15.0),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          // height: 160,
                                          // width: 300,
                                          decoration: BoxDecoration(
                                              // color: Colors.deepPurple
                                              ),
                                          child: (_supplierData[index]
                                                      .imageUrl !=
                                                  null) // Only use the network image if the url is not null
                                              ? Image.network(
                                                  _supplierData[index].imageUrl,
                                                  loadingBuilder: (context,
                                                          child,
                                                          loadingProgress) =>
                                                      (loadingProgress == null)
                                                          ? child
                                                          : CircularProgressIndicator(),
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      noImage,
                                                )
                                              : noImage,
                                          // Image.network(
                                          //   _supplierData[index].imageUrl,
                                          //   fit: BoxFit.fill,
                                          // ),
                                        ),
                                      ),

                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 10.0, left: 10.0, right: 10.0),
                                        child: Container(
                                          // width: 220,
                                          child: Center(
                                            child: Text(
                                                _supplierData[index].shopName,
                                                style: TextStyle(
                                                    fontSize: 17.0,
                                                    fontWeight: FontWeight.bold),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis),
                                          ),
                                        ),
                                        //child: Text("The bibal is a catholic book",  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                                      ),

                                      // SizedBox(
                                      //   height: 10,
                                      // ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
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
            },
          ),
        ),
      ),
    );
  }
}

Future<List<SuppliersDataModel>> fetchSuppliersItem(String slug) async {
  final response = await http
      .get(Uri.parse('https://seller.sastowholesale.com/api/vendors?from=${slug}'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body)['data'];
    print("${response.body}");
    return jsonResponse
        .map((data) => new SuppliersDataModel.fromJson(data))
        .toList();
  } else {
    throw Exception('Failed to load Suppliers');
  }
}

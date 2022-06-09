import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sasto_wholesale/CategoryDetails/category_details.dart';
import 'package:sasto_wholesale/TopProducts/top_product_all_item_model.dart';

class SastoWholesaleMallAllProductList extends StatefulWidget {
  const SastoWholesaleMallAllProductList({Key? key, required this.vendorId}) : super(key: key);
  final int vendorId;

  @override
  _SastoWholesaleMallAllProductListState createState() => _SastoWholesaleMallAllProductListState();
}

class _SastoWholesaleMallAllProductListState extends State<SastoWholesaleMallAllProductList> {
  late Future<List<TopProductData>> _sastoWholesaleAllProductList;

  @override
  void initState() {
    super.initState();
    print(widget.vendorId);
    _sastoWholesaleAllProductList = fetchSastoWholesaleAllProduct(widget.vendorId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: FutureBuilder<List<TopProductData>>(
              future: _sastoWholesaleAllProductList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<TopProductData> _newArrivalData = snapshot.data!;
                  return Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15.0,
                          right: 15.0,
                        ),
                        child: Container(
                          child: GridView.builder(
                              physics: ScrollPhysics(),
                              itemCount: snapshot.data!.length,
                              shrinkWrap: true,
                              gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.57,
                                  crossAxisSpacing: 10,
                                  //mainAxisSpacing: 10
                              ),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            new ProductDetailPage(slug: _newArrivalData[index].slug,)));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 10.0, top: 10),
                                    child: Material(
                                      elevation: 5,
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5.0)),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(top: 15.0),
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20),
                                              decoration: BoxDecoration(),
                                              child: Image.network(
                                                _newArrivalData[index].imageUrl,
                                                height: 150,
                                                width: 150,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 10.0, left: 20.0),
                                            child: Container(
                                              child: Text(
                                                  _newArrivalData[index].title,
                                                  style: TextStyle(
                                                      fontSize: 17.0,
                                                      color: Colors.blue,
                                                      fontWeight: FontWeight.normal),
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 5.0, left: 20.0),
                                            child: Text(
                                              _newArrivalData[index].priceRange,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 5.0, left: 20.0),
                                            child: Text(
                                              _newArrivalData[index].minOrder,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.normal),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                      SizedBox(height: 300,),
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
      ),
    );
  }
}

Future<List<TopProductData>> fetchSastoWholesaleAllProduct(var vendorId) async {
  final response = await http.get(Uri.parse(
      'https://seller.sastowholesale.com/api/products?from_vendor=${vendorId.toString()}'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body)['data'];
    print("${response.body}");
    return jsonResponse
        .map((data) => new TopProductData.fromJson(data))
        .toList();
  } else {
    throw Exception('Failed to load Top Product Data');
  }
}


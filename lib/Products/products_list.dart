import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sasto_wholesale/CategoryDetails/category_details.dart';
import 'package:sasto_wholesale/Products/Model/products.dart';
import 'package:sasto_wholesale/TopProducts/top_product_all_item_model.dart';
import 'package:http/http.dart' as http;

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  late Future<List<TopProductData>> _productListData;

  @override
  void initState() {
    super.initState();
    _productListData = fetchProductList();
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
            "Products",
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
              child: FutureBuilder<List<TopProductData>>(
                  future: _productListData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<TopProductData> _productList = snapshot.data!;

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
                                  itemCount: _productList.length,
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 0.65,
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 10),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    new ProductDetailPage(slug: _productList[index].slug,)));
                                      },
                                      child: Material(
                                        elevation: 5,
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            //  SizedBox(height: 30.0,),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 15.0),
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20),
                                                // height: 160,
                                                // width: 300,
                                                decoration: BoxDecoration(
                                                    // color: Colors.deepPurple
                                                    ),
                                                child: Center(
                                                  child: Image.network(
                                                    _productList[index].imageUrl,
                                                    fit: BoxFit.fitWidth,
                                                    height: 150,
                                                  ),
                                                ),
                                              ),
                                            ),

                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 10.0, left: 20.0),
                                              child: Container(
                                                // width: 220,
                                                child: Text(
                                                   _productList[index].title,
                                                    style: TextStyle(
                                                        fontSize: 17.0,
                                                        fontWeight:
                                                            FontWeight.normal),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                              //child: Text("The bibal is a catholic book",  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 5.0, left: 20.0),
                                              child: Text(
                                                _productList[index].priceRange,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 5.0, left: 20.0),
                                              child: Text(
                                                _productList[index].minOrder,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15.0,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
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
                          ),
                    );
                  })),
        ));
  }
}

Future<List<TopProductData>> fetchProductList() async {
  final response = await http
      .get(Uri.parse('https://seller.sastowholesale.com/api/products'));
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

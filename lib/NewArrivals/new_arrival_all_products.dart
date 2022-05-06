import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sasto_wholesale/CategoryDetails/category_details.dart';
import 'package:sasto_wholesale/NewArrivals/new_arrival_all_product_model.dart';
import 'package:http/http.dart' as http;

class NewArrivalAllProducts extends StatefulWidget {
  const NewArrivalAllProducts({Key? key}) : super(key: key);

  @override
  _NewArrivalAllProductsState createState() => _NewArrivalAllProductsState();
}

class _NewArrivalAllProductsState extends State<NewArrivalAllProducts> {
  late Future<List<NewArrivalAllData>> _newArrivalAllProduct;

  @override
  void initState() {
    super.initState();
    _newArrivalAllProduct = fetchNewArrivalAllItem();
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
          "New Arrivals",
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
          child: FutureBuilder<List<NewArrivalAllData>>(
            future: _newArrivalAllProduct,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<NewArrivalAllData> _newArrivalData = snapshot.data!;
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15.0,
                        right: 15.0,
                      ),
                      child: Container(
                        color: Colors.grey[200],
                        child: GridView.builder(
                            physics: ScrollPhysics(),
                            itemCount: snapshot.data!.length,
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
                                              new ProductDetailPage(slug: _newArrivalData[index].slug,)));
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
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 15.0),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          decoration: BoxDecoration(),
                                          child: Image.network(
                                            _newArrivalData[index].imageUrl,
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
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold),
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

Future<List<NewArrivalAllData>> fetchNewArrivalAllItem() async {
  final response = await http.get(Uri.parse(
      'https://seller.sastowholesale.com/api/p/new-arrivals-products'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body)['data'];
    print("${response.body}");
    return jsonResponse
        .map((data) => new NewArrivalAllData.fromJson(data))
        .toList();
  } else {
    throw Exception('Failed to load You May Like Item');
  }
}

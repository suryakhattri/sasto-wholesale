import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sasto_wholesale/CategoryDetails/category_details.dart';
import 'package:sasto_wholesale/SastoWholeSale/Models/sasto_wholesale_mall_model.dart';

class SastoWholesaleMall extends StatefulWidget {
  const SastoWholesaleMall({Key? key}) : super(key: key);

  @override
  _SastoWholesaleMallState createState() => _SastoWholesaleMallState();
}

class _SastoWholesaleMallState extends State<SastoWholesaleMall> {

  late Future <List<Datum>> _sastWholesaleMall;

  @override
  void initState() {
    super.initState();
    _sastWholesaleMall = fetchSastoWholesaleMall();

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        height: 260,
        decoration: BoxDecoration(
          //  borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
        child: FutureBuilder<List<Datum>>(
          future: _sastWholesaleMall,
          //future: newArrivalPresenter.getNewArrivalItem(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Datum> _sastoWholesaleMarketItem = snapshot.data!;
              // Ne _newArrivalItem = snapshot.data!;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _sastoWholesaleMarketItem.length,
                itemBuilder: (BuildContext context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new ProductDetailPage(slug: _sastoWholesaleMarketItem[index].slug,)));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 150,
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                _sastoWholesaleMarketItem[index].imageUrl,
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),

                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              _sastoWholesaleMarketItem[index].title,
                              style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              // '\$${_newArrivalModel[index].price}',
                              _sastoWholesaleMarketItem[index].priceRange,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              // '\$${_newArrivalModel[index].price}',
                              _sastoWholesaleMarketItem[index].minOrder,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                            // Row(
                            //   children: [
                            //     Center(
                            //         child: SmoothStarRating(
                            //      // rating: rating,
                            //       isReadOnly: true,
                            //       size: 20,
                            //       color: Colors.pink,
                            //       borderColor: Colors.pinkAccent,
                            //       filledIconData: Icons.star,
                            //       halfFilledIconData: Icons.star_half,
                            //       defaultIconData: Icons.star_border,
                            //       starCount: 5,
                            //       allowHalfRating: true,
                            //       spacing: 2.0,
                            //       onRated: (value) {
                            //         print("rating value -> $value");
                            //         // print("rating value dd -> ${value.truncate()}");
                            //       },
                            //     )),
                            //   ],
                            // ),
                          ],
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

Future<List<Datum>> fetchSastoWholesaleMall() async {
  final response = await http
      .get(Uri.parse('https://seller.sastowholesale.com/api/p/sasto-wholesale-mall-products'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body)['data'];
    return jsonResponse.map((data) => new Datum.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load Menu Item');
  }
}

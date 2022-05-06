import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sasto_wholesale/CategoryDetails/category_details.dart';
import 'package:http/http.dart' as http;
import 'Models/wholesaleMarketItems.dart';

class SastoWholeSaleMarket extends StatefulWidget {
  SastoWholeSaleMarket({Key? key}) : super(key: key);

  @override
  _SastoWholeSaleMarketState createState() => _SastoWholeSaleMarketState();
}

class _SastoWholeSaleMarketState extends State<SastoWholeSaleMarket> {
  late Future<List<LatestSuppliers>>? latestSuppliers;

  @override
  void initState() {
    super.initState();
    latestSuppliers = fetchLetestSuppliers();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          //  borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
        child: FutureBuilder<List<LatestSuppliers>>(
          future: latestSuppliers,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<LatestSuppliers> _latestSuppliers = snapshot.data!;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _latestSuppliers.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => new ProductDetailPage(slug: _latestSuppliers[index].id,)));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: 200,
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                // color: Colors.blueAccent,
                                child: Image.network(
                                  _latestSuppliers[index].imageUrl,
                                  // height: constraints.maxHeight * 0.6,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0),
                                child: Text(
                                  _latestSuppliers[index].shopName,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
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
              child: CircularProgressIndicator(
                  // backgroundColor: Colors.grey,
                  //color: Colors.purple,
                  // valueColor: ,
                  ),
            );
          },
        ),
      ),
    );
  }
}

Future<List<LatestSuppliers>> fetchLetestSuppliers() async {
  final response = await http.get(
      Uri.parse('https://seller.sastowholesale.com/api/v/latest-suppliers'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse
        .map((data) => new LatestSuppliers.fromJson(data))
        .toList();
  } else {
    throw Exception('Failed to load Menu Item');
  }
}

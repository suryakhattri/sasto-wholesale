import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sasto_wholesale/CategoryDetails/vendor_model.dart';
import 'package:sasto_wholesale/SastoWholesaleMall/sasto_wholesale_mall_all_product.dart';

class VendorProfile extends StatefulWidget {
  const VendorProfile({Key? key, required this.vendorId}) : super(key: key);
  final int vendorId;

  @override
  _VendorProfileState createState() => _VendorProfileState();
}

late Future<VendorModel> _vendorModel;

class _VendorProfileState extends State<VendorProfile> {
  @override
  void initState() {
    super.initState();
    _vendorModel = fetchVendor(widget.vendorId);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<VendorModel>(
      future: _vendorModel,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              // width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/images/supplier-mini-card-bg.png',
                  ),
                ),
              ),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/verified-supplier-badge.png",
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ListTile(
                      leading: Container(
                        //margin: EdgeInsets.only(top: 20.0),
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(snapshot.data!.data.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(
                        snapshot.data!.data.shopName,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        snapshot.data!.data.businessType,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    child: ListTile(
                      leading: Icon(
                        Icons.attractions,
                        size: 25,
                        color: Colors.blue,
                      ),
                      title: Text(
                        snapshot.data!.data.category,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    child: ListTile(
                      leading: Icon(
                        Icons.attractions,
                        size: 25,
                        color: Colors.blue,
                      ),
                      title: Text(
                        "1 Years",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    child: ListTile(
                      leading: Icon(
                        Icons.attractions,
                        size: 25,
                        color: Colors.blue,
                      ),
                      title: Text(
                        "Trade Assurance",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    height: 30,
                    child: ListTile(
                      leading: Icon(
                        Icons.attractions,
                        size: 25,
                        color: Colors.blue,
                      ),
                      title: Text(
                        "Onsite Check",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              new SastoWholesaleMallAllProduct(
                                vendorId: snapshot.data!.data.id,
                              )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                      child: Text(
                        "View Suppliers Profile",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return Container();
      },
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

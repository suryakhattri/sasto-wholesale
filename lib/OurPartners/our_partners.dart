import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sasto_wholesale/OurPartners/partner_model.dart';
import 'package:sasto_wholesale/SastoWholeSale/Models/wholesaleMarketItems.dart';
import 'package:http/http.dart' as http;

class OurPartners extends StatefulWidget {
  OurPartners({Key? key}) : super(key: key);

  @override
  State<OurPartners> createState() => _OurPartnersState();
}

class _OurPartnersState extends State<OurPartners> {
  late Future<List<Datum>> _partnersItem;

  @override
  void initState() {
    super.initState();
    _partnersItem = fetchOurPartner();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Datum>>(
      future: _partnersItem,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Datum> _partnerData = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                //  borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _partnerData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, left: 10, right: 10, bottom: 10),
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          // color: Colors.blueAccent,
                          child: Material(
                            elevation: 1,
                            borderRadius: BorderRadius.circular(10),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Hero(
                                tag: _partnerData.hashCode,
                                child: Image.network(
                                  _partnerData[index].imageUrl,
                                  // height: constraints.maxHeight * 0.6,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        // Text(
                        //   _items[index].name,
                        //   style: TextStyle(
                        //       color: Colors.black,
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 15),
                        // ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                      ],
                    ),
                  );
                },
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
      },
    );

  }
}

Future<List<Datum>> fetchOurPartner() async {
  final response = await http.get(
      Uri.parse('https://seller.sastowholesale.com/api/partners-carousel'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body)['data'];
    print("${response.body}");
    return jsonResponse
        .map((data) => new Datum.fromJson(data))
        .toList();
  } else {
    throw Exception('Failed to load Partner Item');
  }
}

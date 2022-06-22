import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sasto_wholesale/Country/Model/country_model.dart';
import 'package:sasto_wholesale/SastoWholeSale/Models/wholesaleMarketItems.dart';
import 'package:http/http.dart' as http;
import 'package:sasto_wholesale/Suppliers/suppliers.dart';

class Country extends StatefulWidget {
  Country({Key? key}) : super(key: key);

  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  late Future<List<Datum>> _countryItem;

  @override
  void initState() {
    super.initState();
    _countryItem = fetchCountryItems();

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        height: 170,
        decoration: BoxDecoration(
          //  borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
        child: FutureBuilder<List<Datum>>(
          future: _countryItem,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Datum> _countryList = snapshot.data!;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _countryList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                     // if(_countryList[index].name =="nepal") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                new Suppliers(slug: _countryList[index].slug,)));
                     // }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 15.0, left: 10, right: 10, bottom: 10),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              _countryList[index].flagUrl,
                              // height: constraints.maxHeight * 0.6,
                              fit: BoxFit.cover,
                              height: 100,
                              width: 100,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            _countryList[index].name,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
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

Future<List<Datum>> fetchCountryItems() async {
  final response = await http.get(Uri.parse(
      'https://seller.sastowholesale.com/api/countries'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body)['data'];
    return jsonResponse.map((data) => new Datum.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load Country Item');
  }
}

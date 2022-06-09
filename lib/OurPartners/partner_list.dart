import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sasto_wholesale/OurPartners/partner_list_model.dart';
import 'package:http/http.dart' as http;

class PartnerList extends StatefulWidget {
  const PartnerList({Key? key}) : super(key: key);

  @override
  _PartnerListState createState() => _PartnerListState();
}

class _PartnerListState extends State<PartnerList> {
  late Future<PartnerListModel> _partnerListModel;

  @override
  void initState() {
    super.initState();
    _partnerListModel = fetchPartnerList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: FutureBuilder<PartnerListModel>(
            future: _partnerListModel,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.data.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data!.data[index].name,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              snapshot.data!.data[index].id != null ?
                              PartnerData(id: snapshot.data!.data[index].id):
                              Text("Empty"),
                            ],
                          ),
                        );
                      }),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return Center(
                child: CircularProgressIndicator(
                    // height: 0,
                    ),
              );
            }),
      ),
    );
  }
}

class PartnerData extends StatefulWidget {
  const PartnerData({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  _PartnerDataState createState() => _PartnerDataState();
}

class _PartnerDataState extends State<PartnerData> {
  late Future<PartnerListModel> _partnerListModel;
  final Image noImage = Image.asset("assets/images/noImage.jpeg");

  @override
  void initState() {
    super.initState();
    _partnerListModel = fetchPartnerList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PartnerListModel>(
      future: _partnerListModel,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return snapshot.data!.data.first.partners != null ? Padding(
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
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.data.first.partners.length,
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
                                tag: _partnerListModel.hashCode,
                                child: (snapshot.data!.data[index].partners!= null) // Only use the network image if the url is not null
                                    ? Image.network(
                                        snapshot.data!.data[index]
                                            .partners[index].imageUrl,
                                        loadingBuilder: (context, child,
                                                loadingProgress) =>
                                            (loadingProgress == null)
                                                ? child
                                                : CircularProgressIndicator(),
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                noImage,
                                      )
                                    : noImage,
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
              )
            ),
          ): Text("data");
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 20),
            child:  Container(
            height: 0,
            ));
      },
    );
  }
}

Future<PartnerListModel> fetchPartnerList() async {
  var url = 'https://seller.sastowholesale.com/api/our-partners';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    print("${response.body}");
    return new PartnerListModel.fromJson(jsonResponse);
  } else {
    throw Exception('Failed to load Partner Data');
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sasto_wholesale/CategoryDetails/category_details.dart';

import 'Models/you_may_like_model.dart';

class YouMayLike extends StatefulWidget {
  const YouMayLike({Key? key}) : super(key: key);

  @override
  _YouMayLikeState createState() => _YouMayLikeState();
}

class _YouMayLikeState extends State<YouMayLike> {
  late Future<List<Datum>> _youMayLike;

  @override
  void initState() {
    super.initState();
    _youMayLike = fetchYouMayLikeItem();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Datum>>(
      future: _youMayLike,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Datum> _newYouMayLike = snapshot.data!;
          return Container(
            color: Colors.transparent,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    child: GridView.builder(
                        physics: ScrollPhysics(),
                        itemCount: _newYouMayLike.length < 6 ? _newYouMayLike.length : 6,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.63,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      new ProductDetailPage(slug: _newYouMayLike[index].slug,)));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 10.0, top: 10.0, left: 5.0, right: 5.0),
                              child: Material(
                                elevation: 5,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    //  SizedBox(height: 30.0,),
                                    Container(
                                      height: 170,
                                      width: MediaQuery.of(context).size.width,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.network(
                                          _newYouMayLike[index].imageUrl,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 10.0, left: 5.0),
                                      child: Container(
                                        // width: 220,
                                        child: Text(_newYouMayLike[index].title,
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.grey.shade700,
                                                fontWeight: FontWeight.bold),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                      //child: Text("The bibal is a catholic book",  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                                    ),
                                    Padding(
                                      padding:
                                      EdgeInsets.only(top: 5.0, left: 5.0),
                                      child: Container(
                                        // width: 220,
                                        child: Text(_newYouMayLike[index].priceRange,
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                      //child: Text("The bibal is a catholic book",  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                                    ),
                                    Padding(
                                      padding:
                                      EdgeInsets.only(top: 5.0, left: 5.0),
                                      child: Container(
                                        // width: 220,
                                        child: Text(_newYouMayLike[index].minOrder,
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                      //child: Text("The bibal is a catholic book",  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
                                    ),

                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
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

Future<List<Datum>> fetchYouMayLikeItem() async {
  final response = await http.get(Uri.parse(
      'https://seller.sastowholesale.com/api/p/you-may-like-products'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body)['data'];
    return jsonResponse.map((data) => new Datum.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load You May Like Item');
  }
}

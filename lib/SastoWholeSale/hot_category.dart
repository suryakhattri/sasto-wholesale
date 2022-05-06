import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sasto_wholesale/CategoryDetails/category_details.dart';
import 'package:sasto_wholesale/SastoWholeSale/Models/hot_category.dart';
import 'package:http/http.dart' as http;
import 'Models/wholesaleMarketItems.dart';

class HotCategories extends StatefulWidget {
   HotCategories({Key? key}) : super(key: key);

  @override
  _HotCategoriesState createState() => _HotCategoriesState();
}

class _HotCategoriesState extends State<HotCategories> {
  late Future <List<HotCategory>>? hotCategories;

  @override
  void initState() {
    super.initState();
    hotCategories = fetchHotCategoryItem();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HotCategory>>(
      future: hotCategories,
      builder: (context, snapshot){
        if(snapshot.hasData) {
          List<HotCategory> _hotCategoryItem = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
              height: 230,
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
                itemCount: _hotCategoryItem.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              new ProductDetailPage(slug: _hotCategoryItem[index].slug,)));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0, left: 10, right: 10, bottom: 10),
                      child: Container(
                        width: 150,
                        child: Column(
                          children: [
                            Container(
                              height: 150,
                              width: 150,
                              // color: Colors.blueAccent,
                              child: Material(
                                elevation: 1,
                                borderRadius: BorderRadius.circular(10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    _hotCategoryItem[index].imageUrl,
                                    // height: constraints.maxHeight * 0.6,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              _hotCategoryItem[index].name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        } else if(snapshot.hasError){
          return Text('${snapshot.error}');
        }

        return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 20),
            child: CircularProgressIndicator(
              // backgroundColor: Colors.grey,
              //color: Colors.purple,
              // valueColor: ,
            )
        );
      },

    );
  }
}

Future<List<HotCategory>> fetchHotCategoryItem() async {
  final response = await http
      .get(Uri.parse('https://seller.sastowholesale.com/api/hot-categories'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => new HotCategory.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load Menu Item');
  }
}


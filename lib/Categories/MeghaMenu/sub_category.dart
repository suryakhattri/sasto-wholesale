import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sasto_wholesale/Categories/MeghaMenu/sub_category_model.dart';
import 'package:sasto_wholesale/Categories/MeghaMenu/category_by_product.dart';
import 'package:http/http.dart' as http;


class SubCategoryMeghaMenu extends StatefulWidget {
  const SubCategoryMeghaMenu({Key? key, required this.categoryId}) : super(key: key);

  final int categoryId;
  @override
  _SubCategoryMeghaMenuState createState() => _SubCategoryMeghaMenuState();
}

class _SubCategoryMeghaMenuState extends State<SubCategoryMeghaMenu> {
  late Future<List<SubCategoryModel>>? subCategoryItem;

  @override
  void initState() {
    super.initState();
    int slug = widget.categoryId;
    subCategoryItem = fetchSubcategoryItem(slug);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.menu),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        //elevation: 0.0,
        toolbarHeight: 70,
        title: Image.asset(
          "assets/images/logo.png",
          scale: 8,
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.arrow_back_ios_rounded,
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
      body: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            // height: 500,
            child: FutureBuilder<List<SubCategoryModel>>(
                future: subCategoryItem,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // List<Subcategory> _subMenuItem = snapshot.data!;
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10.0, bottom: 5),
                            child: Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                child: ExpansionTile(
                                  title: new Text(
                                    snapshot.data![index].name,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  children: [
                                    CategoryByProduct(subId: snapshot.data![index].id,),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
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
                }),
          )),
    );
  }
}

Future<List<SubCategoryModel>> fetchSubcategoryItem(var categoryId) async {

  var header = {'Content-type': 'application/json',
    'Accept': 'application/json',};
  final response = await http
      .get(Uri.parse('https://seller.sastowholesale.com/api/subcategories?category_id= ${categoryId}'), headers: header);
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse
        .map((data) => new SubCategoryModel.fromJson(data))
        .toList();
  } else {
    throw Exception('Failed to load Menu Item');
  }
}

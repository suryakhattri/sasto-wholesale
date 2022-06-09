import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sasto_wholesale/Categories/MeghaMenu/category_by_product_model.dart';
import 'package:sasto_wholesale/Categories/MeghaMenu/product_by_slug.dart';
import 'package:sasto_wholesale/Products/products_list.dart';
import 'package:http/http.dart' as http;


class CategoryByProduct extends StatefulWidget {
  const CategoryByProduct({Key? key, required this.subId}) : super(key: key);

  final int subId;

  @override
  _CategoryByProductState createState() => _CategoryByProductState();
}

class _CategoryByProductState extends State<CategoryByProduct> {
  late Future<List<ProductByCategoryModel>>? subCategoryProductItem;

  @override
  void initState() {
    super.initState();
    int productId = widget.subId;
    subCategoryProductItem = fetchCategoryByProductItem(productId);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      //shadowColor: Colors.red,
      child: Column(
        children: [
          Divider(
            height: 5,
            color: Colors.black,
            thickness: 0.1,
          ),
          SizedBox(
            height: 5,
          ),
          // Image.network(widget.image,height: 180,fit:BoxFit.fitWidth ,width: double.infinity,),
          FutureBuilder<List<ProductByCategoryModel>>(
            future: subCategoryProductItem,
            builder: (context, snapshot){
              if(snapshot.hasData) {
                List<ProductByCategoryModel> _productMenuItem = snapshot.data!;
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _productMenuItem.length,
                  itemBuilder: (context, index) {
                    // List<Bhajan> bhajan = alphaIndex.bhajans;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: InkWell(
                        child: Material(
                          elevation: 0,
                          child: ListTile(
                            leading: Text(_productMenuItem[index].name, style: TextStyle(
                                fontSize: 20,
                                color: Colors.black),),
                            dense: true,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  new ProductBySlug(slug: _productMenuItem[index].slug)));

                        },
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
                  )
              );
            },

          ),
        ],
      ),
    );
  }
}

Future<List<ProductByCategoryModel>> fetchCategoryByProductItem(var subId) async {
  var header = {'Content-type': 'application/json',
    'Accept': 'application/json',};

  final response = await http
      .get(Uri.parse('https://seller.sastowholesale.com/api/product-categories?subcategory_id= ${subId}'), headers: header);
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse
        .map((data) => new ProductByCategoryModel.fromJson(data))
        .toList();
  } else {
    throw Exception('Failed to load Menu Item');
  }
}

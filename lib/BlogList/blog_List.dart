import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sasto_wholesale/BlogList/Models/blog_list_model.dart';
import 'package:sasto_wholesale/BlogList/all_blog.dart';
import 'package:sasto_wholesale/BlogList/block_model.dart';
import 'package:sasto_wholesale/BlogList/blog_details_page.dart';
import 'package:sasto_wholesale/SastoWholeSale/Models/wholesaleMarketItems.dart';
import 'package:http/http.dart' as http;

class BlogList extends StatefulWidget {
  BlogList({Key? key}) : super(key: key);

  @override
  _BlogListState createState() => _BlogListState();
}

class _BlogListState extends State<BlogList> {

  late Future<BlogListModel> _blogListModel;

  @override
  void initState() {
    super.initState();
    _blogListModel = fetchBlogList();

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<BlogListModel>(
      future: _blogListModel,
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
              height: 500,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(10),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          height: 300,
                          width: 300,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  height: 200,
                                  width: 300,
                                  // color: Colors.blueAccent,
                                  child: Image.network(
                                    snapshot.data!.data[index].imageUrl,
                                    // height: constraints.maxHeight * 0.6,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Text(
                                snapshot.data!.data[index].createdAt.day.toString(),
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      snapshot.data!.data[index].createdAt.month.toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Divider(
                                  thickness: 0.5,
                                  color: Colors.black,
                                  endIndent: 200,
                                ),
                                Text(
                                  snapshot.data!.data[index].title,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  snapshot.data!.data[index].shortDescription,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 17),
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            new BlogDetailsPage(slug: snapshot.data!.data[index].slug,)));
                                  },
                                  child: Row(
                                    //mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Read More",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width: 5,),
                                      Icon(Icons.arrow_forward_ios, size: 20, color: Colors.red,)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
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
          height: 0,
        );

      });

  }
}

Future <BlogListModel> fetchBlogList() async {
  final response = await http.get(Uri.parse(
      'https://seller.sastowholesale.com/api/all-blogs'));
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    print("${response.body}");
    return new BlogListModel.fromJson(jsonResponse);
  } else {
    throw Exception('Failed to load data');
  }
}

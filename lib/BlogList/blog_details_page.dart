import 'dart:convert';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sasto_wholesale/BlogList/Models/blog_details_model.dart';
import 'package:sasto_wholesale/BlogList/Models/blog_list_model.dart';
import 'package:sasto_wholesale/BlogList/blog_List.dart';


class BlogDetailsPage extends StatefulWidget {
  const BlogDetailsPage({Key? key, required this.slug}) : super(key: key);
  final String slug;


  @override
  _BlogDetailsPageState createState() => _BlogDetailsPageState();
}

class _BlogDetailsPageState extends State<BlogDetailsPage> {

  late Future<BlogDetailsModel> _blogDetailsModel;
  late Future<BlogListModel> _blogListModel;

  @override
  void initState() {
    super.initState();
    _blogListModel = fetchBlogList();
    _blogDetailsModel = fetchBlogDetails(widget.slug);
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FutureBuilder<BlogDetailsModel>(
            future: _blogDetailsModel,
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding:
                          const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                          child: Container(
                            child: Column(
                              children: [
                                Text(
                                  snapshot.data!.data.title,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  height: 300,
                                  // color: Colors.blueAccent,
                                  child: Material(
                                    elevation: 1,
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      snapshot.data!.data.imageUrl,
                                      // height: constraints.maxHeight * 0.6,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: Icon(
                                              Icons.date_range,
                                              size: 20,
                                              color: Colors.red,
                                            ),
                                          ),
                                          TextSpan(
                                            text: snapshot.data!.data.createdAt.year.toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: "Posted By:",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                        children: const <TextSpan>[
                                          TextSpan(
                                            text: 'Admin',
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Center(
                                  child: Html(
                                    data: snapshot.data!.data.description != null
                                        ? snapshot.data!.data.description
                                    /*_parseHtmlString(payload.body)*/
                                        : "",
                                  ),
                                ),

                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    _otherBlog(),
                  ],
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

  Widget _otherBlog() {
    return FutureBuilder<BlogListModel>(
        future: _blogListModel,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return  Padding(
              padding: const EdgeInsets.all(5.0),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                      child: Text(
                        "Other Blogs",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListView.builder(
                        itemCount: 3,
                        itemExtent: 150,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, index) {
                          return Card(
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left:10.0, right: 10, top:10, bottom: 10),
                                    child: Container(
                                      // height: 100,
                                        width: 120,
                                        child: Image.network(snapshot.data!.data[index].imageUrl)),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.only(left: 5, top: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            snapshot.data!.data[index].title,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 5.0),
                                            child: Text(
                                              snapshot.data!.data[index].shortDescription,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: "Read More",
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 17,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                                WidgetSpan(
                                                  child: Icon(
                                                    Icons.arrow_forward_ios,
                                                    size: 20,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Center(
            child: CircularProgressIndicator(
             // height: 0,
            ),
          );

        });
  }
}

Future<BlogDetailsModel> fetchBlogDetails(String slug) async {
  var url = 'https://seller.sastowholesale.com/api/single-blog/';
  final response = await http.get(Uri.parse(url + slug));
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    print("${response.body}");
    return  new BlogDetailsModel.fromJson(jsonResponse);
  } else {
    throw Exception('Failed to load Profile');
  }
}
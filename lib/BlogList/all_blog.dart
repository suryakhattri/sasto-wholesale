import 'package:flutter/material.dart';
import 'package:sasto_wholesale/BlogList/block_model.dart';
import 'package:sasto_wholesale/BlogList/blog_details_page.dart';

class AllBlog extends StatefulWidget {
  const AllBlog({Key? key}) : super(key: key);

  @override
  _AllBlogState createState() => _AllBlogState();
}

class _AllBlogState extends State<AllBlog> {
  final List<BlockModel> _items = [
    BlockModel(
      name: "Do you know wholsale are making profit",
      url: 'assets/images/blog.jpeg',
      day: "26",
      month: "Jan",
      description:
          'Quisque consectetur convallis ex, quis tincidunt ligula placerat et. Nam quis leo sed tortor blandit commodo. Quisque ultrices, justo non convallis accumsan, ante magna ornare sapien, quis venenatis diam libero nec orci. Aenean semper interdum odio in dictum. Nunc sed augue lorem.',
    ),
    BlockModel(
      name: "Do you know wholsale are making profit",
      url: 'assets/images/blog.jpeg',
      day: "28",
      month: "march",
      description:
          'Quisque consectetur convallis ex, quis tincidunt ligula placerat et. Nam quis leo sed tortor blandit commodo. Quisque ultrices, justo non convallis accumsan, ante magna ornare sapien, quis venenatis diam libero nec orci. Aenean semper interdum odio in dictum. Nunc sed augue lorem.',
    ),
    BlockModel(
      name: "Do you know wholsale are making profit",
      url: 'assets/images/blog.jpeg',
      day: "2",
      month: "Dec",
      description:
          'Quisque consectetur convallis ex, quis tincidunt ligula placerat et. Nam quis leo sed tortor blandit commodo. Quisque ultrices, justo non convallis accumsan, ante magna ornare sapien, quis venenatis diam libero nec orci. Aenean semper interdum odio in dictum. Nunc sed augue lorem.',
    ),
    BlockModel(
      name: "Do you know wholsale are making profit",
      url: 'assets/images/blog.jpeg',
      day: "26",
      month: "Feb",
      description:
          'Quisque consectetur convallis ex, quis tincidunt ligula placerat et. Nam quis leo sed tortor blandit commodo. Quisque ultrices, justo non convallis accumsan, ante magna ornare sapien, quis venenatis diam libero nec orci. Aenean semper interdum odio in dictum. Nunc sed augue lorem.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Our Blogs",
          style: TextStyle(color: Colors.black),
        )),
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              icon: Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              });
        }),
        //elevation: 0.0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
         //  height: 900,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: _items.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //         new ProductDetailPage()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            // color: Colors.blueAccent,
                            child: Image.asset(
                              _items[index].url,
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
                                _items[index].day,
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                _items[index].month,
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
                            endIndent: 250,
                          ),
                          Text(
                            _items[index].name,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            _items[index].description,
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
                                          new BlogDetailsPage()));
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
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 20,
                                  color: Colors.red,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BlogDetailsPage extends StatefulWidget {
  const BlogDetailsPage({Key? key}) : super(key: key);

  @override
  _BlogDetailsPageState createState() => _BlogDetailsPageState();
}

class _BlogDetailsPageState extends State<BlogDetailsPage> {
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
        child: Column(
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
                          "Do you know wholsale are making profit from online",
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
                            child: Image.asset(
                              "assets/images/blog.jpeg",
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
                                    text: "27 Dec 2022",
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
                        Text(
                          "Quisque consectetur convallis ex, quis tincidunt ligula placerat et. Nam quis leo sed tortor blandit commodo. Quisque ultrices, justo non convallis accumsan, ante magna ornare sapien, quis venenatis diam libero nec orci. Aenean semper interdum odio in dictum. Nunc sed augue lorem. Duis nec sollicitudin orci. Vivamus lectus metus, efficitur non arcu id, pulvinar sollicitudin ipsum. Nunc sed consectetur risus. Morbi tincidunt lorem non iaculis bibendum vestibulum ante vitae pulvinar sollicitudin semper interdum odio in dictum.Proin ullamcorper pretium orci. Donec nec scelerisque leo. Nam massa dolor, imperdiet nec consequat a, congue id sem. Maecenas malesuada faucibus finibus. Donec vitae libero porttitor, laoreet sapien a, ultrices leo. Duis dictum vestibulum ante vitae ullamcorper. Phasellus ullamcorper, odio vitae eleifend ultricies, lectus orci congue magna vestibulum ante vitaevitae eleifend ultricies.",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
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
        ),
      ),
    );
  }

  Widget _otherBlog() {
    return Padding(
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
                                child: Image.asset('assets/images/blog.jpeg')),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: 5, top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Sasto wholsale is...",
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
                                      "Quisque consectetur convallis ex, quis tincidunt ligula placerat et. Nam quis leo sed tortor blandit commodo. Quisque",
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
  }
}

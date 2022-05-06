import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() =>
      _NotificationPageState(title: "", description: "", image: "", date: "");
}

class _NotificationPageState extends State<NotificationPage> {
  final String date;
  final String title;
  final String image;
  final String description;

  _NotificationPageState(
      {required this.title,
      required this.date,
      required this.image,
      required this.description});

  @override
  Widget build(BuildContext context) {
    final notificationData = [
      _NotificationPageState(
          title: "Notification Title",
          date: "20/20/2021",
          image: "assets/images/shoe_thumb_1.png",
          description: "abcdef"),
      _NotificationPageState(
          title: "Notification Title",
          date: "20/20/2021",
          image: "assets/images/shoe_thumb_2.png",
          description: "abcdef"),
      _NotificationPageState(
          title: "Notification Title",
          date: "20/20/2021",
          image: "assets/images/shoe_thumb_3.png",
          description: "abcdef"),
      _NotificationPageState(
          title: "Notification Title",
          date: "20/20/2021",
          image: "assets/images/shoe_thumb_4.png",
          description: "abcdef"),
      _NotificationPageState(
          title: "Notification Title",
          date: "20/20/2021",
          image: "assets/images/shoe_thumb_3.png",
          description: "abcdef"),
      _NotificationPageState(
          title: "Notification Title",
          date: "20/20/2021",
          image: "assets/images/shoe_thumb_5.png",
          description: "abcdef"),
      _NotificationPageState(
          title: "Notification Title",
          date: "20/20/2021",
          image: "assets/images/shoe_thumb_1.png",
          description: "abcdef"),
      _NotificationPageState(
          title: "Notification Title",
          date: "20/20/2021",
          image: "",
          description: "abcdef"),
      _NotificationPageState(
          title: "Notification Title",
          date: "20/20/2021",
          image: "assets/images/shoe_thumb_2.png",
          description: "abcdef"),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Notification",
          style: TextStyle(color: Colors.red),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.shopping_cart,
              color: Colors.red,
              size: 25,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              ListView.builder(
                  itemCount: notificationData.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext, index) {
                    return Card(
                      // contentPadding: EdgeInsets.all(0),
                      //tileColor: Colors.black12,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  notificationData[index].date,
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text(
                                  notificationData[index].title,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5,),
                                Text(
                                  notificationData[index].description,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: CircleAvatar(
                              // backgroundColor: Colors.transparent,
                              child: Image.asset(
                                notificationData[index].image,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // subtitle: Column(
                      //   children: [
                      //     Text(notificationData[index].title),
                      //     Text(notificationData[index].description),
                      //   ],
                      // ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sasto_wholesale/Chat/chat_details.dart';
import 'package:sasto_wholesale/Chat/chat_list_model.dart';
import 'package:sasto_wholesale/Login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  late Future<ChatListModel> _chatListModel;

  @override
  void initState() {
    super.initState();
    checkLogin();
    _chatListModel = fetchChatList();
  }

  void checkLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? loginToken = preferences.getString("login_token");
    if (loginToken == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Login()), (route) => false);
      //  Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationDataItems()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: FutureBuilder<ChatListModel>(
            future: _chatListModel,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SafeArea(
                      child: Padding(
                        padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                        child: Text(
                          "Conversations",
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    ListView.builder(
                      itemCount: snapshot.data!.data.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 16),
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => new ChatDetails(
                                          chatData: snapshot.data!.data[index], userId: snapshot.data!.data[index].customerUserId,
                                      vendorId: snapshot.data!.data[index].vendorUserId,

                                        )));
                          },
                          child: Card(
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 16, right: 16, top: 10, bottom: 10),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Row(
                                      children: <Widget>[
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(snapshot
                                              .data!
                                              .data[index]
                                              .opponent
                                              .avatarUrl),
                                          maxRadius: 30,
                                        ),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Expanded(
                                          child: Container(
                                            color: Colors.transparent,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  snapshot.data!.data[index]
                                                      .opponent.name,
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                Text(
                                                  snapshot.data!.data[index]
                                                      .lastMessageAt,
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color:
                                                          Colors.grey.shade600,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Text(
                                  //   widget.time,
                                  //   style: TextStyle(
                                  //       fontSize: 12,
                                  //       fontWeight: widget.isMessageRead
                                  //           ? FontWeight.bold
                                  //           : FontWeight.normal),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 20),
                //child: CircularProgressIndicator(
                // backgroundColor: Colors.grey,
                //color: Colors.purple,
                // valueColor: ,
              );
            }),
      ),
    );
  }
}

// class ConversationList extends StatefulWidget {
//   String name;
//   String messageText;
//   String imageUrl;
//   String time;
//   bool isMessageRead;
//
//   ConversationList(
//       {required this.name,
//       required this.messageText,
//       required this.imageUrl,
//       required this.time,
//       required this.isMessageRead});
//
//   @override
//   _ConversationListState createState() => _ConversationListState();
// }
//
// class _ConversationListState extends State<ConversationList> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) =>
//                 new ChatDetails()));
//       },
//       child: Container(
//         padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
//         child: Row(
//           children: <Widget>[
//             Expanded(
//               child: Row(
//                 children: <Widget>[
//                   CircleAvatar(
//                     backgroundImage: AssetImage(widget.imageUrl),
//                     maxRadius: 30,
//                   ),
//                   SizedBox(
//                     width: 16,
//                   ),
//                   Expanded(
//                     child: Container(
//                       color: Colors.transparent,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Text(
//                             widget.name,
//                             style: TextStyle(fontSize: 16),
//                           ),
//                           SizedBox(
//                             height: 6,
//                           ),
//                           Text(
//                             widget.messageText,
//                             style: TextStyle(
//                                 fontSize: 13,
//                                 color: Colors.grey.shade600,
//                                 fontWeight: widget.isMessageRead
//                                     ? FontWeight.bold
//                                     : FontWeight.normal),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Text(
//               widget.time,
//               style: TextStyle(
//                   fontSize: 12,
//                   fontWeight: widget.isMessageRead
//                       ? FontWeight.bold
//                       : FontWeight.normal),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//Fetch Api
Future<ChatListModel> fetchChatList() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? loginToken = preferences.getString("login_token");

  var header = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $loginToken'
  };

  final response = await http.get(
      Uri.parse("https://seller.sastowholesale.com/api/chatrooms"),
      headers: header);
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    print("data: ${jsonResponse}");
    return new ChatListModel.fromJson(jsonResponse);
  } else {
    throw Exception('Failed to load chat list Item');
  }
}

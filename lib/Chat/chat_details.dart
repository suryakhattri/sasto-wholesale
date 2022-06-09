import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sasto_wholesale/Chat/chat_details_model.dart';
import 'package:sasto_wholesale/Chat/chat_list_model.dart';
import 'package:sasto_wholesale/Chat/chat_message_model.dart';
import 'package:sasto_wholesale/Chat/conversation.dart';
import 'package:sasto_wholesale/Chat/message_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ChatDetails extends StatefulWidget {
  const ChatDetails({Key? key, required this.chatData, required this.userId, required this.vendorId}) : super(key: key);
  final ChatData chatData;
  final int userId;
  final int vendorId;

  @override
  _ChatDetailsState createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  final ScrollController _scrollController = new ScrollController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {'message': ''};

  void sendMessage(conversation, controller, user) {
    _formKey.currentState!.save();

    conversation.sendMessage(_formData['message'], user.id);
    controller.clear();

    _scrollController.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }

  bool isLoading = true;
  late Future<ChatDetailsModel> _chatDetailsModel;
  late Future<List<Datum>> _messageModel;
  final _key = UniqueKey();

  @override
  void initState() {
    super.initState();
    //checkLogin();
    _chatDetailsModel = fetchChatDetails(widget.userId, widget.vendorId);
    _messageModel = fetchChatMessage();
  }


  @override
  Widget build(BuildContext context) {
   // final Conversation conversation = Provider.of<Conversation>(context);
    final TextEditingController _controller = new TextEditingController();

    //conversation.bindEvent(widget.chatData.id, 'onMessage');
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: FutureBuilder<ChatDetailsModel>(
              future: _chatDetailsModel,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    padding: EdgeInsets.only(right: 16),
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        CircleAvatar(
                          backgroundImage:
                          NetworkImage(snapshot.data!.data.opponent.avatarUrl),
                          maxRadius: 20,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                snapshot.data!.data.opponent.name,
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                snapshot.data!.data.lastMessageAt,
                                style: TextStyle(color: Colors.green, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.more_vert,
                          color: Colors.grey.shade700,
                        ),
                      ],
                    ),
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
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: ListView.builder(
                  controller: _scrollController,
                  reverse: true,
                  padding: EdgeInsets.only(top: 15.0),
                  //itemCount: conversation.messages.length,
                  itemBuilder: (BuildContext context, int index) {
                   // final Message message = conversation.messages[index];

                    return ListTile(
                     // title: Text(message.text),
                    //  subtitle: Text(message.sender + ' · ' + message.time),
                    );
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              height: 70.0,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      child: Icon(Icons.add_circle, size: 30,color: Colors.grey[700],),
                    ),
                  ),
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: _controller,
                        textCapitalization: TextCapitalization.sentences,
                        onSaved: (String? value) {
                          _formData['message'] = value;
                        },
                        decoration: InputDecoration.collapsed(
                          hintText: 'Type a message...',
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    iconSize: 25.0,
                    color: Colors.blue,
                    onPressed: () {
                     // sendMessage(conversation, _controller, widget.chatData);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
//Fetch Api
Future<ChatDetailsModel> fetchChatDetails(var user_id, var vendor_id) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? loginToken = preferences.getString("login_token");

  var header = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $loginToken'
  };

  final response = await http.get(
      Uri.parse("https://seller.sastowholesale.com/api/chats/start?customer_user_id=${user_id.toString()}&vendor_user_id=${vendor_id.toString()}&last_message_id=39"),
      headers: header);
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    print("data: ${jsonResponse}");
    return new ChatDetailsModel.fromJson(jsonResponse);
  } else {
    throw Exception('Failed to load chat Item');
  }
}

//Fetch Api
Future<List<Datum>> fetchChatMessage() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? loginToken = preferences.getString("login_token");

  var header = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $loginToken'
  };

  final response = await http.get(
      Uri.parse("https://seller.sastowholesale.com/api/chats/9c842e8d-6a05-48cd-a5cc-ae000e48b8b3/messages"),
      headers: header);
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body)["data"];
    print("data: ${jsonResponse}");
    print("surya:${jsonResponse}");
    return jsonResponse
        .map((data) => new Datum.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load chat Item');
  }
}
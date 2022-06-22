import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sasto_wholesale/Chat/ChatRoom/chat_room_model.dart';
import 'package:sasto_wholesale/Chat/chat_details_model.dart';
import 'package:sasto_wholesale/Chat/chat_list_model.dart';
import 'package:sasto_wholesale/Chat/chat_message_model.dart';
import 'package:sasto_wholesale/Chat/chat_provider.dart';
import 'package:sasto_wholesale/Chat/model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ChatDetails extends StatefulWidget {
  const ChatDetails(
      {Key? key,
      required this.id,
      // required this.chatData,
      required this.userId,
      required this.vendorId})
      : super(key: key);
 // final ChatData chatData;
  final int userId;
  final int vendorId;
  final String id;

  @override
  _ChatDetailsState createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  final ScrollController _scrollController = new ScrollController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late Timer timer;

//  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
 // final Map<String, dynamic> _formData = {'message': ''};

  // void sendMessage(conversation, controller, user) {
  //   _formKey.currentState!.save();
  //
  //    conversation.sendMessage(_formData['message'], user.id);
  //   controller.clear();
  //
  //   _scrollController.animateTo(
  //     0.0,
  //     curve: Curves.easeOut,
  //     duration: const Duration(milliseconds: 300),
  //   );
  // }

  bool isLoading = true;
  late Future<ChatDetailsModel> _chatDetailsModel;
  late Future<MessageModel> _messageModel;
 // late Future<ChatRoomModel> _chatRoomModel;
  final _key = UniqueKey();
  late ChatProvider chatProvider;
  final TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
    //checkLogin();
    _chatDetailsModel = fetchChatDetails(widget.userId, widget.vendorId);
    _messageModel = fetchChatMessage(widget.id);
    timer = Timer.periodic(Duration(seconds: 3), (Timer t) => setState(() {
      callApi();

    }));

   // chatProvider.init();
    //_chatRoomModel = sendMessageFromUser(widget.id, _controller.text);

  }

  void callApi() {
    setState(() {
      _messageModel = fetchChatMessage(widget.id);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      _messageListView();
    });
  }


  @override
  Widget build(BuildContext context) {
    final String time = DateFormat('mm:ss a').format(DateTime.now());
    chatProvider = Provider.of<ChatProvider>(context, listen: false);

    // chatProvider.sendMessage(1,
    //     widget.id,
    //     widget.userId,
    //     '',
    //     '',
    //     '',
    //     "text",
    //     _controller.text);
    // final Conversation conversation = Provider.of<Conversation>(context);
    final picker = ImagePicker();
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
                          backgroundImage: NetworkImage(
                              snapshot.data!.data.opponent.avatarUrl),
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
                                style: TextStyle(
                                    color: Colors.green, fontSize: 12),
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
      body: _messageListView(),
    );
  }

  _messageListView() {
    return FutureBuilder<MessageModel>(
        future: _messageModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: _refresh,
                    child: ListView.builder(
                        reverse: true,
                        padding: EdgeInsets.all(10),
                        itemCount: snapshot.data!.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          final Datum message = snapshot.data!.data[index];
                          final bool isMe =
                              snapshot.data!.data[index].senderId ==
                                  widget.userId;
                          return _chatBubble(message, isMe);
                        }),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  height: 70,
                  color: Colors.white,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.photo),
                        iconSize: 25,
                        color: Theme.of(context).primaryColor,
                      ),
                      Expanded(
                        child: Form(
                          key: _formKey,
                          child: TextFormField(
                            // onSaved: (String? value){
                            //   _formData['message'] = value;
                            // },
                            controller: _controller,
                            decoration: InputDecoration.collapsed(
                                hintText: "Enter text here..."),
                            textCapitalization: TextCapitalization.sentences,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          chatProvider.triggerEvent(widget.id, _controller.text);
                          // chatProvider.sendMessage(widget.userId,
                          //     widget.id,
                          //     1,
                          //     '',
                          //     '',
                          //     '',
                          //     "text",
                          //     _controller.text);
                          setState(() {
                            _controller.clear();
                            FocusManager.instance.primaryFocus?.unfocus();

                          });
                        },
                        icon: Icon(Icons.send),
                        iconSize: 25,
                        color: Theme.of(context).primaryColor,
                      )
                    ],
                  ),
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
        });
  }

  _chatBubble(Datum message, bool isMe) {
    if (isMe) {
      return Column(
        children: [
          message.type == "text"
              ? Container(
                  alignment: Alignment.topRight,
                  child: Container(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.80),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                          )
                        ]),
                    child: Text(
                      message.message,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              : message.type == "file"
                  ? Container(
                      child: message.fileUrl != null
                          ? new Image.network(
                              message.fileUrl,
                              height: 200,
                              width: 400,
                            )
                          : new Container(),
                    )
                  : Container(
                      alignment: Alignment.topRight,
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.80,
                        ),
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                              )
                            ]),
                        child: Column(
                          children: [
                            Image.network(
                              message.product?.imageUrl ?? '',
                              height: 100,
                              width: 100,
                            ),
                            Text(
                              message.product?.title ?? '',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(message.product?.priceRange ?? ''),
                          ],
                        ),
                      ),
                    )
        ],
      );
    } else {
      return Column(
        children: [
          message.type == "text"
              ? Container(
                  alignment: Alignment.topLeft,
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.80,
                    ),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                          )
                        ]),
                    child: Text(message.message),
                  ),
                )
              : message.type == "file"
                  ? Container(
                      child: message.fileUrl != null
                          ? new Image.network(
                              message.fileUrl,
                              height: 200,
                              width: 400,
                            )
                          : new Container(),
                    )
                  : message.product != null ? Container(
                      alignment: Alignment.topLeft,
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.80,
                        ),
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                              )
                            ]),
                        child: Text(message.product?.title ?? ''),
                      ),
                    ): Container()
        ],
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
        Uri.parse(
            "https://seller.sastowholesale.com/api/chats/start?customer_user_id=${user_id.toString()}&vendor_user_id=${vendor_id.toString()}&last_message_id=39"),
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
  Future<MessageModel> fetchChatMessage(String chatRoomId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? loginToken = preferences.getString("login_token");

    var header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $loginToken'
    };

    final response = await http.get(
        Uri.parse(
            "https://seller.sastowholesale.com/api/chats/${chatRoomId.toString()}/messages"),
        headers: header);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print("data: ${jsonResponse}");
      print("surya:${jsonResponse}");
      return new MessageModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load chat Item');
    }
  }
}

Future<ChatRoomModel> sendMessageFromUser(String chatId, String message) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? loginToken = preferences.getString("login_token");

  var header = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $loginToken'
  };

  final response = await http.post(
      Uri.parse("https://seller.sastowholesale.com/api/messages/${chatId}?message=${message}&ts=10"),
      headers: header);
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
   // print("data: ${jsonResponse}");
    return new ChatRoomModel.fromJson(jsonResponse);
  } else {
    throw Exception('failed to post chat');
  }
}

Future<void> _refresh() {
  return Future.delayed(Duration(seconds: 0));
}

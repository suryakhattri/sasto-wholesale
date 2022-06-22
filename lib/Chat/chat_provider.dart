import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:pusher_client/pusher_client.dart';
import 'package:sasto_wholesale/Chat/ChatRoom/chat_room_model.dart';
import 'package:sasto_wholesale/Chat/chat_details.dart';
import 'package:sasto_wholesale/Chat/chat_message_model.dart';
import 'package:sasto_wholesale/Chat/model.dart';
import 'package:sasto_wholesale/DBHelper/db_helper.dart';
//import 'package:sasto_wholesale/Chat/web_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../utils/string_constants.dart';

class ChatProvider with ChangeNotifier {

  DBHelper? dbHelper = DBHelper();
  late PusherClient pusher;
  late Channel channel;
   late String _message;
   String get message => _message;

  List<ChatRoomData> messages = [];

  void sendMessage(int id, String chatRoomId, int senderId, String readAt,
      String key, String createdAt, String type, String message) {
    final String time = DateFormat('mm:ss a').format(DateTime.now());

    if(messages != ''){
      messages.insert(0,
        ChatRoomData(
            id: id,
            chatRoomId: chatRoomId,
            senderId: senderId,
            readAt: readAt,
            key: key,
            createdAt: createdAt,
            type: type,
            message: message
        ),
      );
      sendMessageFromUser(chatRoomId, message);
      //.broadcast(ChatRoomData.to(uuid, text, time));
      notifyListeners();
    }
  }

  // late Future<List<ChatRoomData>?> messages;
  //
  // Future<List<ChatRoomData>?> get messageList => messages;
  // // late Future<List<CartModel>?> _cartList;
  //
  // Future<List<ChatRoomData>?> getData() async {
  //   messages = dbHelper!.getChatList();
  //   notifyListeners();
  //   return messages;
  // }

  // void addChat(int id, String chatRoomId, int senderId, String readAt,
  //     String key, DateTime createdAt, String type, String message){
  //   dbHelper?.insertChat(ChatRoomData(id: id,
  //       chatRoomId: chatRoomId,
  //       senderId: senderId,
  //       readAt: readAt,
  //       key: key,
  //       createdAt: createdAt,
  //       type: type,
  //       message: message));
  // }



  init() {
    initPlatformState();
  }

  initPlatformState() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? loginToken = preferences.getString("login_token");

    pusher = new PusherClient(
      apiKey,
      PusherOptions(
        // if local on android use 10.0.2.2
        // host: 'localhost',
        encrypted: false,
        cluster: cluster,
        auth: PusherAuth(
          'https://seller.sastowholesale.com/broadcasting/auth',
          headers: {
            'Authorization': 'Bearer $loginToken',
          },
        ),
      ),

      enableLogging: true,
    );
    pusher.connect();
    channel = pusher.subscribe("b2b");
    channel =
        pusher.subscribe("presence-chat-channel-9c842e8d-6a05-48cd-a5cc-ae000e48b8b3");

    pusher.onConnectionStateChange((state) {
      log("previousState: ${state?.previousState}, currentState: ${state?.currentState}");
    });

    pusher.onConnectionError((error) {
      log("error: ${error?.message}");
    });

    channel.bind('status-update', (event) {
      log("${event?.data}");
    });

    channel.bind("new-message",(event) {
       // print("Surya: ${message?.data}");
      log("${event?.data}");
    });

    channel.bind("pusher:subscription_succeeded", (event) {
      channel.trigger("client-istyping", messages);
    });


    channel.bind('order-filled', (event) {
      log("Order Filled Event ${event?.data}");
    });

  }


  triggerEvent(String chatRoomId, String message ) {
    sendMessageFromUser(chatRoomId, message);
    notifyListeners();
    // sendMessage(id,
    //     userId,
    //     sendorId,
    //     '',
    //     '',
    //     createdAt,
    //     'text',
    //     message);

    // channel.bind("pusher:subscription_succeeded", (event) {
    //   channel.trigger("client-istyping", { "Data": {
    //     "message": {
    //       "id": 100,
    //       "chat_room_id": "9c842e8d-6a05-48cd-a5cc-ae000e48b8b3",
    //       "sender_id": 4,
    //       "read_at": null,
    //       "key": null,
    //       "created_at": "2022-06-17T07:32:40.000000Z",
    //       "type": "text",
    //       "message": "no"
    //     }
    //   }
    //   });
    // });
 }
}
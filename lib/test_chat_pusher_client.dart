import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pusher_client/pusher_client.dart';
import 'package:sasto_wholesale/utils/string_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Chat/chat_details.dart';
import 'Chat/chat_list_model.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late PusherClient pusher;
  late Channel channel;

  @override
  void initState() {
    super.initState();

    String token = getToken();

  }

getToken() async {
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

    channel = pusher.subscribe("b2b");
    channel = pusher.subscribe("chat-channel-9c842e8d-6a05-48cd-a5cc-ae000e48b8b3");

    pusher.onConnectionStateChange((state) {
      log("previousState: ${state?.previousState}, currentState: ${state?.currentState}");
    });

    pusher.onConnectionError((error) {
      log("error: ${error?.message}");
    });

    channel.bind('status-update', (event) {
      log("${event?.data}");
    });

    channel.bind('order-filled', (event) {
      log("Order Filled Event ${event?.data}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example Pusher App'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff03dac6),
        foregroundColor: Colors.black,
        onPressed: () {
          var data = {
            "id": "9c842e8d-6a05-48cd-a5cc-ae000e48b8b3",
            "customer_user_id": 9,
            "vendor_user_id": 4,
            "last_message_at": "10 hrs ago",
            "updated_at": "2022-06-14T05:15:53.000000Z",
            "opponent": {
              "id": 4,
              "name": "Royal Sample House",
              "avatar_url":
              "https://ui-avatars.com/api/?name=Royal+Sample+House&background=0D8ABC&color=fff&rounded=1"
            },
            "has_unseen_messages": true,
            "last_message_id": 40
          };
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => new ChatDetails(
                    chatData: testFromJson(jsonEncode(data)),
                    userId: 9,
                    vendorId: 4,
                  )));
          // Respond to button press
        },
        child: Icon(Icons.add),
      ),
      body: Center(
          child: Column(
            children: [
              ElevatedButton(
                child: Text('Unsubscribe Private Orders'),
                onPressed: () {
                  pusher.unsubscribe('private-orders');
                },
              ),
              ElevatedButton(
                child: Text('Unbind Status Update'),
                onPressed: () {
                  channel.unbind('status-update');
                },
              ),
              ElevatedButton(
                child: Text('Unbind Order Filled'),
                onPressed: () {
                  channel.unbind('order-filled');
                },
              ),
              ElevatedButton(
                child: Text('Bind Status Update'),
                onPressed: () {
                  channel.bind('status-update', (event) {
                    log("Status Update Event ${event?.data}");
                  });
                },
              ),
              ElevatedButton(
                child: Text('Trigger Client Typing'),
                onPressed: () {
                  channel.trigger('presence-chat-channel-9c842e8d-6a05-48cd-a5cc-ae000e48b8b3', {
                    "message":"Hello",
                    "ts":"10"
                  });
                },
              ),
            ],
          )),
    );
  }
}
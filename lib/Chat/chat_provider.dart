import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:pusher_client/pusher_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/string_constants.dart';

class ChatProvider with ChangeNotifier {
  late PusherClient pusher;
  late Channel channel;

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

    channel.bind("new-message",(event){
      log("${event?.data}");
    });

    channel.bind("pusher:subscription_succeeded", (event) {
      channel.trigger("client-istyping", {"name": "Bob"});
    });

    channel.bind('order-filled', (event) {
      log("Order Filled Event ${event?.data}");
    });
  }

  triggerEvent() {
    // api hit from here
  }
}

/*import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/string_constants.dart';

class ChatProvider with ChangeNotifier {
  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
  String? loginToken;

  init() {
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    loginToken = preferences.getString("login_token");
    try {
      */ /*await pusher.init(
          apiKey: apiKey,
          cluster: cluster
      );
      final myChannel = await pusher.subscribe(
          channelName: "my-channel",
          onEvent: onEvent
      );
      await pusher.connect();*/ /*

      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? loginToken = preferences.getString("login_token");
      await pusher.init(
        useTLS: true,
        apiKey: apiKey,
        cluster: cluster,
        onConnectionStateChange: onConnectionStateChange,
        onError: onError,
        onSubscriptionSucceeded: onSubscriptionSucceeded,
        onEvent: onEvent,
        onSubscriptionError: onSubscriptionError,
        onDecryptionFailure: onDecryptionFailure,
        onMemberAdded: onMemberAdded,
        onMemberRemoved: onMemberRemoved,
        // authEndpoint: "https://seller.sastowholesale.com/broadcasting/auth",
        onAuthorizer: onAuthorizer,
        */ /*authParams: {
            "header": {
              "Authorization": "Bearer $loginToken",
              "authorization": "Bearer $loginToken",
              "accept": "application/json"
            }
          }*/ /*
      );
      // final myChannel = await pusher.subscribe(channelName: 'b2b');
      */ /*final myChannel = await pusher.subscribe(
        channelName: 'b2b',
        onSubscriptionSucceeded: (dynamic channelName, dynamic data) {
          print("Subscribed to $channelName");
          // print("I can now access me: ${myChannel.me}");
          // print("And here are the channel members: ${myChannel.members}");
        },
        onMemberAdded: (member) {
          print("Member added: $member");
        },
        onMemberRemoved: (member) {
          print("Member removed: $member");
        },
        onEvent: (event) {
          print("Event received: $event");
        },
      );*/ /*
      await pusher.connect();
    } catch (e) {
      log("ERROR: $e");
    }
  }

  subscribe(String channelId) async {
    await pusher.subscribe(
      channelName: "private-chat-channel-${channelId}",
      // onEvent: onEvent,
      // onSubscriptionSucceeded: onSubscriptionSucceeded,
    );
  }

  triggerEvent(userId, channelId) async {
    try {
      await pusher.trigger(PusherEvent(
          channelName: "private-chat-channel-${channelId}",
          eventName: "client-new-message-event",
          data: '{message: this.newMessage,type: "text",ts: ts,}',
          userId: userId.toString()));
      log("success");
    } catch (e) {
      log(e.toString());
    }
  }

  void onConnectionStateChange(dynamic currentState, dynamic previousState) {
    log("Connection: $currentState");
  }

  void onError(String message, int? code, dynamic e) {
    log("onError: $message code: $code exception: $e");
  }

  void onEvent(PusherEvent event) {
    log("onEvent: $event");
  }

  void onSubscriptionSucceeded(String channelName, dynamic data) {
    log("onSubscriptionSucceeded: $channelName data: $data");
    final me = pusher.getChannel(channelName)?.me;
    log("Me: $me");
  }

  void onSubscriptionError(String message, dynamic e) {
    log("onSubscriptionError: $message Exception: $e");
  }

  void onDecryptionFailure(String event, String reason) {
    log("onDecryptionFailure: $event reason: $reason");
  }

  void onMemberAdded(String channelName, PusherMember member) {
    log("onMemberAdded: $channelName user: $member");
  }

  void onMemberRemoved(String channelName, PusherMember member) {
    log("onMemberRemoved: $channelName user: $member");
  }

  dynamic onAuthorizer(String channelName, String socketId, dynamic options) {
    return {
      "socket_id": socketId,
      "channel_name": channelName,
      "channel_data": '{"user_id": 9}',
      "header": {
        "hello": "test hello world",
        "Authorization": "Bearer $loginToken",
        "authorization": "Bearer $loginToken",
        "accept": "application/json"
      }
    };
  }
}*/

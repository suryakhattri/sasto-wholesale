
// import 'dart:convert';
//
// import 'package:sasto_wholesale/Chat/resourse.dart';
//
// class Message {
//   final String sender;
//   final String time;
//   final String text;
//
//   Message({
//     required this.sender,
//     required this.time,
//    required this.text
//   });
//
//   static Resource to(String uuid, String text, String time) {
//     return Resource(
//         url: 'chat/'+ uuid,
//         data: {
//           'time': time,
//           'body': text
//         },
//         parse: (response){
//           return Message.fromJson(
//               json.decode(response.body)
//           );
//         }, token: ''
//     );
//   }
//
//   factory Message.fromJson(Map<String, dynamic> json){
//     return Message(
//       sender: json['sender'],
//       time: json['time'],
//       text: json['text'],
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     'sender' : sender,
//     'time' : time,
//     'text' : text,
//   };
// }
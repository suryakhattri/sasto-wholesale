import 'package:sasto_wholesale/Chat/resourse.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Webservice
 {
   static Future load(Resource resource) async{
     SharedPreferences prefs = await SharedPreferences.getInstance();
     String? token = prefs.getString('login_token');

     http.Response response = await http.get(Uri.parse('https://staging.sastowholesale.com/api/chats/9c842e8d-6a05-48cd-a5cc-ae000e48b8b3/messages${resource.url}'),
       headers: {
         'Content-Type': 'application/json',
         'Accept': 'application/json',
         'Authorization': 'bearer '+ token!
       },
     );

     return resource.parse(response);
   }

  static Future post(int id) async{
    http.Response response = await http.post(Uri.parse('https://staging.sastowholesale.com/messages/'+id.toString(), ),
       // body: resource.data
    );

    return response;
  }

  static Future broadcast(int id) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? loginToken = prefs.getString('login_token');

    http.Response response = await http.post(Uri.parse('https://staging.sastowholesale.com/messages/' + id.toString(),),

      //body: data,
      headers: {
        'Authorization': 'Bearer $loginToken'
      },
    );
      return response;
   // return resource.parse(response);
  }

   static Future get(Resource resource) async{
     http.Response response = await http.get(Uri.parse('https://pusher-chat-api.herokuapp.com/api/${resource.url}'),

       headers: {
         'Content-Type': 'application/json',
         'Accept': 'application/json',
         'Authorization': 'bearer '+ resource.token
       },
     );

     return resource.parse(response);
   }
}
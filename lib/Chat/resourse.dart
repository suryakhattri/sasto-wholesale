
import 'package:http/http.dart';

class Resource {
  String url;
  String token;
  Function(Response response) parse;
  final Map<String, dynamic> data;

  Resource({ required this.url, required this.parse, required this.data, required this.token});
}

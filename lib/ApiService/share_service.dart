
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sasto_wholesale/Login/Model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Network with ChangeNotifier {
  String url = 'https://seller.sastowholesale.com/';
  var loginToken;
  var _authToken = '';
  bool _isAuth = false;

  bool get auth {
    return _isAuth;
  }

  Future<String?> get authToken async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    return _authToken = localStorage.getString!("login_token");    //This is where the above error points at
  }

  getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    loginToken = localStorage.getString("login_token")!;
  }

  authData(data, apiUrl) async {
    var fullUrl = url + apiUrl;
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: setHeaders());
  }

  logOut(apiUrl) async {               //This is the Sign Out API
    var fullUrl = url + apiUrl;
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove("login_token");      //This is where I remove the token
    return await http.get(Uri.parse(fullUrl), headers: setHeaders());
  }

  getData(apiUrl) async {
    var fullUrl = url + apiUrl;
    await getToken();
    return await http.get(Uri.parse(fullUrl), headers: setHeaders());
  }

  setHeaders() => {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $loginToken'
  };
}
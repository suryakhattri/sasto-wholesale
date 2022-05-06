import 'package:http/http.dart' as http;
import 'package:sasto_wholesale/ApiService/share_service.dart';
import 'package:sasto_wholesale/Login/Model/login_model.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class APIService {

  // Future<LoginModel> userLogin(LoginRequestModel loginRequestModel) async {
  //
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   var jsonResponse = null;
  //   var url = 'https://seller.sastowholesale.com/api/user/login';
  //   final response = await http.post(Uri.parse(url), body: loginRequestModel.toJson(),);
  //   if(response.statusCode == 200 || response.statusCode == 400) {
  //     jsonResponse = json.decode(response.body);
  //     if(jsonResponse != null) {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //       sharedPreferences.setString("token", jsonResponse['token']);
  //     }
  //     // print(response.body);
  //     // return LoginModel.fromJson(json.decode(response.body));
  //
  //   } else {
  //     throw Exception('failed to load data');
  //   }
  //
  // }

}
// @dart=2.9
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sasto_wholesale/ApiService/share_service.dart';
import 'package:sasto_wholesale/Login/login.dart';
import 'package:sasto_wholesale/SignUp/sign_up.dart';
import 'package:sasto_wholesale/bottom_navigation.dart';
import 'package:sasto_wholesale/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cart/cart_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ReviewCartProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SastoWholesaleApp(),
    ),
  ));
}

class SastoWholesaleApp extends StatefulWidget {
  @override
  State<SastoWholesaleApp> createState() => _SastoWholesaleAppState();
}

class _SastoWholesaleAppState extends State<SastoWholesaleApp> {
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
   SharedPreferences preferences = await SharedPreferences.getInstance();
   String loginToken = preferences.getString("login_token");
    //final authToken = Provider.of<Network>(context).getToken();
    if (loginToken != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => BottomNavigationDataItems()),
          (route) => false);
      //  Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationDataItems()));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // scaffoldBackgroundColor: const Color.fromRGBO(25, 29, 33, 1),
          primaryColor: const Color.fromRGBO(252, 17, 17, 1)),
      home: Login(), //This check doesn't seem to work
      routes: {
        '/sign-in': (context) => Login(),
        '/sign-up': (context) => SignUp(),
        // '/otp-screen': (context) => OTP(),
        '/bottom-bar': (context) => BottomNavigationDataItems(),
      },
    );
  }
}

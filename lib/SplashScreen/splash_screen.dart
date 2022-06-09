import 'package:flutter/material.dart';
import 'package:sasto_wholesale/bottom_navigation.dart';
import 'package:sasto_wholesale/main.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SastoWholesaleApp()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.asset(
          'assets/images/welcome.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
// @dart=2.9
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sasto_wholesale/Chat/chat_provider.dart';
import 'package:sasto_wholesale/Chat/conversation.dart';
import 'package:sasto_wholesale/Login/login.dart';
import 'package:sasto_wholesale/SignUp/sign_up.dart';
import 'package:sasto_wholesale/bottom_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SplashScreen/splash_screen.dart';
import 'cart/cart_provider.dart';

Future<void> main() async {

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ChatProvider()),
      ChangeNotifierProvider(create: (_) => CartItemProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
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
    CartItemProvider().getData();
    CartItemProvider().getCounter();
    ChatProvider().init();
  }

  // void checkLogin() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   String loginToken = preferences.getString("login_token");
  //   if (loginToken == null) {
  //     Navigator.of(context).pushAndRemoveUntil(
  //         MaterialPageRoute(builder: (context) => Login()), (route) => false);
  //     //  Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationDataItems()));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () async {
        print("After clicking the Android Back Button");
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => BottomNavigationDataItems()),
            (route) => false);
        return false;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            // scaffoldBackgroundColor: const Color.fromRGBO(25, 29, 33, 1),
            primaryColor: const Color.fromRGBO(252, 17, 17, 1)),
        home: BottomNavigationDataItems(), //This check doesn't seem to work
        routes: {
          '/sign-in': (context) => Login(),
          '/sign-up': (context) => SignUp(),
          // '/otp-screen': (context) => OTP(),
          '/bottom-bar': (context) => BottomNavigationDataItems(),
        },
      ),
    );
  }
}

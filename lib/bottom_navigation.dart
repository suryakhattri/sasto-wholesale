import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sasto_wholesale/CategoryDetails/category_details_model.dart';
import 'package:sasto_wholesale/Chat/chat_list.dart';
import 'package:sasto_wholesale/cart/cart_model.dart';
import 'package:sasto_wholesale/cart/cart_provider.dart';
import 'package:sasto_wholesale/cart/shopping_cart.dart';
import 'package:sasto_wholesale/fevorite.dart';
import 'package:sasto_wholesale/home.dart';
import 'package:sasto_wholesale/notification.dart';
import 'package:sasto_wholesale/Profile/user_profile.dart';

class BottomNavigationDataItems extends StatefulWidget {
  const BottomNavigationDataItems({Key? key}) : super(key: key);

  @override
  _BottomNavigationDataItemsState createState() =>
      _BottomNavigationDataItemsState();
}

class _BottomNavigationDataItemsState extends State<BottomNavigationDataItems> {
  int pageIndex = 0;

  final Home _home = Home();
  final ShoppingCartPage _shoppingCartPage = ShoppingCartPage();
  final ChatList _chatList = ChatList();
  final UserProfile _userProfile = UserProfile();

  Widget _showPage = new Home();

  Widget _pagechooser(int page) {
    switch (page) {
      case 0:
        return _home;
      case 1:
        return _shoppingCartPage;
      case 2:
        return _chatList;
      case 3:
        return _userProfile;
      default:
        return new Container(
          child: new Center(
            child: new Text(
              "no page found..",
              style: new TextStyle(fontSize: 30),
            ),
          ),
        );
    }
  }

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    setState(() {
      CartItemProvider().getCounter();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: pageIndex,
        height: 60.0,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 25,
            color: Colors.red,
          ),
          GestureDetector(
            child: Stack(
              //alignment: Alignment.topCenter,
              children: <Widget>[
                Icon(
                  Icons.shopping_cart,
                  size: 35.0,
                  color: Colors.red,
                ),
                //if (_cartList.length > 0)
                CircleAvatar(
                  radius: 8.0,
                  backgroundColor: Colors.green[900],
                  foregroundColor: Colors.white,
                  child: Text(
                    context.read<CartItemProvider>().getCounter().toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                  // Consumer<CartItemProvider>(
                  //     builder: (context, value, child) {
                  //   return Text(
                  //     value.getCounter().toString(),
                  //     // cart.itemCount.toString(),
                  //     style: TextStyle(
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 12.0,
                  //     ),
                  //   );
                  // }),
                ),
              ],
            ),
          ),
          Icon(
            Icons.sms_outlined,
            size: 25,
            color: Colors.red,
          ),
          Icon(
            Icons.person_outline,
            size: 25,
            color: Colors.red,
          ),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        // backgroundColor: Colors.blueGrey,
        backgroundColor: Color.fromRGBO(29, 124, 201, 1),

        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (int tappedIndex) {
          setState(() {
            _showPage = _pagechooser(tappedIndex);
          });
        },
        letIndexChange: (index) => true,
      ),
      body: Container(
        color: Colors.blueAccent,
        child: _showPage,
      ),
    );
  }
}

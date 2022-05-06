import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:sasto_wholesale/CategoryDetails/ProductData.dart';
import 'package:sasto_wholesale/CategoryDetails/data.dart';
import 'package:sasto_wholesale/CheckOut/checkout.dart';
import 'package:sasto_wholesale/Theme/light_color.dart';
import 'package:sasto_wholesale/Theme/theme.dart';
import 'package:sasto_wholesale/bottom_navigation.dart';
import 'package:http/http.dart' as http;
import 'package:sasto_wholesale/cart/cart_model.dart';
import 'package:sasto_wholesale/cart/cart_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  //late Future<CartModel> _cartData;

  @override
  void initState() {
    super.initState();
    //_cartData = fetchCartItem();
  }

  Widget _cartItem() {
    return Consumer<ReviewCartProvider>(builder: (context, data, child) {
      return data.myCartItemsList.length == 0 || data.myCartItemsList == null
          ? Text("No Item to Cart")
          : ListView.builder(
              itemCount: data.myCartItemsList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.30,
                  secondaryActions: <Widget>[
                    IconSlideAction(
                      // caption: 'Delete',
                      color: Colors.red,
                      iconWidget: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 35,
                            ),
                            onPressed: () {
                              setState(() {
                                data.removeCart(index);
                              });
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      "Item removed from cart successfully")));
                              // showDialog(context: context,
                              //     builder: (context) => ShowDeleteOption());
                            },
                          ),
                          // SizedBox(width: 20,),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15),
                            // child: IconButton(
                            //   icon: Icon(Icons.edit_location_rounded, color: Colors.white,size: 25,),
                            //   onPressed: () {},
                            // ),
                          ),
                        ],
                      ),
                      onTap: () {
                        // => {
                        //   setState(() {
                        //     listingGainer.removeAt(index);
                        //   })
                      },
                    ),
                  ],
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(10),
                      child: ListTile(
                          leading: Container(
                              child: Image.network(data.myCartItemsList[index].image)),
                          title: Text(
                            data.myCartItemsList[index].productName,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.normal),
                          ),
                          subtitle: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10.0, top: 5),
                                    child: Text(
                                      "Each:",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    data.myCartItemsList[index].productPrice.toString()
                                    ,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10.0, top: 5),
                                    child: Text(
                                      "Quantity:",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    "1",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10.0, top: 5),
                                    child: Text(
                                      "Total:",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    data.myCartItemsList[index].unitTag,
                                    //*model.data.quantity,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ),
                  ),
                );
              });
    });
  }

  // Widget _item() {
  //   return Container(
  //     child: FutureBuilder<CartModel>(
  //       future: _cartData,
  //       builder: (context, snapshot) {
  //         if (snapshot.hasData) {
  //           CartModel model = snapshot.data!;
  //           return ListView.builder(
  //               itemCount: 1,
  //               shrinkWrap: true,
  //               physics: NeverScrollableScrollPhysics(),
  //               itemBuilder: (context, index) {
  //                 return Slidable(
  //                   actionPane: SlidableDrawerActionPane(),
  //                   actionExtentRatio: 0.30,
  //                   secondaryActions: <Widget>[
  //                     IconSlideAction(
  //                       // caption: 'Delete',
  //                       color: Colors.red,
  //                       iconWidget: Row(
  //                         crossAxisAlignment: CrossAxisAlignment.center,
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: [
  //                           IconButton(
  //                             icon: Icon(
  //                               Icons.delete,
  //                               color: Colors.white,
  //                               size: 35,
  //                             ),
  //                             onPressed: () {
  //                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //                                   content: Text(
  //                                       "Item removed from cart successfully")));
  //                               // showDialog(context: context,
  //                               //     builder: (context) => ShowDeleteOption());
  //                             },
  //                           ),
  //                           // SizedBox(width: 20,),
  //                           Padding(
  //                             padding:
  //                                 const EdgeInsets.only(left: 15.0, right: 15),
  //                             // child: IconButton(
  //                             //   icon: Icon(Icons.edit_location_rounded, color: Colors.white,size: 25,),
  //                             //   onPressed: () {},
  //                             // ),
  //                           ),
  //                         ],
  //                       ),
  //                       onTap: () {
  //                         // => {
  //                         //   setState(() {
  //                         //     listingGainer.removeAt(index);
  //                         //   })
  //                       },
  //                     ),
  //                   ],
  //                   child: Padding(
  //                     padding: const EdgeInsets.only(
  //                         left: 5.0, right: 5.0, top: 5.0),
  //                     child: Material(
  //                       elevation: 5,
  //                       borderRadius: BorderRadius.circular(10),
  //                       child: ListTile(
  //                           leading: Container(
  //                               child:
  //                                   Image.network(model.data.imageUrl)),
  //                           title: Text(
  //                             model.data.title,
  //                             style: TextStyle(
  //                                 color: Colors.black,
  //                                 fontSize: 17,
  //                                 fontWeight: FontWeight.normal),
  //                           ),
  //                           subtitle: Column(
  //                             children: [
  //                               Row(
  //                                 children: [
  //                                   Padding(
  //                                     padding: const EdgeInsets.only(
  //                                         right: 10.0, top: 5),
  //                                     child: Text(
  //                                       "Each:",
  //                                       style: TextStyle(
  //                                           color: Colors.black,
  //                                           fontSize: 17,
  //                                           fontWeight: FontWeight.bold),
  //                                     ),
  //                                   ),
  //                                   Text(
  //                                     model.data.priceRange,
  //                                     style: TextStyle(
  //                                         color: Colors.black,
  //                                         fontSize: 17,
  //                                         fontWeight: FontWeight.normal),
  //                                   ),
  //                                 ],
  //                               ),
  //                               Row(
  //                                 children: [
  //                                   Padding(
  //                                     padding: const EdgeInsets.only(
  //                                         right: 10.0, top: 5),
  //                                     child: Text(
  //                                       "Quantity:",
  //                                       style: TextStyle(
  //                                           color: Colors.black,
  //                                           fontSize: 17,
  //                                           fontWeight: FontWeight.bold),
  //                                     ),
  //                                   ),
  //                                   Text(
  //                                     "1",
  //                                     style: TextStyle(
  //                                         color: Colors.black,
  //                                         fontSize: 17,
  //                                         fontWeight: FontWeight.normal),
  //                                   ),
  //                                 ],
  //                               ),
  //                               Row(
  //                                 children: [
  //                                   Padding(
  //                                     padding: const EdgeInsets.only(
  //                                         right: 10.0, top: 5),
  //                                     child: Text(
  //                                       "Total:",
  //                                       style: TextStyle(
  //                                           color: Colors.black,
  //                                           fontSize: 17,
  //                                           fontWeight: FontWeight.bold),
  //                                     ),
  //                                   ),
  //                                   Text(
  //                                     model.data.priceRange,//*model.data.quantity,
  //                                     style: TextStyle(
  //                                         color: Colors.black,
  //                                         fontSize: 17,
  //                                         fontWeight: FontWeight.normal),
  //                                   ),
  //                                 ],
  //                               ),
  //                             ],
  //                           )),
  //                     ),
  //                   ),
  //                 );
  //               });
  //         } else if (snapshot.hasError) {
  //           return Text('${snapshot.error}');
  //         }
  //         return Container(
  //             alignment: Alignment.center,
  //             margin: EdgeInsets.only(top: 20),
  //             child: CircularProgressIndicator(
  //                 // backgroundColor: Colors.grey,
  //                 //color: Colors.purple,
  //                 // valueColor: ,
  //                 ));
  //       },
  //     ),
  //   );
  // }

  Widget _cartSummary(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  "Cart Summary",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
              ListTile(
                leading: Text(
                  "Subtotal",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.normal),
                ),
                trailing: Text(
                  "Rs. 640,400",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.normal),
                ),
              ),
              Divider(
                thickness: 1.0,
                color: Colors.black,
              ),
              ListTile(
                leading: Text(
                  "Shipping",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.normal),
                ),
                trailing: Text(
                  "Rs. 600",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.normal),
                ),
              ),
              Divider(
                thickness: 1.0,
                color: Colors.black,
              ),
              ListTile(
                leading: Text(
                  "Total",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                  "Rs. 640,400",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(child: _submitButton(context)),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _price() {
  Widget _submitButton(BuildContext context) {
    return FlatButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => new Checkout()));
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        color: Colors.green,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 12),
          width: AppTheme.fullWidth(context) * .7,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_basket_rounded,
                color: Colors.white,
                size: 25,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Checkout',
                style: TextStyle(
                    color: LightColor.background,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ],
          ),
        ));
  }

  double getPrice() {
    double price = 0;
    AppData.cartList.forEach((x) {
      price += x.price * x.id;
    });
    return price;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.menu),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        // elevation: 0.0,
        toolbarHeight: 70,
        title: Image.asset(
          "assets/images/logo.png",
          scale: 8,
        ),
      ),
      body: Container(
        color: Colors.white,
        // padding: AppTheme.padding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _cartItem(),
              SizedBox(
                height: 10,
              ),
              _cartSummary(context),
            ],
          ),
        ),
      ),
    );
  }
}

// Future<CartModel> fetchCartItem() async {
//   SharedPreferences preferences = await SharedPreferences.getInstance();
//   String loginToken = preferences.getString("login_token");
//
//   var header = {
//     'Content-type': 'application/json',
//     'Accept': 'application/json',
//     'Authorization': 'Bearer $loginToken'
//   };
//
//   var url = 'https://seller.sastowholesale.com/api/product-by-id/17';
//
//   final response = await http.get(Uri.parse(url), headers: header);
//   if (response.statusCode == 200) {
//     var jsonResponse = json.decode(response.body);
//     print("${response.body}");
//     return new CartModel.fromJson(jsonResponse);
//   } else {
//     throw Exception('Failed to load You May Like Item');
//   }
// }

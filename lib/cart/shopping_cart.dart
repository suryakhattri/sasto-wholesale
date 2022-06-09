import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:sasto_wholesale/CategoryDetails/category_details_model.dart';
import 'package:sasto_wholesale/CategoryDetails/data.dart';
import 'package:sasto_wholesale/CheckOut/checkout.dart';
import 'package:sasto_wholesale/DBHelper/db_helper.dart';
import 'package:sasto_wholesale/Login/login.dart';
import 'package:sasto_wholesale/Search/search_product_list.dart';
import 'package:sasto_wholesale/Theme/light_color.dart';
import 'package:sasto_wholesale/Theme/theme.dart';
import 'package:sasto_wholesale/bottom_navigation.dart';
import 'package:sasto_wholesale/cart/cart_model.dart';
import 'package:sasto_wholesale/cart/cart_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  DBHelper dbHelper = DBHelper();

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String loginToken = preferences.getString("login_token");
    if (loginToken == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Login()), (route) => false);
      //  Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationDataItems()));
    }
  }

  // Widget _price() {
  Widget _submitButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MaterialButton(
              onPressed: () {
                //  Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => new BottomNavigationDataItems()));
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              color: Color.fromRGBO(252, 4, 4, 1),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 12),
                // width: AppTheme.fullWidth(context) * .7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Shop More',
                      style: TextStyle(
                          color: LightColor.background,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
              )),
          MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Checkout()));
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              color: Color.fromRGBO(29, 124, 201, 1),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 12),
                // width: AppTheme.fullWidth(context) * .7,
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
              )),
        ],
      ),
    );
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
    final cart = Provider.of<CartItemProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.menu),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        // elevation: 0.0,
        toolbarHeight: 70,
        title: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => new BottomNavigationDataItems()));
          },
          child: Image.asset(
            "assets/images/logo.png",
            scale: 8,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new SearchProductList()));
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.blue,
                  size: 30,
                )),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        // padding: AppTheme.padding,
        child: SingleChildScrollView(
            child: FutureBuilder<List<CartModel>?>(
                future: cart.getData(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<CartModel>?> snapshot) {
                  if (snapshot.data?.isNotEmpty ??
                      snapshot.data?.length != null) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return snapshot.data![index].id == null
                                  ? Text("No Data Available")
                                  : Container(
                                      child: Slidable(
                                        actionPane: SlidableDrawerActionPane(),
                                        actionExtentRatio: 0.30,
                                        secondaryActions: <Widget>[
                                          IconSlideAction(
                                            // caption: 'Delete',
                                            color: Colors.red,
                                            iconWidget: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                IconButton(
                                                  icon: Icon(
                                                    Icons.delete,
                                                    color: Colors.white,
                                                    size: 35,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      dbHelper.delete(snapshot
                                                          .data![index].id!);
                                                      cart.removeCounter();
                                                      cart.removeTotalPrice(
                                                          double.parse(snapshot
                                                              .data![index]
                                                              .price!
                                                              .toString()));
                                                    });
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                            content: Text(
                                                                "Item removed from cart successfully")));
                                                    // showDialog(context: context,
                                                    //     builder: (context) => ShowDeleteOption());
                                                  },
                                                ),
                                                // SizedBox(width: 20,),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15.0,
                                                          right: 15),
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
                                          padding: const EdgeInsets.only(
                                              left: 5.0, right: 5.0, top: 20.0),
                                          child: Material(
                                            elevation: 5,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: ListTile(
                                                leading: Container(
                                                    child: Image.network(
                                                        snapshot.data![index]
                                                            .imageUrl
                                                            .toString())),
                                                title: Text(
                                                  snapshot.data![index].name
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                                subtitle: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 10.0,
                                                                  top: 5),
                                                          child: Text(
                                                            "Each:",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        Text(
                                                          snapshot.data![index]
                                                              .price
                                                              .toString(),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 10.0,
                                                                  top: 5),
                                                          child: Text(
                                                            "Quantity:",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        Text(
                                                          snapshot.data![index]
                                                              .quantity
                                                              .toString(),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 10.0,
                                                                  top: 5),
                                                          child: Text(
                                                            "Total:",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        Text(
                                                          snapshot.data![index]
                                                              .totalPrice
                                                              .toString(),
                                                          //*model.data.quantity,
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )),
                                          ),
                                        ),
                                      ),
                                    );
                            }),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Material(
                            elevation: 10,
                            borderRadius: BorderRadius.circular(10),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 1,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
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
                                          snapshot.data![index].price
                                              .toString(),
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
                                          snapshot.data![index].shippingCharge
                                              .toString(),
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
                                        trailing: Consumer<CartItemProvider>(
                                            builder: (context, value, child) {
                                          return Text(
                                            '${snapshot.data!.first.price.toString()}',
                                            // "${value.getTotalPrice()}" +
                                            //     "${double.parse(snapshot.data![index].shippingCharge.toString())}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          );
                                        }),
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
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: Center(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/empty cart.png',
                              height: 150,
                              width: 150,
                            ),
                            Text(
                              "OOPS! Your cart is empty",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "You can go to home page to view more items",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  // return Container(
                  //   child:  Text("No Item Added To Cart"),
                  // );
                  return Center(
                    child: CircularProgressIndicator(
                        // backgroundColor: Colors.grey,
                        //color: Colors.purple,
                        // valueColor: ,
                        ),
                  );
                })),
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:sasto_wholesale/CategoryDetails/Description/description_tab.dart';
import 'package:sasto_wholesale/CategoryDetails/category_details_model.dart';
import 'package:sasto_wholesale/CategoryDetails/vendor_profile.dart';
import 'package:sasto_wholesale/Chat/chat_details.dart';
import 'package:sasto_wholesale/Chat/chat_list.dart';
import 'package:sasto_wholesale/DBHelper/db_helper.dart';
import 'package:sasto_wholesale/Theme/theme.dart';
import 'package:http/http.dart' as http;
import 'package:sasto_wholesale/cart/cart_provider.dart';
import 'package:sasto_wholesale/cart/shopping_cart.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key, required this.slug}) : super(key: key);

  final String slug;

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late Future<CaegoryDetailModel> _categoryData;
  late Future<List<Range>> _pricedataList;
  late Future<List<Images>> _thumbNailImage;
  TextEditingController _quantityController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedImage = 0;
  int vendorId = 0;
  DBHelper dbHelper = DBHelper();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _quantityController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    CartItemProvider().getData();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInToLinear));
    controller.forward();
    String slugdata = widget.slug;
    _categoryData = fetchCategoryDetails(slugdata);
    _pricedataList = fetchPriceRange(slugdata);
    _thumbNailImage = fetchThumbNailImage(slugdata);
    _quantityController.text = "1";
    // Setting the initial value for the field.
  }

 // bool isLiked = true;

  Widget _appBar() {
    return Container(
      padding: AppTheme.padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: _icon(Icons.arrow_back_ios,
                color: Colors.black54, size: 15, padding: 12, isOutLine: true),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => new ShoppingCartPage()));
                },
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
                        child: Consumer<CartItemProvider>(
                            builder: (context, value, child) {
                          return Text(
                            value.getCounter().toString(),
                            // cart.itemCount.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            ),
                          );
                        })),
                  ],
                ),
              ),
              // InkWell(
              //   onTap: () {
              //   },
              //   child: _icon(Icons.shopping_cart,
              //       color: Colors.red, size: 15, padding: 12, isOutLine: true),
              // ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _icon(IconData icon,
      {Color color = Colors.grey,
      double size = 20,
      double padding = 10,
      bool isOutLine = false}) {
    return Container(
      height: 40,
      width: 40,
      padding: EdgeInsets.all(padding),
      // margin: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.grey,
            style: isOutLine ? BorderStyle.solid : BorderStyle.none),
        borderRadius: BorderRadius.all(Radius.circular(13)),
        color:
            isOutLine ? Colors.transparent : Theme.of(context).backgroundColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Color(0xfff8f8f8),
              blurRadius: 5,
              spreadRadius: 10,
              offset: Offset(5, 5)),
        ],
      ),
      child: Icon(icon, color: color, size: size),
    );
  }

  Widget _thumbnail() {
    return FutureBuilder<List<Images>>(
      future: _thumbNailImage,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Images> _imageData = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  AnimatedBuilder(
                    builder: (context, child) {
                      return AnimatedOpacity(
                        duration: Duration(milliseconds: 500),
                        opacity: animation.value,
                        child: child,
                      );
                    },
                    animation: animation,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        Container(
                          height: 220,
                          width: 240,
                          color: Colors.transparent,
                          child: Material(
                           // elevation: 1,
                            borderRadius: BorderRadius.circular(10),
                            child: PhotoView(
                              backgroundDecoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              imageProvider: NetworkImage(
                                  _imageData[selectedImage].imageUrl,),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 40,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        // physics: NeverScrollableScrollPhysics(),
                        itemCount: _imageData.length,
                        itemBuilder: (BuildContext context, int i) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedImage = i;
                              });
                            },
                            child: AnimatedBuilder(
                                animation: animation,
                                //  builder: null,
                                builder: (context, child) => AnimatedOpacity(
                                      opacity: animation.value,
                                      duration: Duration(milliseconds: 500),
                                      child: child,
                                    ),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Material(
                                    elevation: 3,
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    child: Container(
                                      height: 40,
                                      width: 50,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Image.network(
                                            _imageData[i].imageUrl,
                                          )),
                                    ),
                                  ),
                                )),
                          );
                        }),
                  ),
                ],
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return Container(
          height: 0,
        );
      },
    );
  }

  Widget _description() {
    return widget.slug != null
        ? Container(
            height: 600,
            child: DescriptionTab(slugData: widget.slug),
          )
        : Container(
            height: 0,
          );
  }

  Widget _priceRange() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: FutureBuilder<List<Range>>(
            future: _pricedataList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Range> _priceData = snapshot.data!;
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Quantity Range",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Price Range",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _priceData.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    _priceData[index].from == "51"
                                        ? Text(
                                            "Above: ${_priceData[index].from}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w500),
                                          )
                                        : _priceData[index].to != null
                                            ? Text(
                                                "${_priceData[index].from}"
                                                " - "
                                                "${_priceData[index].to}",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            : Text(_priceData[index].from),
                                    Text(
                                      "Rs: ${_priceData[index].price.toString()}/",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.grey,
                              ),
                            ],
                          );
                        }),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  Widget _share() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {},
            child: new Tab(
              icon: new Image.asset(
                "assets/images/fb.png",
                scale: 90,
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          InkWell(
            onTap: () {},
            child: new Tab(
              icon: new Image.asset(
                "assets/images/insta.png",
                scale: 90,
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          InkWell(
            onTap: () {},
            child: new Tab(
              icon: new Image.asset(
                "assets/images/twitter.png",
                scale: 90,
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          InkWell(
            onTap: () {},
            child: new Tab(
              icon: new Image.asset(
                "assets/images/google.png",
                scale: 90,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartItemProvider>(context);
    return Container(
      color: Colors.white,
      child: FutureBuilder<CaegoryDetailModel>(
        future: _categoryData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              key: _scaffoldKey,
              bottomNavigationBar: Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Material(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        color: Color.fromRGBO(29, 124, 201, 1),
                        elevation: 2.0,
                        //   highlightElevation: 2,
                        child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              cart.addItem(
                                  snapshot.data?.data.id ?? 0,
                                  snapshot.data?.data.vendorId.toString() ?? '',
                                  snapshot.data?.data.title ?? '',
                                  snapshot.data?.data.imageUrl ?? '',
                                  snapshot.data?.data.ranges.first.price
                                          .toString() ??
                                      '',
                                  int.parse(_quantityController.text),
                                  "Rs. ${(snapshot.data?.data.ranges.first.price.toString() ?? 0 * int.parse(_quantityController.text))}",
                                  snapshot.data?.data.shippingCharge
                                          .toString() ??
                                      '');
                              cart.addTotalPrice(double.parse(snapshot
                                  .data!.data.ranges.first.price
                                  .toString()));
                              ScaffoldMessenger.of(context).showSnackBar(
                                  new SnackBar(
                                      content: new Text(
                                          "Product Added To cart Successfully")));
                              //  }
                              // else {
                              //     _scaffoldKey.currentState?.showSnackBar(
                              //         new SnackBar(
                              //             content: new Text(
                              //                 "You cannot Added product At a time from same vendor")));
                              // }
                            });
                          },
                          minWidth: MediaQuery.of(context).size.width,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_shopping_cart_rounded,
                                color: Colors.white,
                                size: 25,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Add To Cart",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Material(
                        // borderRadius: BorderRadius.circular(28.0),
                        // color: Colors.blue.withOpacity(0.8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        color: Color.fromRGBO(29, 124, 201, 1),
                        elevation: 2.0,
                        //   highlightElevation: 2,
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    new ChatList()));
                          },
                          minWidth: MediaQuery.of(context).size.width,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.question_answer_outlined,
                                color: Colors.white,
                                size: 25,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Chat Now",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              body: SafeArea(
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      Color(0xfffbfbfb),
                      Color(0xfff7f7f7),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
                  child: FutureBuilder<CaegoryDetailModel>(
                    future: _categoryData,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: 1,
                            scrollDirection: Axis.vertical,
                            //physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  _appBar(),
                                  _thumbnail(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      SizedBox(height: 5),
                                      Container(
                                        alignment: Alignment.center,
                                        child: Container(
                                          width: 50,
                                          height: 5,
                                          decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0, right: 10, top: 10.0),
                                          child: Text(
                                            snapshot.data!.data.title,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                            maxLines: 5,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Divider(
                                        thickness: 0.5,
                                        color: Colors.black,
                                      ),
                                      ListTile(
                                        leading: Text(
                                          "Category:",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        title: InkWell(
                                          onTap: () {},
                                          child: Text(
                                            snapshot.data!.data.productCategory
                                                .name,
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        thickness: 0.5,
                                        color: Colors.black,
                                      ),
                                      // _availableSize(),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      _priceRange(),
                                      Divider(
                                        thickness: 0.5,
                                        color: Colors.black,
                                      ),
                                      //_availableColor(),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      _quantityInputForm(),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      _cartSummary(),
                                      // _supplierProfile(vendorId: snapshot.data!.data.vendorId),
                                      VendorProfile(
                                        vendorId: snapshot.data!.data.vendorId,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15.0),
                                        child: Text(
                                          "Share:",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),

                                      SizedBox(
                                        height: 10,
                                      ),
                                      _share(),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      _description(),
                                    ],
                                  ),
                                ],
                              );
                            });
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      return Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 20),
                          child: CircularProgressIndicator(
                              // backgroundColor: Colors.grey,
                              //color: Colors.purple,
                              // valueColor: ,
                              ));
                    },
                  ),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 20),
              child: CircularProgressIndicator(
                  // backgroundColor: Colors.grey,
                  //color: Colors.purple,
                  // valueColor: ,
                  ));
        },
      ),
    );
  }

  Widget _shippingCharge() {
    return FutureBuilder<CaegoryDetailModel>(
      future: _categoryData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 1,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: 50,
                      child: ListTile(
                          leading: Text(
                            "Shipping",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 17),
                          ),
                          trailing: snapshot.data!.data.shippingCharge
                                      .toString() !=
                                  null
                              ? Text(
                                  snapshot.data!.data.shippingCharge.toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 17),
                                )
                              : Text(
                                  "Rs. 0",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 17),
                                )),
                    ),
                    Container(
                      height: 50,
                      child: ListTile(
                        leading: Text(
                          "Total",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                        trailing: snapshot.data!.data.priceRange != null || snapshot.data!.data.shippingCharge != null
                            ? Text(
                                // snapshot.data!.data.priceRange,
                                "Rs. ${(snapshot.data!.data.ranges[index].price * int.parse(_quantityController.text) + snapshot.data!.data.shippingCharge) }",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              )
                            : Text(""),
                      ),
                    ),
                  ],
                );
              });
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return Container();
      },
    );
  }

  Widget _cartSummary() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FutureBuilder<List<Range>>(
        future: _pricedataList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Range> _priceData = snapshot.data!;
            return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Material(
                    elevation: 1,
                    borderRadius: BorderRadius.circular(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "The minimum order quantity is 1 pcs",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          height: 40,
                          child: ListTile(
                            leading: Text(
                              "Quantity",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            trailing: Text(
                              "Price",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 0.5,
                          color: Colors.black,
                        ),
                        Container(
                          height: 40,
                          child: ListTile(
                            //tileColor: Colors.black,
                            leading: Text(
                              "1 pcs",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            trailing: _priceData[index].from == "1"
                                ? Text(
                                    "Rs. ${_priceData[index].price.toString()}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  )
                                : Text("0"),
                          ),
                        ),
                        Container(
                          height: 40,
                          child: ListTile(
                            //tileColor: Colors.black,
                            leading: Text(
                              "${_quantityController.text} pcs",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            trailing: Text(
                              "Rs. ${(_priceData[index].price * int.parse(_quantityController.text))}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 0.5,
                          color: Colors.black,
                        ),
                        _shippingCharge(),
                      ],
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Container();
        },
      ),
    );
  }

  Widget _quantityInputForm() {
    return Padding(
      padding:
          const EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
      child: Center(
        child: Container(
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(
              color: Colors.blueGrey,
              width: 2.0,
            ),
          ),
          child: Row(
            children: <Widget>[
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15),
                  child: Icon(
                    Icons.horizontal_rule_outlined,
                    size: 25.0,
                  ),
                ),
                onTap: () {
                  int currentValue = int.parse(_quantityController.text);
                  setState(() {
                    print("Setting state");
                    currentValue--;
                    _quantityController.text =
                        (currentValue > 0 ? currentValue : 0)
                            .toString(); // decrementing value
                  });
                },
              ),
              Expanded(
                flex: 1,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  controller: _quantityController,
                  onChanged: (text) => setState(() {}),
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: false,
                    signed: true,
                  ),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    // border: Border(
                    //   bottom: BorderSide(
                    //     width: 0.5,
                    //   ),
                    // ),
                    ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15),
                  child: InkWell(
                    child: Icon(
                      Icons.add,
                      size: 25.0,
                    ),
                    onTap: () {
                      int currentValue = int.parse(_quantityController.text);
                      setState(() {
                        currentValue++;
                        _quantityController.text =
                            (currentValue).toString(); // incrementing value
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<CaegoryDetailModel> fetchCategoryDetails(String categorySlog) async {
  final response = await http.get(Uri.parse(
      'https://seller.sastowholesale.com/api/products/' + categorySlog));
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    print("${response.body}");
    return new CaegoryDetailModel.fromJson(jsonResponse);
  } else {
    throw Exception('Failed to load You data');
  }
}

//Api for Price Range

Future<List<Range>> fetchPriceRange(String categorySlog) async {
  final response = await http.get(Uri.parse(
      'https://seller.sastowholesale.com/api/products/' + categorySlog));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body)['data']['ranges'];
    print("${response.body}");
    return jsonResponse.map((data) => new Range.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load data');
  }
}

Future<List<Images>> fetchThumbNailImage(String categorySlog) async {
  final response = await http.get(Uri.parse(
      'https://seller.sastowholesale.com/api/products/' + categorySlog));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body)['data']['images'];
    print("${response.body}");
    return jsonResponse.map((data) => new Images.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load data');
  }
}

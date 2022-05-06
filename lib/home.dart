import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sasto_wholesale/BlogList/all_blog.dart';
import 'package:sasto_wholesale/BlogList/blog_List.dart';
import 'package:sasto_wholesale/Categories/MeghaMenu/category_by_product.dart';
import 'package:sasto_wholesale/Categories/MeghaMenu/megha_menu.dart';
import 'package:sasto_wholesale/Categories/MeghaMenu/sub_category.dart';
import 'package:sasto_wholesale/CategoryDetails/category_details.dart';
import 'package:sasto_wholesale/Country/country.dart';
import 'package:sasto_wholesale/Footer/footer_page.dart';
import 'package:sasto_wholesale/NewArrivals/new_arrival_all_products.dart';
import 'package:sasto_wholesale/OurPartners/our_partners.dart';
import 'package:sasto_wholesale/OurServices/our_services.dart';
import 'package:sasto_wholesale/RequestQuotation/request_quotation.dart';
import 'package:sasto_wholesale/SastoWholeSale/hot_category.dart';
import 'package:sasto_wholesale/SastoWholeSale/new_arrivals.dart';
import 'package:sasto_wholesale/SastoWholeSale/sasto_wholesale_mall.dart';
import 'package:sasto_wholesale/SastoWholeSale/top_products.dart';
import 'package:sasto_wholesale/SastoWholeSale/you_may_like.dart';
import 'package:sasto_wholesale/SastoWholesaleMall/sasto_wholesale_mall_all_product.dart';
import 'package:sasto_wholesale/TopProducts/slider_model.dart';
import 'package:sasto_wholesale/TopProducts/top_product_all_item.dart';

import 'SastoWholeSale/sasto_wholesale_market.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  PageController pageController = PageController();
  var _selectedIndex = 0;
  final List<int> numbers = [1, 2, 3, 5, 8, 13, 21, 34, 55];

  late Future<List<SliderData>> _sliderData;

  @override
  void initState() {
    super.initState();
    _sliderData = fetchBannerImage();

    // Timer.periodic(Duration(seconds: 5), (timer) {
    //   // double nextPage = pageController.page + 1;
    //
    //   if (pageController.page! >= pageCount - 1) {
    //     pageController.animateToPage(0,
    //         duration: Duration(milliseconds: 2000),
    //         curve: Curves.fastLinearToSlowEaseIn);
    //   } else {
    //     pageController.nextPage(
    //         duration: Duration(milliseconds: 2000),
    //         curve: Curves.fastLinearToSlowEaseIn);
    //   }
    // });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        // leading: Icon(Icons.menu),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        //elevation: 0.0,
        toolbarHeight: 70,
        title: Center(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Welcome to",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Image.asset(
                "assets/images/logo.png",
                scale: 10,
              ),
            ],
          ),
        ),
      ),
      // leading: Builder(
      //   builder: (BuildContext context) {
      //     return IconButton(
      //       icon: Icon(
      //         Icons.menu_rounded,
      //         color: Colors.black,
      //       ),
      //       onPressed: () {
      //         Scaffold.of(context).openDrawer();
      //         //  _scaffoldState.currentState.openDrawer();
      //       },
      //       // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      //     );
      //   },
      // ),
      //drawer: _drawerHome(context),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            _getSearchBar(),
            _slideImage(),
            SizedBox(
              height: 10,
            ),
            _buildSectionTitle("Sasto Wholesale Market", () {},
                Icons.home_repair_service, ""),
            SizedBox(
              height: 10,
            ),
            SastoWholeSaleMarket(),
            SizedBox(
              height: 10,
            ),
            _buildSectionTitle("Categories", () {}, Icons.category, ""),
            SizedBox(
              height: 10,
            ),
           // Divider(thickness:1,),
            MeghaMenu(),
            SizedBox(
              height: 10,
            ),
            Divider(thickness:1,),
            _buildSectionTitle(
                "Our Services", () {}, Icons.add_shopping_cart_outlined, ""),
            SizedBox(
              height: 10,
            ),
            OurServices(),
            _newArrivalSection(context),
            SizedBox(
              height: 10,
            ),
            NewArrivals(),
            SizedBox(
              height: 10,
            ),
            _topProductSection(context),
            SizedBox(
              height: 10,
            ),
            TopProducts(),
            SizedBox(
              height: 10,
            ),
            _hotCategorySection(context),
            SizedBox(
              height: 10,
            ),
            HotCategories(),
            SizedBox(
              height: 10,
            ),
            _sastoWholesaleMallSection(context),
            SizedBox(
              height: 10,
            ),
            SastoWholesaleMall(),
            SizedBox(
              height: 10,
            ),
            _buildSectionTitle(
                "Request Quotation", () {}, Icons.accessible, ""),
            Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
            SizedBox(
              height: 10,
            ),
            RequestQuotation(),
            SizedBox(
              height: 10,
            ),
            _buildSectionTitle("You may Like", () {}, Icons.accessible, ""),
            SizedBox(
              height: 10,
            ),
            YouMayLike(),
            SizedBox(
              height: 10,
            ),
            _buildSectionTitle(
                "Choose by Country", () {}, Icons.accessible, ""),
            SizedBox(
              height: 10,
            ),
            Country(),
            SizedBox(
              height: 10,
            ),
            _buildSectionTitle("Our Partners", () {}, Icons.accessible, ""),
            SizedBox(
              height: 10,
            ),
            OurPartners(),
            SizedBox(
              height: 10,
            ),
            _buildSectionTitle("Blogs", () {
              //Navigator.push(context, (builder: (_) => BlogList()));
            }, Icons.accessible, "View All Blog"),
            Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
            BlogList(),
            Footer(),
          ],
        ),
      ),
    );
  }

  // Search Field

  _getSearchBar() {
    return GestureDetector(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 5),
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
          elevation: 5,
          child: TextField(
            onChanged: (value) {
              //Do something with the user input.
            },
            decoration: InputDecoration(
              hintText: 'Search for desired product here',
              hintStyle: TextStyle(color: Colors.grey),
              suffixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
              ),
            ),
          ),
        ),
      ),
      onTap: () async {
        // await Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => Search(
        //         updateHome: widget.updateHome,
        //       ),
        //     ));
        if (mounted) setState(() {});
      },
    );
  }

  //Slide Image Indicator
  _slideImage() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15, top: 10),
          child: LimitedBox(
            maxHeight: 220,
            child: Stack(
              children: <Widget>[
                FutureBuilder<List<SliderData>>(
                  future: _sliderData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<SliderData> _sliderData = snapshot.data!;
                      return Column(
                        children: [
                          Container(
                            height:200,
                            child: PageView.builder(
                              onPageChanged: (index){
                                _selectedIndex = index;
                              },
                              controller: pageController,
                              itemCount: _sliderData.length,
                              itemBuilder: (context, index){
                                var banner = _sliderData[index];
                                var _scale = _selectedIndex == index ? 1.0: 0.8;
                                return TweenAnimationBuilder(
                                  tween: Tween(begin: _scale, end: _scale),
                                  duration: const Duration(milliseconds: 350),
                                  builder: ( context, double value, child) {
                                    return Transform.scale(scale: value, child: child,);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: NetworkImage(_sliderData[index].imageUrl),
                                            fit: BoxFit.cover
                                        ),
                                    ),
                                    child: DefaultTextStyle(
                                      style: TextStyle(color: Colors.white),
                                      child: Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(0, 0, 0, 0.3),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                             // Text(_sliderData[index].title)
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              // children: <Widget>[
                              //   addBannerImage(
                              //     slideImage: "assets/images/2.jpeg"
                              //   ),
                              //   addBannerImage(
                              //     slideImage: "assets/images/2.jpeg",
                              //   ),
                              //   addBannerImage(
                              //     slideImage: "assets/images/3.jpeg",
                              //   ),
                              // ],
                            ),
                          ),
                          SizedBox(height: 5,),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ...List.generate(_sliderData.length, (index) => SlideIndicator(isActive: _selectedIndex == index? true: false,)),
                              ],
                            ),
                          ),
                        ],
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
              ],
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        // Container(
        //   height: 10,
        //   child: Stack(
        //     children: [
        //       Positioned(
        //           left: 0.0,
        //           right: 0.0,
        //           child: Center(
        //               child: SlideIndicator(pageController: pageController))),
        //     ],
        //   ),
        // ),



      ],
    );
  }
}

// drawer for home
// Widget _drawerHome(BuildContext context) {
//   return Drawer(
//     child: Container(
//       color: Colors.blue[900],
//       child: Padding(
//         padding: const EdgeInsets.only(top: 0.0, left: 10.0, right: 10.0),
//         child: ListView(
//           shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(),
//           children: [
//             ListTile(
//               title: Text(
//                 "Welcome to Sasto Wholesale!",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 17,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//             Divider(
//               thickness: 0.5,
//               color: Colors.white,
//             ),
//             ListTile(
//               leading: Icon(
//                 Icons.ad_units,
//                 size: 20,
//                 color: Colors.white,
//               ),
//               title: Text(
//                 "My Orders",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 17,
//                     fontWeight: FontWeight.bold),
//               ),
//               onTap: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => new MyOrder()));
//               },
//             ),
//             Divider(
//               thickness: 0.5,
//               color: Colors.white,
//             ),
//             ListTile(
//               leading: Icon(Icons.wc, size: 20, color: Colors.white),
//               title: Text(
//                 "My Deals",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 17,
//                     fontWeight: FontWeight.bold),
//               ),
//               onTap: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => new MyDeals()));
//               },
//             ),
//             Divider(
//               thickness: 0.5,
//               color: Colors.white,
//             ),
//             ListTile(
//               leading: Icon(Icons.question_answer_rounded,
//                   size: 20, color: Colors.white),
//               title: Text(
//                 "Message",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 17,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//             // Divider(
//             //   thickness: 0.5,
//             //   color: Colors.white,
//             // ),
//             // ListTile(
//             //   leading: Icon(Icons.add_shopping_cart_rounded,
//             //       size: 20, color: Colors.white),
//             //   title: Text(
//             //     "Cart",
//             //     style: TextStyle(
//             //         color: Colors.white,
//             //         fontSize: 17,
//             //         fontWeight: FontWeight.bold),
//             //   ),
//             //   onTap: () {
//             //     Navigator.push(context,
//             //         MaterialPageRoute(builder: (context) => new ShoppingCartPage()));
//             //   },
//             // ),
//             Divider(
//               thickness: 0.5,
//               color: Colors.white,
//             ),
//             ListTile(
//               leading:
//                   Icon(Icons.shopping_basket, size: 20, color: Colors.white),
//               title: Text(
//                 "Products",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 17,
//                     fontWeight: FontWeight.bold),
//               ),
//               onTap: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => new Products()));
//               },
//             ),
//             Divider(
//               thickness: 0.5,
//               color: Colors.white,
//             ),
//             ListTile(
//               leading: Icon(Icons.attribution_outlined,
//                   size: 20, color: Colors.white),
//               title: Text(
//                 "Suppliers",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 17,
//                     fontWeight: FontWeight.bold),
//               ),
//               onTap: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => new Suppliers()));
//               },
//             ),
//             Divider(
//               thickness: 0.5,
//               color: Colors.white,
//             ),
//             ListTile(
//               leading: Icon(Icons.language, size: 20, color: Colors.white),
//               title: Text(
//                 "RFQ",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 17,
//                     fontWeight: FontWeight.bold),
//               ),
//               onTap: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => new RFQ()));
//               },
//             ),
//             Divider(
//               thickness: 0.5,
//               color: Colors.white,
//             ),
//             ListTile(
//               leading: Icon(Icons.account_circle_rounded,
//                   size: 20, color: Colors.white),
//               title: Text(
//                 "LogIn",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 17,
//                     fontWeight: FontWeight.bold),
//               ),
//               onTap: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => new Login()));
//               },
//             ),
//             Divider(
//               thickness: 0.5,
//               color: Colors.white,
//             ),
//             ListTile(
//               title: Text(
//                 "Sell on sasto wholsale",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 17,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//             Divider(
//               thickness: 0.5,
//               color: Colors.white,
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

Widget _buildSectionTitle(
    String title, Function onTap, IconData icon, String seeAll) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: Colors.red,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        InkWell(
          //onTap: AllBlog,
          onTap: onTap(),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              seeAll,
              style: TextStyle(
                  color: Colors.red, fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    ),
  );
}

//New Arrival Section Title
Widget _newArrivalSection(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.home_outlined,
              color: Colors.red,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "New Arrivals",
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        InkWell(
          //onTap: AllBlog,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => new NewArrivalAllProducts()));
          },
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "See All",
              style: TextStyle(
                  color: Colors.red, fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    ),
  );
}

//Top Product section title
Widget _topProductSection(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.home_outlined,
              color: Colors.red,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Top Product",
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        InkWell(
          //onTap: AllBlog,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => new TopProductAllItem()));
          },
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "See All",
              style: TextStyle(
                  color: Colors.red, fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    ),
  );
}

//HotCategorySection title
Widget _hotCategorySection(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.home_outlined,
              color: Colors.red,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Hot Category",
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        InkWell(
          //onTap: AllBlog,
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => new CategoryList()));
          },
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "See All",
              style: TextStyle(
                  color: Colors.red, fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    ),
  );
}

//Sasto Wholesale Mall Section Title
Widget _sastoWholesaleMallSection(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.home_outlined,
              color: Colors.red,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Sasto Wholesale Mall",
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        InkWell(
          //onTap: AllBlog,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => new SastoWholesaleMallAllProduct()));
          },
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "See All",
              style: TextStyle(
                  color: Colors.red, fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    ),
  );
}

//Image Slider
// class SlideIndicator extends AnimatedWidget {
//   final PageController pageController;
//
//   SlideIndicator({required this.pageController})
//       : super(listenable: pageController);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: List<Widget>.generate(3, buildIndicator),
//       ),
//     );
//   }
//
//   Widget buildIndicator(int index) {
//     // bool active = pageController.page!.round() == index;
//     double? controller = pageController.page;
//     if (controller != null) {
//       bool active = controller.round() == index;
//       return AnimatedContainer(
//
//         child: Container(
//           width: 30,
//           child: Center(
//             child: Container(
//               //  color: active ? Colors.white : Colors.red,
//               width: 25,
//               height: 7,
//               //decoration: BoxDecoration(color: active ? Colors.white : Colors.red, borderRadius: BorderRadius.circular(5)),
//               decoration: BoxDecoration(
//                 color: active ? Colors.lightBlueAccent : Colors.blueGrey,
//                 border: Border.all(
//                     //color: active ? Colors.red : Colors.white
//                     color: Colors.white),
//                 borderRadius: BorderRadius.circular(0.0),
//               ),
//             ),
//           ),
//         ),
//       );
//     }
//     return Container();
//   }
// }

class SlideIndicator extends StatelessWidget {
  final bool isActive;
  const SlideIndicator({Key? key, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: isActive ? 22.0 : 8.0,
      height: 8.0,
      duration: Duration(milliseconds: 200),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
          color: isActive ? Colors.lightBlueAccent : Colors.blueGrey,
                border: Border.all(
                    //color: active ? Colors.red : Colors.white
                    color: Colors.white),
                borderRadius: BorderRadius.circular(0.0),
    ),

    );
  }
}


// class addBannerImage extends StatefulWidget {
//   final String slideImage;
//
//
//   addBannerImage({required this.slideImage});
//
//   @override
//   State<addBannerImage> createState() => _addBannerImageState();
// }
//
// class _addBannerImageState extends State<addBannerImage> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Image.asset(
//         widget.slideImage,
//         fit: BoxFit.cover,
//       ),
//     );
//   }
// }


Future<List<SliderData>> fetchBannerImage() async {
  final response = await http.get(Uri.parse(
      'https://seller.sastowholesale.com/api/sliders'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body)['data'];
    print("${response.body}");
    return jsonResponse
        .map((data) => new SliderData.fromJson(data))
        .toList();
  } else {
    throw Exception('Failed to load Top Product Data');
  }
}


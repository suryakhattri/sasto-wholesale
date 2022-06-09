import 'dart:async';
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sasto_wholesale/BlogList/all_blog.dart';
import 'package:sasto_wholesale/BlogList/blog_List.dart';
import 'package:sasto_wholesale/Categories/MeghaMenu/megha_menu.dart';
import 'package:sasto_wholesale/Country/country.dart';
import 'package:sasto_wholesale/Footer/footer_page.dart';
import 'package:sasto_wholesale/NewArrivals/new_arrival_all_products.dart';
import 'package:sasto_wholesale/OurPartners/our_partners.dart';
import 'package:sasto_wholesale/OurPartners/partners.dart';
import 'package:sasto_wholesale/OurServices/our_services.dart';
import 'package:sasto_wholesale/Products/products_list.dart';
import 'package:sasto_wholesale/RequestQuotation/request_quotation.dart';
import 'package:sasto_wholesale/SastoWholeSale/Models/top_product_model.dart';
import 'package:sasto_wholesale/SastoWholeSale/hot_category.dart';
import 'package:sasto_wholesale/SastoWholeSale/new_arrivals.dart';
import 'package:sasto_wholesale/SastoWholeSale/sasto_wholesale_mall.dart';
import 'package:sasto_wholesale/SastoWholeSale/top_products.dart';
import 'package:sasto_wholesale/SastoWholeSale/you_may_like.dart';
import 'package:sasto_wholesale/SastoWholesaleMall/sasto_wholesale_mall_all_product.dart';
import 'package:sasto_wholesale/Search/search_product_list.dart';
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
  int _currentIndex = 0;

  late Future<List<SliderData>> _sliderData;

  @override
  void initState() {
    super.initState();
    _sliderData = fetchBannerImage();
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
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
          )
        ],
      ),

      // drawer: _drawerHome(context),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // _getSearchBar(),
            _slideImage(),
            SizedBox(
              height: 10,
            ),
            _buildSectionTitle(
                "Sasto Wholesale Market", () {}, Icons.home_repair_service, ""),
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
            Divider(
              thickness: 1,
            ),
            _buildSectionTitle(
                "Services", () {}, Icons.add_shopping_cart_outlined, ""),
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
            _ourPartnerSection(context),
            SizedBox(
              height: 10,
            ),
            OurPartners(),
            SizedBox(
              height: 10,
            ),
            _blogSectionTitle(context),
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

  //Slide Image Indicator
  _slideImage() {
    return Column(
      children: [
        Stack(
          children: <Widget>[
            FutureBuilder<List<SliderData>>(
              future: _sliderData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<SliderData> _sliderData = snapshot.data!;
                  return Column(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          enlargeCenterPage: true,
                          autoPlayCurve: Curves.easeInCubic,
                          viewportFraction: 1,
                          autoPlayInterval: Duration(seconds: 7),
                          autoPlayAnimationDuration: Duration(milliseconds: 800),

                          //scrollDirection: Axis.vertical,
                          onPageChanged: (index, reason) {
                            setState(
                                  () {
                                _currentIndex = index;
                              },
                            );
                          },
                        ),
                        items: _sliderData
                            .map(
                              (item) =>
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  margin: EdgeInsets.only(
                                    // top: 10.0,
                                    // bottom: 10.0,
                                  ),
                                  elevation: 6.0,
                                  shadowColor: Colors.blueAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15.0),
                                    ),
                                    child: Stack(
                                      children: <Widget>[
                                        Image.network(
                                          item.imageUrl,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                        ),
                                        Center(
                                          child: _sliderData[_currentIndex]
                                              .title != null ? Text(
                                            '${_sliderData[_currentIndex]
                                                .title}',
                                            style: TextStyle(
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold,
                                              // backgroundColor: Colors.black45,
                                              color: Colors.white,
                                            ),
                                          ) : Text(""),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                        )
                            .toList(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _sliderData.map((urlOfItem) {
                          int index = _sliderData.indexOf(urlOfItem);
                          return Container(
                            width: 10.0,
                            height: 10.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentIndex == index
                                  ? Color.fromRGBO(29, 124, 201, 1)
                                  : Color.fromRGBO(0, 0, 0, 0.3),
                            ),
                          );
                        }).toList(),
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
      ],
    );
  }
}

Widget _buildSectionTitle(String title, Function onTap, IconData icon,
    String seeAll) {
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

//Our Partner title
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

//New Arrival Section Title
Widget _ourPartnerSection(BuildContext context) {
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
              "Our Partners",
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => new Partners()));
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
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => new SastoWholesaleMallAllProduct()));
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

//Our Blog Section Title
Widget _blogSectionTitle(BuildContext context) {
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
              "Blogs",
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => new AllBlog()));
          },
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "View All Blog",
              style: TextStyle(
                  color: Colors.red, fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    ),
  );
}

Future<List<SliderData>> fetchBannerImage() async {
  final response = await http
      .get(Uri.parse('https://seller.sastowholesale.com/api/sliders'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body)['data'];
    print("${response.body}");
    return jsonResponse.map((data) => new SliderData.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load Top Product Data');
  }
}

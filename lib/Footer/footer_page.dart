import 'package:flutter/material.dart';
import 'package:sasto_wholesale/BecameASeller/became_a_seller.dart';
import 'package:sasto_wholesale/BlogList/all_blog.dart';
import 'package:sasto_wholesale/Footer/web_house_developer.dart';

class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          Container(
            color: Colors.teal[900],
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    "Subscribe to our Newasletters to get the latest Trade alert and industry news in your mail.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20.0, left: 10, right: 10),
                    child: Row(
                      children: [
                        Container(
                          width: 250,
                          height: 50,
                          child: TextFormField(
                            // onSaved: (input) => signupRequestModel.password = input,
                            //  controller: _passwordTextController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              // contentPadding: const EdgeInsets.symmetric(
                              //     vertical: 18.0, horizontal: 15.0, ),

                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1.0),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1.0),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1.0),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1.0),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              hintText: "Enter Your Email Here",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0),
                            ),
                          ),
                        ),
                        Material(
                          // borderRadius: BorderRadius.circular(28.0),
                          // color: Colors.blue.withOpacity(0.8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0)),
                          color: Colors.grey,
                          elevation: 0.0,
                          //   highlightElevation: 2,
                          child: MaterialButton(
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //         new BottomNavigationDataItems()));
                            },
                            // minWidth: MediaQuery.of(context).size.width,
                            height: 45,
                            child: Text(
                              "Suscribe",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, top: 20, bottom: 20),
                    child: Text(
                      "Follow Us",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
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
                ],
              ),
            ),
          ),
          Container(
            color: Colors.blueGrey[600],
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text(
                  //   "Service",
                  //   style: TextStyle(
                  //       color: Colors.white,
                  //       fontSize: 20,
                  //       fontWeight: FontWeight.bold),
                  // ),
                  // SizedBox(height: 10,),
                  // Text("Trade Assurance",
                  //     style: TextStyle(
                  //     color: Colors.white,
                  //     fontSize: 17,
                  //     fontWeight: FontWeight.normal),
                  // ),
                  // SizedBox(height: 10,),
                  // Text("Shipping Service",
                  //   style: TextStyle(
                  //       color: Colors.white,
                  //       fontSize: 17,
                  //       fontWeight: FontWeight.normal),
                  // ),
                  // SizedBox(height: 10,),
                  // Text("Logestic Service",
                  //   style: TextStyle(
                  //       color: Colors.white,
                  //       fontSize: 17,
                  //       fontWeight: FontWeight.normal),
                  // ),
                  // SizedBox(height: 10,),
                  // Text("Business Identity",
                  //   style: TextStyle(
                  //       color: Colors.white,
                  //       fontSize: 17,
                  //       fontWeight: FontWeight.normal),
                  // ),
                  // SizedBox(height: 20,),
                  Text(
                    "About Us",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10,),
                  Text("About Sasto wholesale",
                    style: TextStyle(
                        color: Colors.grey[200],
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10,),
                  Text("Our Partners",
                    style: TextStyle(
                        color: Colors.grey[200],
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10,),
                  Text("Help Center",
                    style: TextStyle(
                        color: Colors.grey[200],
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => AllBlog()));
                    },
                    child: Text("Our Blogs",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    "Sell on Sasto Wholsale",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => BecameASeller()));
                    },
                    child: Text("Become a Seller",
                      style: TextStyle(
                          color: Colors.grey[200],
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("Logistics Management",
                    style: TextStyle(
                        color: Colors.grey[200],
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 20,),
                  Text(
                    "Legel",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10,),
                  Text("Terms Of Use",
                    style: TextStyle(
                        color: Colors.grey[200],
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10,),
                  Text("Privacy Policy",
                    style: TextStyle(
                        color: Colors.grey[200],
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10,),
                //  WeAccept(),
                //  SizedBox(height: 10,),
                  Divider(thickness: 0.5, color: Colors.white,),
                  SizedBox(height: 10,),
                  Text("©2021 Sasto Wholesale Pvt. Ltd. All rights Reserved.",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20,),
                  Text("Email: info@sastowholesale.com",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => WebHouseDevelopMent()));
                    },
                    child: Text("Designed & Developed By: Web House Nepal",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Divider(thickness: 0.5, color: Colors.white,),
                  SizedBox(height: 10.0,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

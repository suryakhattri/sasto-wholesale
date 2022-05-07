import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sasto_wholesale/Login/login.dart';
import 'package:sasto_wholesale/MyDeals/my_deals.dart';
import 'package:sasto_wholesale/MyOrder/manage_order.dart';
import 'package:sasto_wholesale/MyOrder/my_order.dart';
import 'package:sasto_wholesale/Products/products_list.dart';
import 'package:sasto_wholesale/Profile/Model/profile_model.dart';
import 'package:sasto_wholesale/Profile/Order/edit_prfile.dart';
import 'package:sasto_wholesale/Profile/change_password.dart';
import 'package:sasto_wholesale/Suppliers/suppliers.dart';
import 'package:sasto_wholesale/notification.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState( title: "");
}

class _UserProfileState extends State<UserProfile> {
  late Future<ProfileModel> _profileData;
  final String title;

  _UserProfileState({
    required this.title,
  });

  @override
  void initState() {
    super.initState();
    _profileData = fetchProfileData();
  }

  @override
  Widget build(BuildContext context) {

    final addressData = [
      _UserProfileState(
        title: "My Favourites",
      ),
      _UserProfileState(
        title: "Edit Profile",
      ),
      _UserProfileState(
        title: "Products",
      ),
      _UserProfileState(
        title: "Suppliers",
      ),
      _UserProfileState(
        title: "My Orders",
      ),
      _UserProfileState(
        title: "My Deals",
      ),
      _UserProfileState(
        title: "Notifications",
      ),
      _UserProfileState(
        title: "Help Center",
      ),
      _UserProfileState(
        title: "Log out",
      ),
      _UserProfileState(
        title: "Change Password",
      ),
    ];
    return Scaffold(
      //backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        // leading: Icon(Icons.menu),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        //elevation: 0.0,
        toolbarHeight: 65,
        title: Image.asset(
          "assets/images/logo.png",
          scale: 8,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            _profile(),
            _addressBook(addressData),
            //_buttons(),
           // _orderDetails(),
          ],
        ),
      ),
    );
  }

  Widget _profile() {
    return FutureBuilder<ProfileModel>(
      future: _profileData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          ProfileModel model = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Hello",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          SizedBox(width: 5,),
                          Text(
                            "(${snapshot.data!.data.name}),",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          SizedBox(width: 5,),
                          Text(
                            "Good Day",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Material(
                      elevation: 2,
                      borderRadius: BorderRadius.circular(60),
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 0.0,
                        ),
                        width: 120.0,
                        height: 120.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(snapshot.data!.data.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      snapshot.data!.data.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      snapshot.data!.data.email,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      snapshot.data!.data.phoneNum,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    SizedBox(height: 10,),
                    // ListView.builder(
                    //     physics: NeverScrollableScrollPhysics(),
                    //     shrinkWrap: true,
                    //     itemCount: userProfile.length,
                    //     itemBuilder: (context, index) {
                    //       return Padding(
                    //         padding: const EdgeInsets.only(top: 3.0),
                    //         child: Material(
                    //           elevation: 1,
                    //           child: ListTile(
                    //             leading: Text(
                    //               userProfile[index].title,
                    //               style: TextStyle(
                    //                   color: Colors.grey,
                    //                   fontWeight: FontWeight.bold,
                    //                   fontSize: 17),
                    //             ),
                    //             trailing: Text(
                    //               userProfile[index].subtitle,
                    //               style: TextStyle(
                    //                   color: Colors.black,
                    //                   fontWeight: FontWeight.bold,
                    //                   fontSize: 17),
                    //             ),
                    //           ),
                    //         ),
                    //       );
                    //     }),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.all(10.0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       RaisedButton(
                    //         elevation: 0,
                    //         color: Colors.blue,
                    //         focusElevation: 4,
                    //         hoverElevation: 4,
                    //         highlightElevation: 8,
                    //         disabledElevation: 0,
                    //         onPressed: () {
                    //           Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                   builder: (context) => new EditProfile()));
                    //         },
                    //         child: Text(
                    //           'Edit Profile',
                    //           style: TextStyle(
                    //               color: Colors.white,
                    //               fontWeight: FontWeight.bold,
                    //               fontSize: 17),
                    //         ),
                    //       ),
                    //       RaisedButton(
                    //         elevation: 0,
                    //         color: Colors.blue,
                    //         focusElevation: 4,
                    //         hoverElevation: 4,
                    //         highlightElevation: 8,
                    //         disabledElevation: 0,
                    //         onPressed: () {
                    //           Navigator.push(
                    //               context,
                    //               MaterialPageRoute(
                    //                   builder: (context) => new ChangePassword()));
                    //         },
                    //         child: Text(
                    //           'Change Password',
                    //           style: TextStyle(
                    //               color: Colors.white,
                    //               fontWeight: FontWeight.bold,
                    //               fontSize: 17),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // )
                  ],
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
    );

  }

  Widget _addressBook(addressData) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 30),
      child: Container(
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
             // itemExtent: 70,
              itemCount: addressData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 10, right: 10,),
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(10),
                    child: ListTile(
                      onTap: () async{
                        if(index == 0) {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => new ManageOrder()));
                        } else if(index == 1){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new EditProfile()));
                        } else if(index == 2) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new Products()));
                        } else if(index == 3 ) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new Suppliers()));
                        } else if(index == 4) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new MyOrder()));
                        } else if(index == 5) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new MyDeals()));
                        }else if(index == 6) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new NotificationPage()));
                        } else if(index == 8) {
                          SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                          await sharedPreferences.clear();
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) => Login()),
                                  (route) => false);
                          } else if(index == 9) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new ChangePassword()));
                        }
                        },

                      leading: Text(
                        addressData[index].title,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios_outlined, size: 20,color: Colors.black,)
                    ),
                  ),
                );
              })),
    );
  }

  // Widget _buttons() {
  //   return Padding(
  //     padding: const EdgeInsets.all(10.0),
  //     child: Material(
  //       elevation: 5,
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(10),
  //       child: Padding(
  //         padding: const EdgeInsets.only(left: 40.0, right: 40.0),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             RaisedButton(
  //               elevation: 0,
  //               color: Colors.red,
  //               focusElevation: 4,
  //               hoverElevation: 4,
  //               highlightElevation: 8,
  //               disabledElevation: 0,
  //               onPressed: () {
  //                 Navigator.push(
  //                     context,
  //                     MaterialPageRoute(
  //                         builder: (context) => new ManageOrder()));
  //               },
  //               child: Text(
  //                 'Order',
  //                 style: TextStyle(
  //                     color: Colors.white,
  //                     fontWeight: FontWeight.bold,
  //                     fontSize: 17),
  //               ),
  //             ),
  //             RaisedButton(
  //               elevation: 0,
  //               color: Colors.red,
  //               focusElevation: 4,
  //               hoverElevation: 4,
  //               highlightElevation: 8,
  //               disabledElevation: 0,
  //               onPressed: () {
  //                 // Navigator.push(
  //                 //     context,
  //                 //     MaterialPageRoute(
  //                 //         builder: (context) => new ManageOrder()));
  //               },
  //               child: Text(
  //                 'Reviews',
  //                 style: TextStyle(
  //                     color: Colors.white,
  //                     fontWeight: FontWeight.bold,
  //                     fontSize: 17),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }



  // Widget _orderDetails() {
  //   return Padding(
  //     padding: const EdgeInsets.all(10.0),
  //     child: Material(
  //       elevation: 5,
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(10),
  //       child: Container(
  //         child: Column(
  //           // crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             Padding(
  //               padding: const EdgeInsets.only(top: 15.0),
  //               child: Text(
  //                 "Order Details",
  //                 style: TextStyle(
  //                     color: Colors.black,
  //                     fontWeight: FontWeight.bold,
  //                     fontSize: 20),
  //               ),
  //             ),
  //             Divider(
  //               endIndent: 15,
  //               indent: 15,
  //               thickness: 0.5,
  //               color: Colors.black,
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.all(10.0),
  //               child: Container(
  //                   height: MediaQuery.of(context).size.height,
  //                   child: ProfileOrder()),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

Future<ProfileModel> fetchProfileData() async {

  SharedPreferences preferences = await SharedPreferences.getInstance();
  String loginToken = preferences.getString("login_token");
  int userId = preferences.getInt("userId");

  var header = {'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $loginToken'};

  var url = 'https://seller.sastowholesale.com/api/user/show-user-image/';
  final response = await http.get(Uri.parse(url + userId.toString()), headers: header);
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    print("${response.body}");
    return  new ProfileModel.fromJson(jsonResponse);
  } else {
    throw Exception('Failed to load Profile');
  }
}

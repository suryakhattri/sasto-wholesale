import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:sasto_wholesale/ApiService/progress_hud.dart';
import 'package:sasto_wholesale/CategoryDetails/category_details_model.dart';
import 'package:sasto_wholesale/CheckOut/check_out_user_model.dart';
import 'package:sasto_wholesale/Payment/connect_ips.dart';
import 'package:sasto_wholesale/Payment/esewa.dart';
import 'package:sasto_wholesale/cart/cart_model.dart';
import 'package:sasto_wholesale/cart/cart_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  late Future<CheckOutUserModel> _userData;

  bool value = false;
  bool termsnCondition = false;
  bool isVisible = false;
  int cashPaymentOption = 0;
  bool isApiCallProcess = false;
  List<Datum> categoryItem = [];

  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _companyTextController = TextEditingController();
  TextEditingController _vatTextController = TextEditingController();
  TextEditingController _countryTextController = TextEditingController();
  TextEditingController _cityTextController = TextEditingController();
  TextEditingController _streetTextController = TextEditingController();
  TextEditingController _nearestLandmarkTextController =
      TextEditingController();
  TextEditingController _phoneTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  CheckOutUserModel? checkOutUserModel;

  @override
  void initState() {
    super.initState();
    _userData = fetchCheckOutUserData();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _checkoutUI(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  @override
  Widget _checkoutUI(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          "BILLING DETAILS",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 10.0, right: 10.0, top: 20, bottom: 20),
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: FutureBuilder<CheckOutUserModel>(
              future: _userData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  CheckOutUserModel model = snapshot.data!;
                  return Container(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15.0, top: 5.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Name Field
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20.0,
                                top: 10,
                              ),
                              child: Text(
                                "Full Name*",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, left: 10, right: 10),
                              child: TextFormField(
                                // onSaved: (input) => signupRequestModel.password = input,
                                controller: _nameTextController
                                  ..text = snapshot.data!.data.fullName,
                                style: TextStyle(color: Colors.black),
                                // obscureText: true,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 18.0, horizontal: 15.0),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 1.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 1.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 1.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 1.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  hintText: "Enter First Name",
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "This field is required";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            //company field
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, top: 10),
                              child: Text(
                                "Company Name(Optional)",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, left: 10, right: 10),
                              child: TextFormField(
                                // onSaved: (input) => signupRequestModel.password = input,
                                controller: _companyTextController
                                  ..text = snapshot.data!.data.companyName,
                                style: TextStyle(color: Colors.black),
                                // obscureText: true,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 18.0, horizontal: 15.0),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 1.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 1.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 1.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 1.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  hintText: "Enter Your Company Name",
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, top: 10),
                                      child: Text(
                                        "Vat/Pan(Optional)",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 0.0, top: 10, right: 100),
                                      child: Text(
                                        "Country",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          2.3,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, left: 10),
                                        child: TextFormField(
                                          // onSaved: (input) => signupRequestModel.password = input,
                                          controller: _vatTextController
                                            ..text = snapshot.data!.data.vat,
                                          style: TextStyle(color: Colors.black),
                                          // obscureText: true,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 18.0,
                                                    horizontal: 15.0),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            hintText: "Enter Vat/Pan Number",
                                            hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          2.3,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, right: 10),
                                        child: TextFormField(
                                          // onSaved: (input) => signupRequestModel.password = input,
                                          controller: _countryTextController
                                            ..text =
                                                snapshot.data!.data.country,
                                          style: TextStyle(color: Colors.black),
                                          // obscureText: true,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 18.0,
                                                    horizontal: 15.0),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            hintText: "Enter Country",
                                            hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0),
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "This field is required";
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, top: 10),
                                      child: Text(
                                        "Town/City*",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 0.0, top: 10, right: 40),
                                      child: Text(
                                        "Street Address*",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          2.3,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, left: 10, right: 0),
                                        child: TextFormField(
                                          // onSaved: (input) => signupRequestModel.password = input,
                                          controller: _cityTextController
                                            ..text = snapshot.data!.data.city,
                                          style: TextStyle(color: Colors.black),
                                          // obscureText: true,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 18.0,
                                                    horizontal: 15.0),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            hintText: "Enter Town or City",
                                            hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0),
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "This field is required";
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          2.3,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, left: 0, right: 10),
                                        child: TextFormField(
                                          // onSaved: (input) => signupRequestModel.password = input,
                                          controller: _streetTextController
                                            ..text = snapshot
                                                .data!.data.streetAddress,
                                          style: TextStyle(color: Colors.black),
                                          // obscureText: true,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 18.0,
                                                    horizontal: 15.0),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            hintText:
                                                "House Number And Street Name",
                                            hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0),
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "This field is required";
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, top: 10),
                              child: Text(
                                "Nereast Landmark(Optional)",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, left: 10, right: 10),
                              child: TextFormField(
                                // onSaved: (input) => signupRequestModel.password = input,
                                controller: _nearestLandmarkTextController
                                  ..text = snapshot.data!.data.nearestLandmark,
                                style: TextStyle(color: Colors.black),
                                // obscureText: true,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 18.0, horizontal: 15.0),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 1.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 1.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 1.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.black, width: 1.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  hintText: "Enter Nearest LandMark",
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, top: 10),
                                      child: Text(
                                        "Phone*",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, top: 10, right: 50 ),
                                      child: Text(
                                        "Email(Optional)",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width/2.2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, left: 10, right: 0),
                                        child: TextFormField(
                                          // onSaved: (input) => signupRequestModel.password = input,
                                          controller: _phoneTextController
                                            ..text = snapshot.data!.data.phone,
                                          style: TextStyle(color: Colors.black),
                                          // obscureText: true,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 18.0,
                                                    horizontal: 15.0),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            hintText: "Enter Phone Number",
                                            hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0),
                                          ),
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "This field is required";
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width/2.2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, left: 0, right: 10),
                                        child: TextFormField(
                                          // onSaved: (input) => signupRequestModel.password = input,
                                          controller: _emailTextController
                                            ..text = snapshot.data!.data.email,
                                          style: TextStyle(color: Colors.black),
                                          // obscureText: true,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 18.0,
                                                    horizontal: 15.0),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            hintText: "Enter Email Address",
                                            hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: this.value,
                                  onChanged: (value) {
                                    setState(() {
                                      this.value = value!;
                                      isVisible = !isVisible;
                                    });
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, top: 10),
                                  child: Text(
                                    "SHIP TO DIFFERENT ADDRESS",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            Visibility(
                              visible: isVisible,
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20.0,
                                        top: 10,
                                      ),
                                      child: Text(
                                        "First Name*",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    // SizedBox(height: 10,),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10.0, left: 10, right: 10),
                                      child: TextFormField(
                                        // onSaved: (input) => signupRequestModel.password = input,
                                        //  controller: _passwordTextController,
                                        style: TextStyle(color: Colors.black),
                                        // obscureText: true,
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 18.0,
                                                  horizontal: 15.0),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          hintText: "Enter First Name",
                                          hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0),
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, top: 10),
                                      child: Text(
                                        "Last Name*",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    // SizedBox(height: 10,),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10.0, left: 10, right: 10),
                                      child: TextFormField(
                                        // onSaved: (input) => signupRequestModel.password = input,
                                        //  controller: _passwordTextController,
                                        style: TextStyle(color: Colors.black),
                                        // obscureText: true,
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 18.0,
                                                  horizontal: 15.0),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          hintText: "Enter Last Name",
                                          hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, top: 10),
                                      child: Text(
                                        "Company Name(Optional)",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    // SizedBox(height: 10,),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10.0, left: 10, right: 10),
                                      child: TextFormField(
                                        // onSaved: (input) => signupRequestModel.password = input,
                                        //  controller: _passwordTextController,
                                        style: TextStyle(color: Colors.black),
                                        // obscureText: true,
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 18.0,
                                                  horizontal: 15.0),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          hintText: "Enter Your Company Name",
                                          hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0),
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, top: 10),
                                      child: Text(
                                        "Vat/Pan(Optional)",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    // SizedBox(height: 10,),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10.0, left: 10, right: 10),
                                      child: TextFormField(
                                        // onSaved: (input) => signupRequestModel.password = input,
                                        //  controller: _passwordTextController,
                                        style: TextStyle(color: Colors.black),
                                        // obscureText: true,
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 18.0,
                                                  horizontal: 15.0),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          hintText: "Enter Vat/Pan Number",
                                          hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, top: 10),
                                      child: Text(
                                        "Street Address*",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    // SizedBox(height: 10,),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10.0, left: 10, right: 10),
                                      child: TextFormField(
                                        // onSaved: (input) => signupRequestModel.password = input,
                                        //  controller: _passwordTextController,
                                        style: TextStyle(color: Colors.black),
                                        // obscureText: true,
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 18.0,
                                                  horizontal: 15.0),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          hintText:
                                              "House Number And Street Name",
                                          hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, top: 10),
                                      child: Text(
                                        "Nereast Landmark(Optional)",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    // SizedBox(height: 10,),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10.0, left: 10, right: 10),
                                      child: TextFormField(
                                        // onSaved: (input) => signupRequestModel.password = input,
                                        //  controller: _passwordTextController,
                                        style: TextStyle(color: Colors.black),
                                        // obscureText: true,
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 18.0,
                                                  horizontal: 15.0),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          hintText: "Enter Nearest Location",
                                          hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, top: 10),
                                      child: Text(
                                        "Town/City*",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    // SizedBox(height: 10,),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10.0, left: 10, right: 10),
                                      child: TextFormField(
                                        // onSaved: (input) => signupRequestModel.password = input,
                                        //  controller: _passwordTextController,
                                        style: TextStyle(color: Colors.black),
                                        // obscureText: true,
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 18.0,
                                                  horizontal: 15.0),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          hintText:
                                              "Extra Delivery Charges Out Of Kathmandu",
                                          hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, top: 10),
                                      child: Text(
                                        "Phone*",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    // SizedBox(height: 10,),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10.0, left: 10, right: 10),
                                      child: TextFormField(
                                        // onSaved: (input) => signupRequestModel.password = input,
                                        //  controller: _passwordTextController,
                                        style: TextStyle(color: Colors.black),
                                        // obscureText: true,
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 18.0,
                                                  horizontal: 15.0),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          hintText: "Enter Phone Number",
                                          hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0, top: 10),
                                      child: Text(
                                        "Email*",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    // SizedBox(height: 10,),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10.0, left: 10, right: 10),
                                      child: TextFormField(
                                        // onSaved: (input) => signupRequestModel.password = input,
                                        //  controller: _passwordTextController,
                                        style: TextStyle(color: Colors.black),
                                        // obscureText: true,
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 18.0,
                                                  horizontal: 15.0),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          hintText: "Enter Email Address",
                                          hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            _yourOrder(context),
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
            ),
          ),
        ),
      ),
    );
  }

  Widget _yourOrder(BuildContext context) {
    final cart = Provider.of<CartItemProvider>(context);
    return Container(
        child: FutureBuilder(
            future: cart.getData(),
            builder: (context, AsyncSnapshot<List<CartModel>?> snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data);
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Your Order",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15.0, bottom: 3),
                              child: Material(
                                elevation: 5,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.0)),
                                child: Container(
                                  child: ListTile(
                                      leading: Text(
                                        "Product",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      title: Center(
                                        child: Text(
                                          "Unit Price / Quantity",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      trailing: Text(
                                        "Total",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Slidable(
                              actionPane: SlidableDrawerActionPane(),
                              actionExtentRatio: 0.30,
                              secondaryActions: <Widget>[
                                IconSlideAction(
                                  // caption: 'Delete',
                                  color: Colors.red,
                                  iconWidget: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15.0, right: 15),
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.edit_location_rounded,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                      // SizedBox(width: 20,),
                                      IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                          size: 25,
                                        ),
                                        onPressed: () {
                                          // showDialog(context: context,
                                          //     builder: (context) => ShowDeleteOption());
                                        },
                                      ),
                                    ],
                                  ),
                                  onTap: () => {
                                    setState(() {
                                      // listingGainer.removeAt(index);
                                    })
                                  },
                                ),
                              ],
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0, bottom: 3),
                                child: Material(
                                  elevation: 5,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  child: ListTile(
                                    onTap: () {},
                                    leading: Container(
                                      width: 150,
                                      child: Text(
                                        snapshot.data![index].name!,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                    title: Center(
                                      child: Text(
                                        "Rs: ${snapshot.data![index].price!} * ${snapshot.data![index].quantity!}",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    trailing: Consumer<CartItemProvider>(
                                        builder: (context, value, child) {
                                      return Text(
                                        value.getTotalPrice().toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                      );
                                    }),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, bottom: 3),
                      child: Material(
                        elevation: 5,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: ListTile(
                          leading: Text(
                            "Subtotal",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: Text(
                            snapshot.data!.first.price!,
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, bottom: 3),
                      child: Material(
                        elevation: 5,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: ListTile(
                          leading: Text(
                            "Shipping",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: Text(
                            snapshot.data!.first.shippingCharge!,
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, bottom: 3),
                      child: Material(
                        elevation: 5,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: ListTile(
                          leading: Text(
                            "Total",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: Text(
                            snapshot.data!.first.totalPrice!,
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Your personal data will be used to process your order, support your experience throughout this website, and for other purposes described in our privacy policy.",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListTile(
                        title: Row(
                          children: [
                            Checkbox(
                              value: this.termsnCondition,
                              onChanged: (value) {
                                setState(() {
                                  this.termsnCondition = value!;
                                });
                              },
                            ),
                            Expanded(
                              child: Text(
                                "I have read and agree to the website terms and conditions *",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.justify,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    customRadioButton(
                        "Esewa Mobile Wallet",
                        "eSewa mobile wallet",
                        1,
                        "assets/images/esewa-square.png"),
                    // customRadioButton("Connect IPS", "pay direct from bank", 2,
                    //     "assets/images/connectips-square.png"),
                    customRadioButton(
                        "COD/Bank deposit/TT/LC",
                        "",
                        3,
                        "assets/images/cod-square.png"),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 25.0, left: 10, right: 10),
                      child: Material(
                        // borderRadius: BorderRadius.circular(28.0),
                        // color: Colors.blue.withOpacity(0.8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        color: Colors.blue,
                        elevation: 2.0,
                        //   highlightElevation: 2,
                        child: MaterialButton(
                          onPressed: () {
                            if (validateAndSave()) {
                              setState(() {
                                isApiCallProcess = true;

                                if(termsnCondition == false){
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text("Terms And Condition must be checked.",
                                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                    backgroundColor: Colors.white,
                                    action: SnackBarAction(
                                        label: 'Close',
                                        onPressed: () =>
                                            ScaffoldMessenger.of(context).hideCurrentSnackBar()),
                                  ));
                                }

                                if (cashPaymentOption == 1) {
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => new EsewaPayment()));
                                }
                                // else if (cashPaymentOption == 2) {
                                //   Navigator.push(
                                //       context, MaterialPageRoute(builder: (context) => new ConnectIps()));
                                // }
                                else if(cashPaymentOption == 2){
                                  setState(() {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text("Product Successfully Checked",
                                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                      backgroundColor: Colors.white,
                                      action: SnackBarAction(
                                          label: 'Close',
                                          onPressed: () =>
                                              ScaffoldMessenger.of(context).hideCurrentSnackBar()),
                                    ));
                                    isApiCallProcess = false;
                                  });

                                }  else {
                                  setState(() {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text("Please Choose Payment Method",
                                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                      backgroundColor: Colors.white,
                                      action: SnackBarAction(
                                          label: 'Close',
                                          onPressed: () =>
                                              ScaffoldMessenger.of(context).hideCurrentSnackBar()),
                                    ));
                                    isApiCallProcess = false;
                                  });
                                }
                              });
                              _checkOut(
                                  _nameTextController.text,
                                  _companyTextController.text,
                                  _vatTextController.text,
                                  _countryTextController.text,
                                  _cityTextController.text,
                                  _streetTextController.text,
                                  _nearestLandmarkTextController.text,
                                  _phoneTextController.text,
                                  _emailTextController.text,
                                  cashPaymentOption);
                            }
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //         new BottomNavigationDataItems()));
                          },
                          minWidth: MediaQuery.of(context).size.width,
                          height: 50,
                          child: Text(
                            "Place Order",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                Text("No Data Available");
              }
              return Center(
                child: CircularProgressIndicator(
                    // backgroundColor: Colors.grey,
                    //color: Colors.purple,
                    // valueColor: ,
                    ),
              );
            }));
  }

  // Widget customRadioButton(BuildContext context) {
  //   return Column(
  //     children: <Widget>[
  //       customRadioButton("Single", 1),
  //       customRadioButton("Married", 2),
  //       customRadioButton("Other", 3)
  //     ],
  //   );
  // }

  Widget customRadioButton(
      String title, String subTitle, int index, String image) {
    return MaterialButton(
      //color: Colors.white,
      onPressed: () {
        setState(() {
          cashPaymentOption = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Material(
          elevation: 5,
          color: cashPaymentOption == index ? Colors.cyan[900] : Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: ListTile(
            leading: Image.asset(image),
            title: Text(
              title,
              style: TextStyle(
                  color:
                      cashPaymentOption == index ? Colors.white : Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              subTitle,
              style: TextStyle(
                  color:
                      cashPaymentOption == index ? Colors.white : Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            trailing: cashPaymentOption == index
                ? Image.asset(
                    "assets/images/tick_icon.png",
                    height: 30,
                    width: 30,
                  )
                : Text(""),
          ),
        ),
      ),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      // borderSide:
      // BorderSide(color: (cashPaymentOption == index) ? Colors.green : Colors.black),
    );
  }

  //Api for CheckOut

  void _checkOut(
      String name,
      String companyName,
      String vat,
      String country,
      String city,
      String streetAddress,
      String nearestLandmark,
      String phone,
      String email,
      int cashPaymentOption) async {

    final data = {
      "checkout_mode": "cart",
      "cart": [
        {"product_id": 24, "product_qty": 1}
      ],
      "payment_type": "cod",
      "address":
      {
        "billing": {
          "full_name": name,
          "company_name": companyName,
          "vat": "vat",
          "country": country,
          "city": city,
          "street_address": streetAddress,
          "nearest_landmark":nearestLandmark,
          "phone": phone,
          "email": email
        }

      },
      "ship_to_different_address": false,
      "vendorId": 1
    };
          // "shipping": {
          //   "full_name": name,
          //   "company_name": companyName,
          //   "vat": vat,
          //   "country": country,
          //   "city": city,
          //   "street_address": streetAddress,
          //   "nearest_landmark": nearestLandmark,
          //   "phone": phone,
          //   "email": email
          // }

    String jsondata = json.encode(data);

    SharedPreferences preferences = await SharedPreferences.getInstance();
    String loginToken = preferences.getString("login_token")!;
    Map<String, String> header = {
      'Accept': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $loginToken'
    };
    var url = 'https://seller.sastowholesale.com/api/checkout';
    var res = await http.post(Uri.parse(url),
        headers: header, body: jsondata);
    print(json.decode(res.body));
    var body = json.decode(res.body);
    if (body['message'] == 'success') {
      setState(() {
        isApiCallProcess = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(body['message'],
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        action: SnackBarAction(
            label: 'Close',
            onPressed: () =>
                ScaffoldMessenger.of(context).hideCurrentSnackBar()),
      ));

      // Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(builder: (context) => BottomNavigationDataItems()),
      //         (route) => false);
    } else {
      setState(() {
        isApiCallProcess = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(body['message'],
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        action: SnackBarAction(
            label: 'Close',
            onPressed: () =>
                ScaffoldMessenger.of(context).hideCurrentSnackBar()),
      ));
    }
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}

Future<CheckOutUserModel> fetchCheckOutUserData() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String loginToken = preferences.getString("login_token")!;
  int userId = preferences.getInt("userId")!;
  var header = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $loginToken'
  };

  var url = 'https://seller.sastowholesale.com/api/my-address';
  final response = await http.get(Uri.parse(url), headers: header);
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    print("${response.body}");
    return new CheckOutUserModel.fromJson(jsonResponse);
  } else {
    throw Exception('Failed to load User');
  }
}

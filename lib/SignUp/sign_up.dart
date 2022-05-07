import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sasto_wholesale/OTP/otp_screen.dart';
import 'package:sasto_wholesale/bottom_navigation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _phoneNumberTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _confirmPasswordTextController = TextEditingController();


  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isApiCallProcess = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Stack(children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/ecommerce.jpeg',
                ),
              ),
            ),
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.blue,
                gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Colors.blue[800]!.withOpacity(0.8),
                      Colors.blue[800]!.withOpacity(0.8),
                    ],
                    stops: [
                      0.0,
                      1.0
                    ])),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 10),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 25,),
              onPressed: (){
                Navigator.pop(context);
              },
            )
          ),
          Center(
            child: SafeArea(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Material(
                    elevation: 10,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(bottom: 20.0,),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: Center(
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0, top: 10),
                                child: Text(
                                  "Full Name",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              // SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, left: 10, right: 10),
                                child: TextFormField(
                                  // onSaved: (input) => signupRequestModel.password = input,
                                    controller: _nameTextController,
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
                                    hintText: "Enter Full Name",
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "This field is Required.";
                                    }
                                    return null;
                                  },
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(left: 20.0, top: 15),
                                child: Text(
                                  "Email",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              // SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, left: 10, right: 10),
                                child: TextFormField(
                                  // onSaved: (input) => signupRequestModel.password = input,
                                    controller: _emailTextController,
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
                                    hintText: "Enter Email Address",
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "This field is Required.";
                                    }
                                    return null;
                                  },
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(left: 20.0, top: 15),
                                child: Text(
                                  "Phone Number",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              // SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, left: 10, right: 10),
                                child: TextFormField(
                                  // onSaved: (input) => signupRequestModel.password = input,
                                    controller: _phoneNumberTextController,
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
                                    hintText: "Enter Phone Number",
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "This field is Required.";
                                    }
                                    return null;
                                  },
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(left: 20.0, top: 15),
                                child: Text(
                                  "Password",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              // SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, left: 10, right: 10),
                                child: TextFormField(
                                  // onSaved: (input) => signupRequestModel.password = input,
                                    controller: _passwordTextController,
                                  style: TextStyle(color: Colors.black),
                                   obscureText: true,
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
                                    hintText: "Enter Password",
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "This field is Required.";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0, top: 15),
                                child: Text(
                                  "Conform Password",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              // SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, left: 10, right: 10),
                                child: TextFormField(
                                  // onSaved: (input) => signupRequestModel.password = input,
                                    controller: _confirmPasswordTextController,
                                  style: TextStyle(color: Colors.black),
                                   obscureText: true,
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
                                    hintText: "Conform Password",
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "This field is Required.";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 25.0, left: 10, right: 10),
                                child: Material(
                                  // borderRadius: BorderRadius.circular(28.0),
                                  // color: Colors.blue.withOpacity(0.8),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0)),
                                  color: Colors.blue[900],
                                  elevation: 2.0,
                                  //   highlightElevation: 2,
                                  child: MaterialButton(
                                     onPressed: () {
                                         // Navigator.push(
                                         //     context,
                                         //     MaterialPageRoute(
                                         //         builder: (context) =>
                                         //         new OTPScreen()));
                                      if (validateAndSave()) {
                                        setState(() {
                                          isApiCallProcess = true;
                                        });
                                        _requestSignUp(
                                          _nameTextController.text,
                                          _emailTextController.text,
                                          _phoneNumberTextController.text,
                                          _passwordTextController.text,
                                          _confirmPasswordTextController.text
                                        );
                                      }
                                     },
                                    minWidth: MediaQuery.of(context).size.width,
                                    height: 50,
                                    child: Text(
                                      "SIGN UP",
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
                          ),
                        ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }


  //Api call  SignUp

  void _requestSignUp(
      String name,
      String email,
      String phoneNumber,
      String password,
      String confirmPassword
      ) async {

    var data = {
      'full_name': name,
      'email': email,
      'phone_num': phoneNumber,
      'password': password,
      'confirm_password': confirmPassword
    };
    var url = 'https://seller.sastowholesale.com/api/user/register';
    var res = await http.post(Uri.parse(url), body: data);
    print(json.decode(res.body));
    var body = json.decode(res.body);

    if (body['message'] == 'success') {
      setState(() {
        isApiCallProcess = false;
      });

      SharedPreferences otp = await SharedPreferences.getInstance();
      otp.setInt("otp", body["user"]["otp"]);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(body['message'],
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        action: SnackBarAction(
            label: 'Close',
            onPressed: () =>
                ScaffoldMessenger.of(context).hideCurrentSnackBar()),
      ));
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => OTPScreen()), (route) => false);
    } else {
      setState(() {
        isApiCallProcess = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(body['status'],
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

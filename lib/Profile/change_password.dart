import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sasto_wholesale/ApiService/progress_hud.dart';
import 'package:sasto_wholesale/Login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isApiCallProcess = false;

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetupForChangePassword(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  @override
  Widget _uiSetupForChangePassword(BuildContext context) {
    return Scaffold(
      appBar: _appBarMenu(context),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                  top: 50,
                ),
                child: Material(
                  elevation: 10,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 30),
                          child: Text(
                            "Current password",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        // SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, left: 10, right: 10),
                          child: TextFormField(
                            // onSaved: (input) => signupRequestModel.password = input,
                            controller: _oldPasswordController,
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
                              hintText: "Please enter your old password",
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
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  "New password",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, left: 10, right: 10),
                          child: TextFormField(
                            // onSaved: (input) => signupRequestModel.password = input,
                            controller: _newPasswordController,
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
                              hintText: "Please enter your new password",
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
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  "Confirm password",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, left: 10, right: 10),
                          child: TextFormField(
                            // onSaved: (input) => signupRequestModel.password = input,
                            controller: _confirmPasswordController,
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
                              hintText: "Please confirm your password",
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
                        SizedBox(
                          height: 15,
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
                                if (validateAndSave()) {
                                  setState(() {
                                    isApiCallProcess = true;
                                  });
                                  _requestChangePassword(
                                    _oldPasswordController.text,
                                    _newPasswordController.text,
                                    _confirmPasswordController.text,
                                  );
                                }
                              },
                              minWidth: MediaQuery.of(context).size.width,
                              height: 50,
                              child: Text(
                                "CHANHE PASSWORD",
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
              )
            ],
          ),
        ),
      ),
    );
  }

  _appBarMenu(BuildContext context) {
    return AppBar(
      title: Center(
          child: Text(
        "Change Password",
        style: TextStyle(color: Colors.black),
      )),
      leading: Builder(builder: (BuildContext context) {
        return IconButton(
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            });
      }),
      //elevation: 0.0,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
    );
  }

//Api call For change password

  void _requestChangePassword(
    String oldPassword,
    String newPassword,
    String confirmPassword,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String loginToken = preferences.getString("login_token");

    var header = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $loginToken'
    };

    var data = {
      'old_password': oldPassword,
      'password': newPassword,
      'confirm_password': confirmPassword,
    };
    var url = 'https://seller.sastowholesale.com/api/user/change-password';
    var res = await http.post(Uri.parse(url), body: data, headers: header);
    print(json.decode(res.body));
    var body = json.decode(res.body);

    if (res.statusCode == 200) {
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
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Login()), (route) => false);
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

  //Alert Dialog for Password Change Successfully

  // showAlertDialog(BuildContext context) {
  //   // set up the button
  //   Widget okButton = TextButton(
  //     child: Container(
  //       height: 30,
  //       width: 50,
  //       child: Text("OK", style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),),
  //       color: Colors.blue,
  //     ),
  //     onPressed: () {
  //       Navigator.of(context).pushAndRemoveUntil(
  //           MaterialPageRoute(builder: (context) => Login()), (route) => false);
  //     },
  //   );
  //
  //   // set up the AlertDialog
  //   AlertDialog alert = AlertDialog(
  //     title: Text(
  //       "Done!",
  //       style: TextStyle(
  //           color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 25),
  //     ),
  //     content: Text(
  //       "Your password is changed! Please try login with new password!",
  //       style: TextStyle(
  //           color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16),
  //     ),
  //     actions: [
  //       okButton,
  //     ],
  //   );
  //
  //   // show the dialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Material(borderRadius: BorderRadius.circular(10), child: alert);
  //     },
  //   );
  // }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}

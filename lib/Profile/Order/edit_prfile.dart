import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sasto_wholesale/ApiService/progress_hud.dart';
import 'package:sasto_wholesale/Login/Model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool isApiCallProcess = false;

  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _usernameTextController = TextEditingController();
  TextEditingController _birthDateTextController = TextEditingController();
  TextEditingController _phoneTextController = TextEditingController();
  TextEditingController _genderTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? value = null;

  List<String> _values = <String>[];

  @override
  void initState() {
    super.initState();
    _values.addAll(['Male', 'Female']);
    value = _values.elementAt(0);

  }

  void _onChanged(String value) {
    setState(() {
      value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetUpForEditProfile(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  @override
  Widget _uiSetUpForEditProfile(BuildContext context) {
    return Scaffold(
      appBar: _appBarMenu(context),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 30),
                          child: Text(
                            "Full Name",
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
                              hintText: "Enter Name",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15.0),
                            ),
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
                                  "User Name",
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
                            controller: _usernameTextController,
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
                              hintText: "User Name",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15.0),
                            ),
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
                                  "Birthday",
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
                            controller: _birthDateTextController,
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
                              hintText: "Enter your birthday",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15.0),
                            ),
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
                                  "Mobile Number",
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
                            controller: _phoneTextController,
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
                              hintText: "9861099799",
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15.0),
                            ),
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
                                  "Gender",
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
                              top: 15.0, left: 10, right: 10, bottom: 10),
                          child: Container(
                            //width: 150,
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1.0,
                                    style: BorderStyle.solid,
                                    color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                            ),
                            child: new DropdownButtonHideUnderline(
                              child: new Column(
                                children: <Widget>[
                                  new DropdownButtonFormField(
                                    // onSaved: (input) => signupRequestModel.church = input,
                                    isExpanded: true,
                                    // dropdownColor: Colors.blue,
                                    iconEnabledColor: Colors.black,
                                    hint: Text(
                                      "Select Gender",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0),
                                    ),
                                    //value: _value,
                                    items: _values.map((String value) {
                                      return new DropdownMenuItem(
                                          value: value,
                                          child: new Text(
                                            " ${value}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold),
                                            overflow: TextOverflow.ellipsis,
                                          ));
                                    }).toList(),
                                    isDense: true,
                                    onChanged: (String? value) {
                                      _onChanged(value!);
                                      setState(() {
                                        _genderTextController.text = value;
                                      });
                                    },
                                    // validator: (value) {
                                    //   if (value.isEmpty) {
                                    //     return "The password doesnot match";
                                    //   }
                                    //   return null;
                                    // },
                                  ),
                                ],
                              ),
                            ),
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
                                  _updateEditProfile(
                                    _nameTextController.text,
                                    _usernameTextController.text,
                                    _birthDateTextController.text,
                                    _phoneTextController.text,
                                    _genderTextController.text,
                                  );
                                }
                              },
                              minWidth: MediaQuery.of(context).size.width,
                              height: 50,
                              child: Text(
                                "SAVE CHANGES",
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
            )
          ],
        ),
      ),
    );
  }

  _appBarMenu(BuildContext context) {
    return AppBar(
      title: Center(
          child: Text(
        "Edit Profile",
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

  //Api Call

  void _updateEditProfile(
    String fullName,
    String userName,
    String birthday,
    String phone_num,
    String gender,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String loginToken = preferences.getString("login_token");
    int userId = preferences.getInt("userId");

    var header = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $loginToken'
    };

    var data = {
      'name': fullName,
      'user_name': userName,
      'birthday': birthday,
      'gender': gender,
      'phone_num': phone_num,
    };
    var url = 'https://seller.sastowholesale.com/api/user/edit-user-profile/';
    var jsonResponse;
    var res = await http.put(Uri.parse(url + userId.toString()),
        body: data, headers: header);
    print(json.decode(res.body));
    var body = json.decode(res.body);

    if (body['message'] == 'User Profile updated Successfully!!') {
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
    } else {
      setState(() {
        isApiCallProcess = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(body['data'].toString(),
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

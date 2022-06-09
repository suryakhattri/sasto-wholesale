import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sasto_wholesale/ApiService/api_service.dart';
import 'package:sasto_wholesale/ApiService/progress_hud.dart';
import 'package:sasto_wholesale/ApiService/share_service.dart';
import 'package:sasto_wholesale/ForgotPassword/forgot_password.dart';
import 'package:sasto_wholesale/Login/Model/login_model.dart';
import 'package:sasto_wholesale/SignUp/sign_up.dart';
import 'package:sasto_wholesale/bottom_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late bool _passwordVisible;
  TextEditingController _emailTextController = TextEditingController();

  TextEditingController _passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isApiCallProcess = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
    );
  }

  @override
  Widget _uiSetup(BuildContext context) {
    return Scaffold(
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
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 100.0,
                  ),
                  child: RichText(
                    text: TextSpan(
                        text: "BETTER ",
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.yellow[900],
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                              text: "DEALS",
                              style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ))
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "WITH SASTO WHOLESALE",
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "JUST IN TIME",
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
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
                    child: Form(
                      key: _formKey,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Center(
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, top: 20),
                              child: Text(
                                "Phone Number or Email",
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
                                // onSaved: (input) =>
                                //     loginRequestModel!.email = input!,
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
                                  hintText: "Enter phone number or email",
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0),
                                ),
                                validator: (input) => !input!.contains('@')
                                    ? "Email Id should be valid"
                                    : null,
                              ),
                            ),

                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, top: 3),
                              child: Text(
                                "We'll never share your email with anyone else.",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Text(
                                      "Password",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  new ForgotPassword()));
                                    },
                                    child: Text(
                                      "Forgot Password ?",
                                      style: TextStyle(
                                          color: Colors.blue,
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
                                // onSaved: (input) =>
                                //     loginRequestModel!.password = input!,
                                controller: _passwordTextController,
                                style: TextStyle(color: Colors.black),
                                obscureText: !_passwordVisible,
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
                                        fontSize: 17.0),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        // Based on passwordVisible state choose the icon
                                        _passwordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.black,
                                      ),
                                      onPressed: () {
                                        // Update the state i.e. toogle the state of passwordVisible variable
                                        setState(() {
                                          _passwordVisible = !_passwordVisible;
                                        });
                                      },
                                    )),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "The password field cannot be empty.";
                                  } else if (value.length < 6) {
                                    return "Enter at least 6 charactor password.";
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
                                  // onPressed: _emailTextController.text == "" ||
                                  //         _passwordTextController.text == ""
                                  //     ? null
                                  //     : () {
                                  //         setState(() {
                                  //           isApiCallProcess = true;
                                  //         });
                                  //         loginApi(_emailTextController.text,
                                  //             _passwordTextController.text);
                                  //       },
                                  onPressed: () {
                                    if (validateAndSave()) {
                                      setState(() {
                                        isApiCallProcess = true;
                                      });
                                      _login(_emailTextController.text,
                                          _passwordTextController.text);
                                    }
                                  },
                                  minWidth: MediaQuery.of(context).size.width,
                                  height: 50,
                                  child: Text(
                                    "LOGIN",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              thickness: 2,
                              endIndent: 15,
                              indent: 15,
                              color: Colors.blue,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, top: 10, bottom: 0),
                              child: Text(
                                "Sign In With:",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 2.3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, left: 10, right: 10),
                                    child: Material(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0)),
                                      color: Colors.blue[900],
                                      elevation: 2.0,
                                      child: MaterialButton(
                                        onPressed: () {
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //         new BottomNavigationDataItems()));
                                        },
                                        minWidth: MediaQuery.of(context).size.width,
                                        height: 50,
                                        child: Text(
                                          "FACEBOOK",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 2.3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, left: 10, right: 10),
                                    child: Material(
                                      // borderRadius: BorderRadius.circular(28.0),
                                      // color: Colors.blue.withOpacity(0.8),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0)),
                                      color: Colors.red[900],
                                      elevation: 2.0,
                                      //   highlightElevation: 2,
                                      child: MaterialButton(
                                        onPressed: () {
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) =>
                                          //         new BottomNavigationDataItems()));
                                        },
                                        minWidth: MediaQuery.of(context).size.width,
                                        height: 50,
                                        child: Text(
                                          "GOOGLE",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RichText(
                                    text: TextSpan(
                                        text: "New member ?",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                        children: [
                                      WidgetSpan(
                                          alignment:
                                              PlaceholderAlignment.baseline,
                                          baseline: TextBaseline.alphabetic,
                                          child: SizedBox(width: 10)),
                                      TextSpan(
                                          text: "Register Here",
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () =>
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SignUp()))),
                                    ])),
                              ),
                            ),
                            SizedBox(
                              height: 20,
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
        ),
      ]),
    );
  }

  void _login(String email, String password) async {
    var data = {'email': email, 'password': password};
    var url = 'https://seller.sastowholesale.com/api/user/login';
    // var res = await Provider.of<Network>(context, listen: false)
    //     .authData(data, 'api/user/login');
    var jsonResponse;
    var res = await http.post(Uri.parse(url), body: data);
    // final provider =
    //     Provider.of<LocationProvider>(context, listen: false).loading;
    print(json.decode(res.body));
    var body = json.decode(res.body);

    if (body['message'] == 'success') {
      setState(() {
        isApiCallProcess = false;
      });
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString("login_token", body["token"]);
     // var user = body["user"];
      SharedPreferences userId = await SharedPreferences.getInstance();
      userId.setInt("userId", body["user"]["id"]);

      print(body["user"]["id"]);
      //This is where I set the token
      //Navigator.of(context).pushReplacementNamed('/bottom-bar');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => BottomNavigationDataItems()),
              (route) => false);
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
            onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar()),
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

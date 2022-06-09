import 'package:flutter/material.dart';

import '../Theme/light_color.dart';

class BecameAPartner extends StatefulWidget {
  const BecameAPartner({Key? key}) : super(key: key);

  @override
  _BecameAPartnerState createState() => _BecameAPartnerState();
}

class _BecameAPartnerState extends State<BecameAPartner> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Fill the form",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Divider(thickness: 0.5,),
                  SizedBox(height: 10,),
                  Text(
                    "Company Details:",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10,),
                  _companyName(),
                  SizedBox(height: 10,),
                  _email(),
                  SizedBox(height: 10,),
                  _address(),
                  SizedBox(height: 10,),
                  _phoneNumber(),
                  SizedBox(height: 10,),
                  _eastablishedYear(),
                  SizedBox(height: 10,),
                  _website(),
                  SizedBox(height: 10,),
                  _partnerType(),
                  SizedBox(height: 10,),
                  Text(
                    "Personal Details:",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10,),
                  _fullName(),
                  SizedBox(height: 10,),
                  _personalEmail(),
                  SizedBox(height: 10,),
                  _designation(),
                  SizedBox(height: 10,),
                  _contactNumber(),
                  SizedBox(height: 10,),
                  _submitButton(),
                  SizedBox(height: 10,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Company Name
  Widget _companyName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            top: 10,
          ),
          child: Text(
            "Company Name",
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
            // controller: _nameTextController
            //   ..text = snapshot.data!.data.fullName,
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
              hintText: "Your Company Name",
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
      ],
    );
  }

  //Email
  Widget _email() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            top: 10,
          ),
          child: Text(
            "Email",
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
            // controller: _nameTextController
            //   ..text = snapshot.data!.data.fullName,
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
              hintText: "entermail@gmail.com",
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
      ],
    );
  }

  //Address
  Widget _address() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            top: 10,
          ),
          child: Text(
            "Address",
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
            // controller: _nameTextController
            //   ..text = snapshot.data!.data.fullName,
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
              hintText: "Your Company Address",
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
      ],
    );
  }

  //Phone Number
  Widget _phoneNumber() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            top: 10,
          ),
          child: Text(
            "Phone Number",
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
            // controller: _nameTextController
            //   ..text = snapshot.data!.data.fullName,
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
              hintText: "Enter Your Phone Number",
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
      ],
    );
  }

  //Eastablished Year
  Widget _eastablishedYear() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            top: 10,
          ),
          child: Text(
            "Eastablished Year",
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
            // controller: _nameTextController
            //   ..text = snapshot.data!.data.fullName,
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
              hintText: "Enter Eastablished Year",
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
      ],
    );
  }

  //Website
  Widget _website() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            top: 10,
          ),
          child: Text(
            "Website",
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
            // controller: _nameTextController
            //   ..text = snapshot.data!.data.fullName,
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
              hintText: "Your Company Website",
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
      ],
    );
  }

  //Apply For Partner
  Widget _partnerType() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            top: 10,
          ),
          child: Text(
            "Apply for(Partner Type)",
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
            // controller: _nameTextController
            //   ..text = snapshot.data!.data.fullName,
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
              hintText: "Select Partner Type",
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
      ],
    );
  }

  //Full Name
  Widget _fullName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            top: 10,
          ),
          child: Text(
            "Full Name",
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
            // controller: _nameTextController
            //   ..text = snapshot.data!.data.fullName,
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
              hintText: "Your Full Name",
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
      ],
    );
  }

  //email
  Widget _personalEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            top: 10,
          ),
          child: Text(
            "Email",
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
            // controller: _nameTextController
            //   ..text = snapshot.data!.data.fullName,
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
              hintText: "Your Email",
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
      ],
    );
  }

  //Designation
  Widget _designation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            top: 10,
          ),
          child: Text(
            "Designation",
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
            // controller: _nameTextController
            //   ..text = snapshot.data!.data.fullName,
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
              hintText: "Your Designation",
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
      ],
    );
  }

  //Contact number
  Widget _contactNumber() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            top: 10,
          ),
          child: Text(
            "Contact number",
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
            // controller: _nameTextController
            //   ..text = snapshot.data!.data.fullName,
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
              hintText: "Your Contact number",
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
      ],
    );
  }

  //Submit Button
  Widget _submitButton() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: MaterialButton(
          onPressed: () {
            validateAndSave();
            //  Navigator.pop(context);
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => new BottomNavigationDataItems()));
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: Color.fromRGBO(29, 124, 201, 1),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 12),
            // width: AppTheme.fullWidth(context) * .7,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text(
                  'Submit',
                  style: TextStyle(
                      color: LightColor.background,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
          )),
    );
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


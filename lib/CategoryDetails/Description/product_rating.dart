import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProductRating extends StatefulWidget {
  const ProductRating({Key? key}) : super(key: key);

  @override
  _ProductRatingState createState() => _ProductRatingState();
}

class _ProductRatingState extends State<ProductRating> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 10),
                  child: Text(
                    "Ratings & Reviews",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10,),
                Divider(thickness: 0.5, color: Colors.black,),
                SizedBox(height: 10.0,),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 10),
                  child: Text(
                    "How satisfied are you with our product?",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left:15.0),
                  child: Row(
                    children: [
                      Center(
                          child: SmoothStarRating(
                       // rating: rating,
                       // isReadOnly: true,
                        size: 40,
                        color: Colors.pink,
                        borderColor: Colors.pinkAccent,
                        filledIconData: Icons.star,
                        halfFilledIconData: Icons.star_half,
                        defaultIconData: Icons.star_border,
                        starCount: 5,
                        allowHalfRating: true,
                        spacing: 2.0,
                        onRated: (value) {
                          print("rating value -> $value");
                          // print("rating value dd -> ${value.truncate()}");
                        },
                      )),
                    ],
                  ),
                ),
                Divider(thickness: 0.5, color: Colors.black,),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, left: 10, right: 10),
                  child: TextFormField(
                    minLines: 8,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    // onSaved: (input) => signupRequestModel.password = input,
                    //  controller: _passwordTextController,
                    style: TextStyle(color: Colors.black),
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
                      hintText:
                      "Write Feedback",
                      hintMaxLines: 2,
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0),
                    ),
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
                        //         new BottomNavigationDataItems()));
                      },
                      minWidth: MediaQuery.of(context).size.width,
                      height: 50,
                      child: Text(
                        "SUBMIT",
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
    );
  }
}

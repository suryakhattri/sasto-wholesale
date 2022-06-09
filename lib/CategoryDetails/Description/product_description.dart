import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:sasto_wholesale/CategoryDetails/category_details.dart';
import 'package:sasto_wholesale/CategoryDetails/category_details_model.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({Key? key, required this.slug}) : super(key: key);
  final String slug;

  @override
  _ProductDescriptionState createState() => _ProductDescriptionState();
}
class _ProductDescriptionState extends State<ProductDescription> {
  late Future<CaegoryDetailModel> _categoryDescription;

  @override
  void initState() {
    super.initState();
    String slugData = widget.slug;
    _categoryDescription = fetchCategoryDetails(slugData);
    // Setting the initial value for the field.
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          child: FutureBuilder<CaegoryDetailModel>(
            future: _categoryDescription,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Quick Details",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Text(
                                    "Use:",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                snapshot.data!.data.overview.use != null
                                    ? Container(
                                        width: 300,
                                        child: Text(
                                          snapshot.data!.data.overview.use,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17,
                                              fontWeight: FontWeight.normal),
                                          // maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                    : Text(""),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Text(
                                    "Brand:",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                snapshot.data!.data.overview.brand != null
                                    ? Text(
                                        snapshot.data!.data.overview.brand,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.normal),
                                      )
                                    : Text("")
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Text(
                                    "Color:",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                snapshot.data!.data.overview.colors != null
                                    ? Text(
                                        snapshot.data!.data.overview.colors,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.normal),
                                      )
                                    : Text(""),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Text(
                                    "Gender:",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                snapshot.data!.data.overview.gender != null
                                    ? Text(
                                        snapshot.data!.data.overview.gender,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.normal),
                                      )
                                    : Text(""),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Text(
                                    "Age Group:",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                snapshot.data!.data.overview.ageGroup != null
                                    ? Text(
                                        snapshot.data!.data.overview.ageGroup,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.normal),
                                      )
                                    : Text(""),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Text(
                                      "Payment Model:",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  snapshot.data!.data.overview.paymentMode !=
                                          null
                                      ? Text(
                                          snapshot
                                              .data!.data.overview.paymentMode,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17,
                                              fontWeight: FontWeight.normal),
                                        )
                                      : Text("")
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Text(
                                    "Country Of Origin:",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                snapshot.data!.data.overview.countryOfOrigin !=
                                        null
                                    ? Text(
                                        snapshot.data!.data.overview
                                            .countryOfOrigin,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.normal),
                                      )
                                    : Text("")
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Text(
                                    "Feature:",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                snapshot.data!.data.overview.feature != null
                                    ? Text(
                                        snapshot.data!.data.overview.feature,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.normal),
                                      )
                                    : Text(""),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Text(
                                    "Warrenty:",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                snapshot.data!.data.overview.warranty != null
                                    ? Text(
                                        snapshot.data!.data.overview.warranty,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.normal),
                                      )
                                    : Text(""),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Divider(
                              thickness: 0.5,
                              color: Colors.black,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, top: 10),
                              child: Text(
                                "Quick Details",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Center(
                              child: Html(
                                data: snapshot.data!.data.highlight != null
                                    ? snapshot.data!.data.highlight
                                    /*_parseHtmlString(payload.body)*/
                                    : "",
                              ),
                            ),
                            SizedBox(
                              height: 100,
                            ),
                          ],
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
    );
  }
}

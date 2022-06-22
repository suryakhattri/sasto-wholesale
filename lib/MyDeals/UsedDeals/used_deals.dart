import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sasto_wholesale/MyDeals/AllDeals/all_deals_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsedDeals extends StatefulWidget {
  const UsedDeals({Key? key}) : super(key: key);

  @override
  _UsedDealsState createState() => _UsedDealsState();
}

class _UsedDealsState extends State<UsedDeals> {
  late Future<AllDealModel> _usedDealData;

  @override
  void initState() {
    super.initState();
    _usedDealData = fetchUsedDealData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FutureBuilder<AllDealModel>(
          future: _usedDealData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              AllDealModel model = snapshot.data!;
              return model.data.isNotEmpty
                  ? ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: model.data.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Material(
                                elevation: 5,
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        //height: 80,
                                        decoration: BoxDecoration(
                                            color: Colors.blue[900],
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                            )),
                                        child: ListTile(
                                            title: Text(
                                              model.data[index].vendor.name,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                            trailing: MaterialButton(
                                              elevation: 2,
                                              color: Colors.blue,
                                              focusElevation: 4,
                                              hoverElevation: 4,
                                              highlightElevation: 8,
                                              disabledElevation: 0,
                                              onPressed: () {},
                                              child: Text(
                                                'Chat with supplier',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
                                              ),
                                            )),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: ListView.builder(
                                            itemCount: model.data[index]
                                                .dealProducts.length,
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 10.0),
                                                child: Column(
                                                  children: [
                                                    ListTile(
                                                      onTap: () {},
                                                      leading: Image.network(
                                                          model
                                                              .data[index]
                                                              .dealProducts[
                                                                  index]
                                                              .product
                                                              .imageUrl),
                                                      title: Text(
                                                        model
                                                            .data[index]
                                                            .dealProducts[index]
                                                            .product
                                                            .title,
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      trailing: Text(
                                                        "${model.data[index].dealProducts[index].unitPrice.toString()} * ${model.data[index].dealProducts[index].productQty.toString()}",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 0.5,
                                                      color: Colors.grey,
                                                      endIndent: 5,
                                                      indent: 5,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                      ),
                                      ListTile(
                                        leading: Text(
                                          "Subtotal",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        title: Center(
                                            child: Text(
                                          "Shipping",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        trailing: Text(
                                          "Total",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      ListTile(
                                        leading: Text(
                                          model.data[index].subtotalPrice
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        title: Center(
                                            child: Text(
                                          model.data[index].shippingCharge
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        trailing: Text(
                                          model.data[index].totalPrice
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        //height: 80,
                                        decoration: BoxDecoration(
                                            color: Colors.green[500],
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
                                            )),
                                        child: ListTile(
                                          title: Center(
                                            child: Text(
                                              "Completed",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      })
                  : Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Center(
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Nothing Here",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "There's nothing here to show.",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
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
    );
  }
}
// Api Call
Future<AllDealModel> fetchUsedDealData() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String loginToken = preferences.getString("login_token")!;
  // int userId = preferences.getInt("userId");

  var header = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $loginToken'
  };

  var url =
      'https://seller.sastowholesale.com/api/deals?status=available&page=1';

  final response = await http.get(Uri.parse(url), headers: header);
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    print("${response.body}");
    return new AllDealModel.fromJson(jsonResponse);
  } else {
    throw Exception('Failed to load Expired Items');
  }
}

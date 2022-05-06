import 'package:flutter/material.dart';

class ExpiredDeals extends StatefulWidget {
  const ExpiredDeals({Key? key}) : super(key: key);

  @override
  _ExpiredDealsState createState() => _ExpiredDealsState();
}

class _ExpiredDealsState extends State<ExpiredDeals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: 4,
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
                                    "Addict fashion wears",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  trailing: RaisedButton(
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
                              padding: const EdgeInsets.only(top: 10.0),
                              child: ListView.builder(
                                  itemCount: 2,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                      const EdgeInsets.only(bottom: 10.0),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            onTap: () {},
                                            leading: Image.asset(
                                                "assets/images/jacket.jpeg"),
                                            title: Text(
                                              "Men's Inside Fur Warm Jacket",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            trailing: Text(
                                              "Rs. 90,000 x 1",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
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
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              title: Center(
                                  child: Text(
                                    "Shipping",
                                    style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.bold),
                                  )),
                              trailing: Text(
                                "Total",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            ListTile(
                              leading: Text(
                                "Rs. 650",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              title: Center(
                                  child: Text(
                                    "Rs. 20",
                                    style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.bold),
                                  )),
                              trailing: Text(
                                "Rs. 670",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              //height: 80,
                              decoration: BoxDecoration(
                                  color: Colors.red[500],
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  )),
                              child: ListTile(
                                title: Center(
                                  child: Text(
                                    "Not available",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ),

                              ),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}

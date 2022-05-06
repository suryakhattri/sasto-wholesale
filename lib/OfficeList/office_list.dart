import 'package:flutter/material.dart';
import 'package:sasto_wholesale/OfficeList/Model/office_model.dart';

class OfficeList extends StatelessWidget {
  OfficeList({Key? key}) : super(key: key);

  final List<OfficeListItem> _items = [
    OfficeListItem(
        name: "Nepal",
        officeName: "Sasto Wholesale Nepal Office",
        contact: "Contact: Sunil Gurung",
        phone: "Phone: +977-9848728375",
        email: "Email: sunil@sastowholesale.com"

    ),
    OfficeListItem(
        name: "Global",
        officeName: "Sasto Wholesale Nepal Office",
        contact: "Contact: Sunil Gurung",
        phone: "Phone: +977-9848728375",
        email: "Email: sunil@sastowholesale.com"

    ),
    OfficeListItem(
        name: "China",
        officeName: "Sasto Wholesale Nepal Office",
        contact: "Contact: Sunil Gurung",
        phone: "Phone: +977-9848728375",
        email: "Email: sunil@sastowholesale.com"

    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:10.0, bottom: 10.0, left: 10.0, right: 10.0),
            child: ListView.builder(
              shrinkWrap: true,
             physics: NeverScrollableScrollPhysics(),
             // scrollDirection: Axis.vertical,
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    elevation: 1,
                    borderRadius: BorderRadius.circular(10),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.add_location_rounded, size: 20, color: Colors.red,),
                              Text(
                                _items[index].name,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            _items[index].officeName,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            _items[index].contact,
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            _items[index].phone,
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            _items[index].email,
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0.0, left: 10, right: 10),
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
                  "VIEW ALL LOCATIONS",
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
    );
  }
}
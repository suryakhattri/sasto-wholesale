import 'package:flutter/material.dart';
import 'package:sasto_wholesale/SastoWholeSale/Models/wholesaleMarketItems.dart';

class OurPartners extends StatelessWidget {
   OurPartners({Key? key}) : super(key: key);
   final List<WholesaleMarketItems> _items = [
     WholesaleMarketItems(
       name: "Nepal",
       url: 'assets/images/partner1.png',
       description: '7pcs',
       price: 4.99,
     ),
     WholesaleMarketItems(
       name: "India",
       url: 'assets/images/partner2.png',
       description: '7pcs',
       price: 4.99,
     ),
     WholesaleMarketItems(
       name: 'China',
       url: 'assets/images/partner3.png',
       description: '1kg',
       price: 5.99,
     ),
     WholesaleMarketItems(
       name: 'China',
       url: 'assets/images/partner4.png',
       description: '1kg',
       price: 5.99,
     ),
     WholesaleMarketItems(
       name: 'China',
       url: 'assets/images/partner5.png',
       description: '1kg',
       price: 5.99,
     ),
   ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          //  borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 10, right: 10, bottom: 10),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    // color: Colors.blueAccent,
                    child: Material(
                      elevation: 1,
                      borderRadius: BorderRadius.circular(10),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Hero(
                          tag: _items.hashCode,
                          child: Image.asset(
                            _items[index].url,
                            // height: constraints.maxHeight * 0.6,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  // Text(
                  //   _items[index].name,
                  //   style: TextStyle(
                  //       color: Colors.black,
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 15),
                  // ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

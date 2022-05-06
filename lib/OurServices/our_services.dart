import 'package:flutter/material.dart';
import 'package:sasto_wholesale/OurServices/our_service_details.dart';
import 'package:sasto_wholesale/Rfq/rfq.dart';
import 'package:sasto_wholesale/SastoWholeSale/Models/wholesaleMarketItems.dart';

class OurServices extends StatelessWidget {
   OurServices({Key? key}) : super(key: key);

  final List<WholesaleMarketItems> _items = [
    WholesaleMarketItems(
      name: "Shipping",
      url: 'assets/images/trade1.jpeg',
      description: '7pcs',
      price: 4.99,
    ),
    WholesaleMarketItems(
      name: "Plumbering",
      url: 'assets/images/trade1.jpeg',
      description: '7pcs',
      price: 4.99,
    ),
    WholesaleMarketItems(
      name: "Real State",
      url: 'assets/images/rfq.jpeg',
      description: '7pcs',
      price: 4.99,
    ),
    WholesaleMarketItems(
      name: 'Legal',
      url: 'assets/images/trade2.jpeg',
      description: '1kg',
      price: 5.99,
    ),
    WholesaleMarketItems(
      name: 'Apparal',
      url: 'assets/images/trade3.jpeg',
      description: '1kg',
      price: 3.99,
    ),
    WholesaleMarketItems(
      name: 'Electronics',
      url: 'assets/images/trade4.jpeg',
      description: '1kg',
      price: 5.99,
    ),
    WholesaleMarketItems(
      name: 'Real State',
      url: 'assets/images/trade3.jpeg',
      description: '1kg',
      price: 3.99,
    ),
    WholesaleMarketItems(
      name: 'Jeweelry',
      url: 'assets/images/trade2.jpeg',
      description: '1kg',
      price: 5.99,
    ),
    WholesaleMarketItems(
      name: "Kicthen",
      url: 'assets/images/trade1.jpeg',
      description: '7pcs',
      price: 4.99,
    ),
    WholesaleMarketItems(
      name: 'Smartphone',
      url: 'assets/images/trade2.jpeg',
      description: '1kg',
      price: 5.99,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 10),
      child: Container(
        height: 120,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                // if(_items[index].name == "Rfq") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          new OurServiceDetails()));
               // }
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 1.0),
                  // color: Colors.tealAccent,
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                            _items[index].url,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        _items[index].name,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (_, __) => SizedBox(width: 5),
        ),
      ),
    );
  }
}
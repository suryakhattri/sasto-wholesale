import 'package:flutter/material.dart';
import 'package:sasto_wholesale/CategoryDetails/category_details.dart';

import 'Models/wholesaleMarketItems.dart';

class SastoWholesaleMarketList extends StatelessWidget {
  final LatestSuppliers latestSuppliers;

  const SastoWholesaleMarketList({Key? key, required this.latestSuppliers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: LayoutBuilder(
        builder: (_, constraints) {
          return Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                latestSuppliers.imageUrl,
                height: constraints.maxHeight * 0.6,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  latestSuppliers.shopName,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

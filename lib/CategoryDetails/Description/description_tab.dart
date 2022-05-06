import 'package:flutter/material.dart';
import 'package:sasto_wholesale/CategoryDetails/Description/company_profile.dart';
import 'package:sasto_wholesale/CategoryDetails/Description/product_description.dart';
import 'package:sasto_wholesale/CategoryDetails/Description/product_rating.dart';


class DescriptionTab extends StatefulWidget {
  const DescriptionTab({Key? key, required this.slugData}) : super(key: key);
  final String slugData;

  @override
  _DescriptionTabState createState() => _DescriptionTabState();
}

class _DescriptionTabState extends State<DescriptionTab> {

  //

  @override
  void initState() {
    super.initState();
   // String slugData = widget.slugData;
    // Setting the initial value for the field.
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            TabBar(
                indicatorColor: Colors.blue,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                labelPadding: EdgeInsets.symmetric(horizontal: 20.0),
                tabs: [
                  Tab(
                    child: Row(
                      children: <Widget>[
                        Text("Product Details", style: TextStyle(color: Colors.blue, fontSize: 17.0, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: <Widget>[
                        Text("Company Profile", style: TextStyle(color: Colors.blue, fontSize: 17.0, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: <Widget>[
                        Text("Ratings", style: TextStyle(color: Colors.blue, fontSize: 17.0, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ]
            ),
            Expanded(
              flex: 1,
              child: TabBarView(
                children: [
                  ProductDescription(slug: widget.slugData),
                  CompanyProfile(),
                  ProductRating()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

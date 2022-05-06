import 'package:flutter/material.dart';

class AvailableDeals extends StatefulWidget {
  const AvailableDeals({Key? key}) : super(key: key);

  @override
  _AvailableDealsState createState() => _AvailableDealsState();
}

class _AvailableDealsState extends State<AvailableDeals> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("available")),
    );
  }
}

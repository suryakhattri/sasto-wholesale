import 'package:flutter/material.dart';

class DeliverOrder extends StatefulWidget {
  const DeliverOrder({Key? key}) : super(key: key);

  @override
  _DeliverOrderState createState() => _DeliverOrderState();
}

class _DeliverOrderState extends State<DeliverOrder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "There are no orders placed yet.",
            style: TextStyle(
                color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
          ),
          RaisedButton(
            elevation: 2,
            color: Colors.blue,
            focusElevation: 4,
            hoverElevation: 4,
            highlightElevation: 8,
            disabledElevation: 0,
            onPressed: () {},
            child: Text(
              'Continue Shopping',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sasto_wholesale/CategoryDetails/Product.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    return Column(
      children: [
        SizedBox(
          width: 230,
          child: AspectRatio(
            aspectRatio: 1,
            child: Text(product.title),
          ),
        )
      ],
    );
  }
}

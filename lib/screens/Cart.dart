import 'package:flutter/material.dart';

import '../model/category_model.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Item Details'),
        ),
        body: Column(
          children: [
            CartProductCard(
              categories: dummyCategorys[0],
            )
          ],
        ));
  }
}

class CartProductCard extends StatelessWidget {
  final Category categories;
  const CartProductCard({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          categories.image,
          width: 100,
          height: 100,
        )
      ],
    );
  }
}

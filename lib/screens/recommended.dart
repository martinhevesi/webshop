import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webshop/models/product.dart';
import 'package:webshop/screens/home_page.dart';
import 'package:webshop/screens/product_card.dart';


class Recommended extends StatelessWidget {
  final OnProductSelect onProductSelect;

  const Recommended({Key key, this.onProductSelect}): super(key: key);

  Widget _buildItem(BuildContext context, int index){
    var product = PRODUCTS[index];
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 10,
      ),
      height: 230,
      child: Stack(
        children: [
          Positioned.fill(
            left: 60,
            child: Container(
              child: ProductCard(
                product: PRODUCTS[index],
                padding: EdgeInsets.only(left: 70),
                onProductSelect: onProductSelect,
              ),
            ),
          ),
          Container(
            width: 150,
            height: 150,
            margin: EdgeInsets.only(top: 35),
            child: Image.asset(product.imagePath),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: PRODUCTS.length,
              itemBuilder: _buildItem,
            ),
          ),
        ],
      ),
    );
  }
}
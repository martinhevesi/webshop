import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:webshop/components/amount_selector.dart';
import 'package:webshop/components/cart_button.dart';
import 'package:webshop/components/profile_button.dart';
import 'package:webshop/l10n/webshop_localizations.dart';
import 'package:webshop/models/cart.dart';
import 'package:webshop/models/cart_item.dart';
import 'package:webshop/screens/details/add_product_button.dart';
import 'package:webshop/screens/details/size.dart';
import 'package:webshop/screens/details/size_selector_buttons.dart';
import 'package:webshop/screens/details/total.dart';
import 'package:webshop/models/product.dart';
import 'package:webshop/components/rating.dart';
import 'package:provider/provider.dart';
import 'package:webshop/screens/details/color.dart';

class ProductDetails extends StatefulWidget {
  final Product product;
  final void Function() onShowProfile;
  final void Function() onShowCart;

  const ProductDetails({
    Key key,
    this.product,
    this.onShowProfile,
    this.onShowCart,
  }) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String _size;
  String _color;
  int _amount = 1;

  @override
  void initState() {
    super.initState();
  }


  void _changeSize(String size) {
    setState(() {
      _size = size;
    });
  }

  void _changeColor(String color) {
    setState(() {
      _color = color;
    });
  }


  void _changeAmount(int amount) {
    setState(() {
      _amount = amount;
    });
  }

  void _addProductToCart() {
    var cart = context.read<Cart>();
    for (var i = 0; i < _amount; i++) {
      cart.add(
        CartItem(
          product: widget.product,
          size: _size,
          color: _color,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          WebshopLocalizations.of(context).details,
          style: TextStyle(color: Colors.grey[900]),
        ),
        actions: [
          CartButton(
            iconColor: Colors.white,
            onPressed: widget.onShowCart,
          ),
          ProfileButton(
            iconColor: Colors.white,
            onPressed: widget.onShowProfile,
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[900],
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: SizeSelectorButtons(
                      image: Image.asset(widget.product.imagePath),
                      size: _size,
                      onSizeChange: _changeSize,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Raleway",
                          color: Colors.white
                        ),
                      ),
                      Rating(
                        rating: widget.product.rating,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
                child:ListView(
              children: [
              Color(
              color: _color,
                onColorSelect: _changeColor,
              ),
              Size(
                size: _size,
                onSizeChange: _changeSize,
              ),
              ],
            ),
            ),
            Container(
              width: MediaQuery.of(context).size.width/2,
              height: 50,
              child: AmountSelector(
                amount: _amount,
                amountChange: _changeAmount,
              ),
            ),
            Total(
              totalPrice: widget.product.price,
            ),
            AddProductButton(
              onPressed: _addProductToCart,
              amount: _amount,
            ),
          ],
        ),
      ),
    );
  }
}

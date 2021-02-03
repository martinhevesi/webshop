import 'package:flutter/material.dart';
import 'package:webshop/components/cart_button.dart';
import 'package:webshop/components/profile_button.dart';
import 'package:webshop/l10n/webshop_localizations.dart';
import 'package:webshop/models/cart.dart';
import 'package:webshop/screens/cart/cart_item_card.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  final void Function() onShowProfile;

  const CartPage({Key key, this.onShowProfile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<Cart>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          WebshopLocalizations.of(context).cart,
          style: TextStyle(color: Colors.white, fontFamily: "Raleway", fontWeight: FontWeight.bold),
        ),
        actions: [
          CartButton(
            iconColor: Colors.white,
          ),
          ProfileButton(
            iconColor: Colors.white,
            onPressed: onShowProfile,
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[900],
        child: Stack(
          children: [
            Container(
              child: ListView(
                children: cart.items
                    .map(
                      (item) => CartItemCard(
                    item: item,
                  ),
                )
                    .toList(),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 5,
              right: 5,
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                width: MediaQuery.of(context).size.width,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
                  color: Colors.white70,
                ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      WebshopLocalizations.of(context).total,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                  Text(
                    '\$${cart.total.toStringAsPrecision(4)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

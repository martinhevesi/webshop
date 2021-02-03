import 'package:flutter/material.dart';
import 'package:webshop/l10n/webshop_localizations.dart';
import 'package:webshop/models/product.dart';
import 'package:webshop/screens/recommended.dart';
import 'package:webshop/components/profile_button.dart';
import 'package:webshop/components/cart_button.dart';
import 'package:webshop/screens/lang.dart';

typedef OnProductSelect = void Function(Product product);

class HomePage extends StatelessWidget {
  final OnProductSelect onProductSelect;
  final void Function() onShowProfile;
  final void Function() onShowCart;

  const HomePage({
    Key key,
    this.onProductSelect,
    this.onShowProfile,
    this.onShowCart
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey[900],
            title: Text(WebshopLocalizations.of(context).mobilePhones, style: TextStyle(fontFamily: "Raleway", fontWeight: FontWeight.bold),),
            actions: [
              LangButton(),
              CartButton(
                onPressed: onShowCart,
              ),
              ProfileButton(
                onPressed: onShowProfile,
              ),
            ],
          ),
          body: Container(
            decoration: BoxDecoration(
              color: Colors.grey[900],
            ),
            child: Recommended(
              onProductSelect: onProductSelect,
            ),
          )
        )
    );

  }
}
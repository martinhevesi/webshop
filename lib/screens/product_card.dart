import 'package:flutter/material.dart';
import 'package:webshop/components/rating.dart';
import 'package:webshop/l10n/webshop_localizations.dart';
import 'package:webshop/models/product.dart';
import 'package:webshop/screens/home_page.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final EdgeInsetsGeometry padding;
  final OnProductSelect onProductSelect;

  const ProductCard({Key key,
    this.product,
    this.padding,
    this.onProductSelect
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.grey[900],
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              blurRadius: 5.0,
              spreadRadius: 2.0,
            ),
          ]
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: "Raleway",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    // padding: EdgeInsets.only(
                    //   top: 0,
                    //   bottom: 0,
                    // ),
                    child: Row(
                      children: [
                        Text(
                          '€${product.price}',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                child: Rating(
                                    rating: product.rating
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      product.param,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Raleway"
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 140),
            child:
            RaisedButton(
              onPressed: () {
                onProductSelect(product);
              },
              child: Row(
                children: [
                  Text(
                    WebshopLocalizations.of(context).addToCart,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: "Raleway"
                    ),
                  ),
                  Icon(Icons.add_shopping_cart_rounded)
                ],
              ),
              color: Colors.white,
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:webshop/l10n/webshop_localizations.dart';

class Total extends StatelessWidget {
  final double totalPrice;

  const Total({
    Key key,
    this.totalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 10,
      ),
      child: DottedBorder(
        customPath: (size) {
          return Path()
            ..moveTo(0, 0)
            ..lineTo(size.width, 0);
        },
        color: Colors.white,
        dashPattern: [6, 4],
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  WebshopLocalizations.of(context).total,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: "Raleway",
                  ),
                ),
              ),
              Text(
                '\$${totalPrice.toStringAsPrecision(4)}',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Raleway",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

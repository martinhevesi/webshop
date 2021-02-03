import 'package:flutter/material.dart';
import 'package:webshop/components/text_toggle_buttons.dart';
import 'package:webshop/l10n/webshop_localizations.dart';

typedef OnSizeChange = void Function(String size);

class Size extends StatelessWidget {
  final String size;
  final OnSizeChange onSizeChange;

  final options = [
    'small',
    'medium',
    'large',
  ];


  Size({Key key, this.size, this.onSizeChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            WebshopLocalizations.of(context).size,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontFamily: "Raleway",
            ),
            textAlign: TextAlign.left,
          ),
          TextToggleButtons(
            texts: options
                .map(
                  (option) =>
                  WebshopLocalizations.of(context).stringById(option),
            )
                .toList(),
            isSelected: [
              size == options[0],
              size == options[1],
              size == options[2],
            ],
            onPressed: (int index) {
              onSizeChange(options[index]);
            },
          ),
        ],
      ),
    );
  }
}

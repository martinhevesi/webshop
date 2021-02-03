import 'package:flutter/material.dart';
import 'package:webshop/components/text_toggle_buttons.dart';
import 'package:webshop/l10n/webshop_localizations.dart';

typedef OnColorSelect = void Function(String color);

class Color extends StatelessWidget {
  final OnColorSelect onColorSelect;
  final String color;

  final options = [
    'black',
    'white',
    'grey',
  ];

  Color({Key key, this.onColorSelect, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 50, top:50),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            WebshopLocalizations.of(context).color,
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
              color == options[0],
              color == options[1],
              color == options[2],
            ],
            onPressed: (int index) {
              onColorSelect(options[index]);
            },
          ),
        ],
      ),
    );
  }
}

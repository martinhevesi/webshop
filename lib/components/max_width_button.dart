import 'package:flutter/material.dart';

class MaxWidthButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const MaxWidthButton({
    Key key,
    this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) => ButtonTheme(
        minWidth: constrains.maxWidth,
        child: RaisedButton(
          onPressed: onPressed,
          color: Colors.deepPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontFamily: "Raleway",
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

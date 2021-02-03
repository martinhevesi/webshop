import 'package:flutter/material.dart';
import 'package:webshop/screens/details/size.dart';

class _SizeSelector extends StatelessWidget {
  final String size;
  final Function onPressed;
  final bool active;

  const _SizeSelector({Key key, this.size, this.onPressed, this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 40,
      height: 30,
      padding: EdgeInsets.all(0),
      child: RaisedButton(
        onPressed: onPressed,
        color: active ? Colors.deepPurple : Colors.grey,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.vertical(bottom: Radius.circular(4), top: Radius.circular(4)),
        ),
        child: Text(
          size,
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Raleway",
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

class SizeSelectorButtons extends StatelessWidget {
  final Image image;
  final String size;
  final OnSizeChange onSizeChange;

  const SizeSelectorButtons({Key key, this.image, this.size, this.onSizeChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 15,
            child: Container(
              width: 170,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10), bottom: Radius.circular(10)),
                border: Border.all(
                  color: Colors.deepPurple,
                  width: 2,
                ),
              ),
            ),
          ),
        Container(
          width: 110,
          height: 120,
          decoration: BoxDecoration(
          ),
        ),
        Container(
          width: 140,
          height: 150,
          child: image,
        ),
        Positioned(
          left: 125,
          top: 10,
          child: _SizeSelector(
            size: '64GB',
            onPressed: () {
              onSizeChange('small');
            },
            active: size == 'small',
          ),
        ),
        Positioned(
          left: 125,
          top: 50,
          child: _SizeSelector(
            size: '128GB',
            onPressed: () {
              onSizeChange('medium');
            },
            active: size == 'medium',
          ),
        ),
        Positioned(
          left: 125,
          bottom: 10,
          child: _SizeSelector(
            size: '256GB',
            onPressed: () {
              onSizeChange('large');
            },
            active: size == 'large',
          ),
        ),
      ],
    );
  }
}

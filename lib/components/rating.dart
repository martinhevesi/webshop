import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  final int rating;

  const Rating({Key key, this.rating}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < rating; i++)
          Icon(
            Icons.star,
            size: 15,
            color: Colors.yellow[700],
          ),
        for (var i = 0; i < 5 - rating; i++)
          Icon(
            Icons.star_border,
            size: 15,
            color: Colors.yellow[700],
          ),
      ],
    );
  }
}

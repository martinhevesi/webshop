import 'package:flutter/material.dart';
import 'package:webshop/l10n/webshop_localizations.dart';

class Unknown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(WebshopLocalizations.of(context).unknown),
          ],
        ),
      ),
    );
  }
}

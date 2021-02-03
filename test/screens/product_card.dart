import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:webshop/l10n/webshop_localizations.dart';
import 'package:webshop/models/product.dart';
import 'package:webshop/screens/product_card.dart';
import 'package:provider/provider.dart';

void main() {
  group('ProductCard', () {
    testWidgets('shows product name', (WidgetTester tester) async {
      await tester.pumpWidget(
        Localizations(
          locale: Locale('hu', 'HU'),
          delegates: [
            WebshopLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
            child: ProductCard(
              product: PRODUCTS[2],
            ),
        ),
      );
      await tester.pumpAndSettle();
      final productNameFinder = find.text(PRODUCTS[2].name);
      expect(productNameFinder, findsOneWidget);
    });
  });
}

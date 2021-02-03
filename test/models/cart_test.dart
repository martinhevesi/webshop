import 'package:flutter_test/flutter_test.dart';
import 'package:webshop/models/cart.dart';
import 'package:webshop/models/cart_item.dart';
import 'package:webshop/models/product.dart';

void main() {
  group('Cart', () {
    test('stores phones', () {
      var model = Cart();
      model.add(CartItem(
        product: PRODUCTS[0],
      ));

      expect(model.items.length, 1);
    });

    test('counts the total value', () {
      var model = Cart();
      model.add(CartItem(
        product: PRODUCTS[0],
      ));
      model.add(CartItem(
        product: PRODUCTS[1],
      ));

      expect(model.total, 2200);
    });
  });
}
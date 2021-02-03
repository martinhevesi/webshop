import 'package:contacts_service/contacts_service.dart';
import 'package:webshop/models/product.dart';

class CartItem {
  final Product product;
  final String size;
  final String color;
  Contact whoWillUse;

  CartItem({
    this.product,
    this.size,
    this.color,
    this.whoWillUse,
  });
}

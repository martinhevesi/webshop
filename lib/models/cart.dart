import 'dart:collection';

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:webshop/models/cart_item.dart';

class Cart with ChangeNotifier {

  List<CartItem> _items = [];

  UnmodifiableListView<CartItem> get items => UnmodifiableListView(_items);

  void add(CartItem item) {
    _items.add(item);
    notifyListeners();
  }

  void remove(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  double get total =>
      _items.fold(0, (amount, item) => item.product.price + amount);

  void setUser(CartItem item, Contact user) {
    item.whoWillUse = user;
    notifyListeners();
  }
}

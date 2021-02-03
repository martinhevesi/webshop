import 'package:flutter/material.dart';
import 'package:webshop/models/product.dart';
import 'package:webshop/navigation/product_route_path.dart';
import 'package:webshop/screens/cart_page.dart';
import 'package:webshop/screens/home_page.dart';
import 'package:webshop/screens/product_details.dart';
import 'package:webshop/screens/profile_page.dart';
import 'package:webshop/screens/unknown.dart';

class ProductRouterDelegate extends RouterDelegate<ProductRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<ProductRoutePath> {
  final GlobalKey<NavigatorState> _navigatorKey;

  Product _selectedProduct;
  bool show404 = false;
  bool showProfile = false;
  bool showCart = false;

  ProductRouterDelegate() : _navigatorKey = GlobalKey<NavigatorState>();

  ProductRoutePath get currentConfiguration {
    if (show404) {
      return ProductRoutePath.unknown();
    }
    if (showProfile) {
      return ProductRoutePath.profile();
    }
    if (showCart) {
      return ProductRoutePath.cart();
    }
    return _selectedProduct == null
        ? ProductRoutePath.home()
        : ProductRoutePath.order(PRODUCTS.indexOf(_selectedProduct));
  }


  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        // A HomePage mindig szereplni fog az oldalak között.
        MaterialPage(
          key: ValueKey('HomePage'),
          child: HomePage(
            onProductSelect: _handleAddToCart,
            onShowProfile: _handleShowProfile,
            onShowCart: _handleShowCart,
          ),
        ),

        if (show404)
          MaterialPage(
            key: ValueKey('UnknownPage'),
            child: Unknown(),
          )
        else if (showProfile)
          MaterialPage(
            key: ValueKey('ProfilePage'),
            child: ProfilePage(
              onShowCart: _handleShowCart,
            ),
          )
        else if (showCart)
          MaterialPage(
            key: ValueKey('CartPage'),
            child: CartPage(
              onShowProfile: _handleShowProfile,
            ),
          )
        else if (_selectedProduct != null)
          MaterialPage(
            key: ObjectKey(_selectedProduct),
            child: ProductDetails(
              product: _selectedProduct,
              onShowProfile: _handleShowProfile,
              onShowCart: _handleShowCart,
            ),
          ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        _selectedProduct = null;
        show404 = false;
        showProfile = false;
        showCart = false;

        notifyListeners();

        return true;
      },
    );
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;


  @override
  Future<void> setNewRoutePath(ProductRoutePath path) async {
    if (path.isUnknown) {
      _selectedProduct = null;
      show404 = true;
      return;
    }

    if (path.isOrderPage) {
      if (path.id < 0 || path.id > PRODUCTS.length - 1) {
        show404 = true;
        return;
      }

      _selectedProduct = PRODUCTS[path.id];
    } else {
      _selectedProduct = null;
    }

    if (path.isProfile) {
      showProfile = true;
    }

    if (path.isCart) {
      showCart = true;
    }

    show404 = false;
  }

  void _handleAddToCart(Product product) {
    _selectedProduct = product;
    notifyListeners();
  }

  void _handleShowProfile() {
    showProfile = true;
    notifyListeners();
  }

  void _handleShowCart() {
    showCart = true;
    notifyListeners();
  }
}

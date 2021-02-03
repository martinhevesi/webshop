import 'package:flutter/material.dart';
import 'package:webshop/navigation/product_route_path.dart';

class ProductRouteInformationParser
    extends RouteInformationParser<ProductRoutePath> {
  @override
  Future<ProductRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);
    // Kezdő oldal
    if (uri.pathSegments.length == 0) {
      return ProductRoutePath.home();
    }

    // '/order/:id' útvonalak
    // Az :id a termék indexe
    if (uri.pathSegments.length == 2 && uri.pathSegments[0] == 'order') {
      var remaining = uri.pathSegments[1];
      var id = int.tryParse(remaining);
      if (id == null) return ProductRoutePath.unknown();
      return ProductRoutePath.order(id);
    }

    if (uri.pathSegments.length == 1 && uri.pathSegments[0] == 'profile') {
      return ProductRoutePath.profile();
    }

    if (uri.pathSegments.length == 1 && uri.pathSegments[0] == 'cart') {
      return ProductRoutePath.cart();
    }

    // Ismeretlen útvonal
    return ProductRoutePath.unknown();
  }

  @override
  RouteInformation restoreRouteInformation(ProductRoutePath path) {
    if (path.isUnknown) {
      return RouteInformation(location: '/404');
    }
    if (path.isHomePage) {
      return RouteInformation(location: '/');
    }
    if (path.isOrderPage) {
      return RouteInformation(location: '/order/${path.id}');
    }
    if (path.isProfile) {
      return RouteInformation(location: '/profile');
    }
    if (path.isCart) {
      return RouteInformation(location: '/cart');
    }
    return null;
  }
}

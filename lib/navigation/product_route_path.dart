// Az egyes útvonalak belső reprezentációja
class ProductRoutePath {
  final int id;
  final bool isUnknown;
  final bool isProfile;
  final bool isCart;

  ProductRoutePath.home()
      : id = null,
        isUnknown = false,
        isProfile = false,
        isCart = false;

  ProductRoutePath.order(this.id)
      : isUnknown = false,
        isProfile = false,
        isCart = false;

  ProductRoutePath.unknown()
      : id = null,
        isUnknown = true,
        isProfile = false,
        isCart = false;

  ProductRoutePath.profile()
      : id = null,
        isUnknown = false,
        isProfile = true,
        isCart = false;

  ProductRoutePath.cart()
      : id = null,
        isUnknown = false,
        isProfile = false,
        isCart = true;

  bool get isHomePage => id == null && !isProfile;

  bool get isOrderPage => id != null && !isProfile;
}

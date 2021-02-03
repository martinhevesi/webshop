import 'package:quiver/core.dart';

class Product {
  final String name;
  final String param;
  final double price;
  final String imagePath;
  final int rating;


  const Product({
    this.name,
    this.param,
    this.price,
    this.imagePath,
    this.rating,
});

  bool operator ==(Object other) =>
      other is Product &&
          other.name == name &&
          other.param == param &&
          other.price == price &&
          other.imagePath == imagePath &&
          other.rating == rating;

  int get hashCode => hashObjects([name, param, price, imagePath, rating]);
}

const PRODUCTS = [
  Product(
    name: 'Samsung Galaxy Z Fold 2',
    param: 'Snapdragon 865+, Foldable Dynamic AMOLED 2X, 7.6\"',
    price: 1500.00,
    imagePath: 'images/samsunggalaxyzfold2.png',
    rating: 4,
  ),
  Product(
    name: 'Samsung Galaxy S20',
    param: 'Exynos 990, Dynamic AMOLED 2X, 6.2\"',
    price: 700.00,
    imagePath: 'images/samsungs20.png',
    rating: 4,
  ),
  Product(
    name: 'Oneplus 8 Pro',
    param: 'Qualcomm SM8250 Snapdragon 865, Fluid AMOLED, 6.78\"',
    price: 950.00,
    imagePath: 'images/oneplus8pro.png',
    rating: 2,
  ),
  Product(
    name: 'Iphone 11',
    param: 'Apple A13, Liquid Retina IPS LCD, 6.1\"',
    price: 650.00,
    imagePath: 'images/iphone11.png',
    rating: 4,
  ),
  Product(
    name: 'Iphone 12 Pro',
    param: 'Apple A14, Super Retina XDR OLED, 6.1\"',
    price: 1300.00,
    imagePath: 'images/iphone12pro.png',
    rating: 5,
  ),
  Product(
    name: 'Xiaomi Mi 10',
    param: 'Qualcomm SM8250 Snapdragon 865, Super AMOLED, 6.67\"',
    price: 400.00,
    imagePath: 'images/xiaomimi10.png',
    rating: 4,
  ),
  Product(
    name: 'Huawei P40 Pro',
    param: 'Kirin 990 5G, OLED, 6.58\"',
    price: 550.00,
    imagePath: 'images/huaweip40pro.png',
    rating: 3,
  ),




];
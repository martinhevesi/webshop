import 'package:webshop/models/address.dart';

class Profile {
  int id;
  String name;
  String phone;
  String email;
  List<Address> addresses = [];

  void addAddress(Address address) {
    addresses.add(address);
  }

  void removeAddress(Address address) {
    addresses.remove(address);
  }

  Map<String, dynamic> toMap() {
    Map map = <String, dynamic>{
      'name': name,
      'email': email,
      'phone': phone,
    };

    if (id != null) {
      map['id'] = id;
    }
    return map;
  }
}

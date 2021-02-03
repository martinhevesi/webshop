import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:webshop/db/sql.dart';
import 'package:webshop/location_service.dart';
import 'package:webshop/models/address.dart';
import 'package:webshop/models/profile.dart';
import 'package:sqflite/sqlite_api.dart';

class ProfileRepository {
  final Sql sql;

  ProfileRepository({this.sql});

  Future<Profile> load() async {
    Profile profile = Profile();

    final Database database = await sql.database;

    List<Map<String, dynamic>> result =
    await database.query('profile', limit: 1);

    if (result.length > 0) {

      var data = result.first;
      profile.id = data['id'];
      profile.name = data['name'];
      profile.phone = data['phone'];
      profile.email = data['email'];

      profile.addresses.addAll(await loadAllAddresses(sql));
    }
    return profile;
  }

  Future<List<Address>> loadAllAddresses(Sql sql) async {
    final Database database = await sql.database;

    final List<Map<String, dynamic>> result = await database.query('addresses', orderBy: 'id DESC', );

    return List.generate(result.length, (i) {
      return Address(
          id: result[i]['id'],
          city: result[i]['city'],
          street: result[i]['street'],
          houseNumber: result[i]['houseNumber'],
          latLng: LatLng(result[i]['lat'] ?? BP_LATLNG.latitude,
              result[i]['lng'] ?? BP_LATLNG.longitude));
    });
  }

  Future<void> save(Profile profile) async {
    final Database database = await sql.database;

    profile.id = await database.insert('profile', profile.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    removeAllAddresses();
    profile.addresses.forEach((address) {
      addAddress(address);
    });
  }

  Future<void> addAddress(Address address) async {
    final Database database = await sql.database;
    address.id = await database.insert(
      'addresses',
      address.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> removeAllAddresses() async {
    final Database database = await sql.database;
    database.delete('addresses');
  }

  Future<void> removeAddress(Address address) async {
    final Database database = await sql.database;
    database.delete(
      'addresses',
      where: 'id = ?',
      whereArgs: [address.id],
    );
  }
}

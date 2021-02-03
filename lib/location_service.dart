import 'dart:convert';
import 'dart:io';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:webshop/models/address.dart';

const BP_LATLNG = LatLng(47.50705,19.04592);

class LocationService {
  static Future<LatLng> find(Address address, {http.Client httpClient}) async {
    var client = httpClient ?? http.Client();
    var result = BP_LATLNG;
    try {
      var response = await client.get(_buildUrl(address));
      if (response.statusCode == HttpStatus.ok) {
        var data = jsonDecode(response.body);
        if (data.length > 0) {
          result = LatLng(
              double.parse(data[0]['lat']), double.parse(data[0]['lon']));
        }
      }
    } finally {
      if (httpClient == null) {
        client.close();
      }
    }
    return result;
  }

  static String _buildUrl(Address address) {
    return 'https://nominatim.openstreetmap.org/search?format=json&country=Hungary&city=${address.city}&street=${address.houseNumber} ${address.street}';
  }
}

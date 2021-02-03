import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:webshop/location_service.dart';
import 'package:webshop/models/address.dart';


class MockClient extends Mock implements http.Client {}

void main() {
  group('LocationService', () {
    test('find the address', () async {

      final client = MockClient();
      var address = Address(city: 'Szabadka', street: 'Korzo', houseNumber: '7');
      when(client.get(
          'https://nominatim.openstreetmap.org/search?format=json&country=Serbia&city=Subotica&street=7 Korzo'))
          .thenAnswer((_) async => http.Response('[{"place_id":9942282,"licence":"Data © OpenStreetMap contributors, ODbL 1.0. https://osm.org/copyright","osm_type":"node","osm_id":969931120,"boundingbox":["46.1005292","46.1006292","19.6671713","19.6672713"],"lat":"46.1005792","lon":"19.6672213","display_name":"7, Korzó, Centar I, МЗ Центар I, Szabadka, Szabadka városa, Észak-bácskai körzet, Vajdaság, 24000, Szerbia","class":"place","type":"house","importance":0.11100000000000002}]',200));


      var result = await LocationService.find(address, httpClient: client);

      expect(result.latitude.toDouble(), closeTo(46.1005792, 0.000000001));
      expect(result.longitude.toDouble(), closeTo(19.6672213, 0.000000001));
    });
  });
}

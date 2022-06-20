import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:rijksmuseum/services/museum_data_service.dart';

void main() {
  group('Data service test', () {
    test('description', () async {
      final item = await MuseumDataService(Client()).getCollection(1);
      print(item);
    });
  });
}

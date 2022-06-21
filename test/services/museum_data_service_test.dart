import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rijksmuseum/api/endpoints.dart';
import 'package:rijksmuseum/models/art_objects.dart';
import 'package:rijksmuseum/models/collection.dart';
import 'package:rijksmuseum/models/collection_details.dart';
import 'package:rijksmuseum/models/response_failure.dart';
import 'package:rijksmuseum/services/museum_data_service.dart';

import 'museum_data_service_test.mocks.dart';

@GenerateMocks([Client])
void main() {
  final mockClient = MockClient();

  group('Data service test - ', () {
    test('fetching a collection by ID and page number is successful', () async {
      when(mockClient.get(Uri.parse('$collection&p=1'))).thenAnswer(
        (_) => Future.value(
          Response(
            jsonEncode(Collection(artObjects: [ArtObjects(id: '1')]).toJson()),
            200,
          ),
        ),
      );

      final sut = MuseumDataService(mockClient);
      final result = await sut.getCollection(1);

      expect(result.artObjects?.first.id, result.artObjects?.first.id);
    });
    test(
      'fetching a collection will throw an error when the json is invalid',
      () async {
        when(mockClient.get(Uri.parse('$collection&p=1'))).thenAnswer(
          (_) => Future.value(
            Response(
              jsonEncode(['1', '2', '3']),
              200,
            ),
          ),
        );

        final sut = MuseumDataService(mockClient);

        expect(
          () => sut.getCollection(1),
          throwsA(isA<ResponseFailure>()),
        );
      },
    );
    test(
      'fetching a collections details by object number is successful ',
      () async {
        when(mockClient
                .get(Uri.parse(collectionDetails(objectNumber: '123456'))))
            .thenAnswer(
          (_) => Future.value(
            Response(
              jsonEncode(
                CollectionDetails(artObject: ArtObjects(id: '1')).toJson(),
              ),
              200,
            ),
          ),
        );

        final sut = MuseumDataService(mockClient);
        final result = await sut.getCollectionDetails(objectNumber: '123456');
        expect(result.artObject.id, result.artObject.id);
      },
    );
    test(
      'fetching a collection details will throw an error when the json is invalid ',
      () async {
        when(mockClient
                .get(Uri.parse(collectionDetails(objectNumber: '123456'))))
            .thenAnswer(
          (_) => Future.value(
            Response(
              jsonEncode(
                ['1, 2, 3'],
              ),
              200,
            ),
          ),
        );

        final sut = MuseumDataService(mockClient);

        expect(
          () => sut.getCollectionDetails(objectNumber: '123456'),
          throwsA(isA<ResponseFailure>()),
        );
      },
    );
  });
}

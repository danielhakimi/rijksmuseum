import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rijksmuseum/enums/notifier_state.dart';
import 'package:rijksmuseum/models/art_objects.dart';
import 'package:rijksmuseum/models/collection.dart';
import 'package:rijksmuseum/providers/home_page_provider.dart';
import 'package:rijksmuseum/services/museum_data_service.dart';

import '../services/museum_data_service_test.mocks.dart';
import 'home_page_provider_test.mocks.dart';

@GenerateMocks([MuseumDataService])
void main() {
  final mockClient = MockClient();
  final mockMuseumDataService = MockMuseumDataService();

  group('Home page provider tests -', () {
    test('selected item should initially have no value', () {
      final sut = HomePageProvider(MuseumDataService(mockClient));
      expect(sut.selectedOptionItem, none<ArtObjects>());
    });
    test(
      'main loading spinner should have finised loading after fetching the first page ',
      () async {
        when(mockMuseumDataService.getCollection(1)).thenAnswer(
          (realInvocation) => Future.value(
            Collection(
              artObjects: [ArtObjects(id: '123')],
            ),
          ),
        );
        final sut = HomePageProvider(mockMuseumDataService);

        await sut.getFirstPage();
        expect(sut.state, NotifierState.loaded);
      },
    );
    test(
      'items should have values after fetching the first page ',
      () async {
        when(mockMuseumDataService.getCollection(1)).thenAnswer(
          (realInvocation) => Future.value(
            Collection(
              artObjects: [ArtObjects(id: '123'), ArtObjects(id: '456')],
            ),
          ),
        );
        final sut = HomePageProvider(mockMuseumDataService);

        await sut.getFirstPage();
        final result = sut.items.foldRight(<ArtObjects>[], (r, _) => r.length);
        expect(result, 2);
      },
    );
  });
}

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rijksmuseum/enums/notifier_state.dart';
import 'package:rijksmuseum/models/art_objects.dart';
import 'package:rijksmuseum/models/collection.dart';
import 'package:rijksmuseum/models/response_failure.dart';
import 'package:rijksmuseum/providers/home_page_provider.dart';
import 'package:rijksmuseum/services/museum_data_service.dart';

import '../services/museum_data_service_test.mocks.dart';
import 'home_page_provider_test.mocks.dart';

@GenerateMocks([MuseumDataService, HomePageProvider])
void main() {
  final mockClient = MockClient();
  final mockMuseumDataService = MockMuseumDataService();

  group('Home page provider tests -', () {
    test('selected item should initially have no value', () {
      final sut = HomePageProvider(MuseumDataService(mockClient));
      expect(sut.selectedOptionItem, none<ArtObjects>());
    });
    test(
      'main loading spinner should have finised loading after fetching the first page',
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
      'items list should have values after fetching the first page',
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
        final result = sut.items.foldRight(0, (r, _) => r.length);
        expect(result, 2);
      },
    );

    test(
      'items list should not have values if there is an issues fetching the first page',
      () async {
        when(mockMuseumDataService.getCollection(1)).thenThrow(ResponseFailure('exception error'));

        final sut = HomePageProvider(mockMuseumDataService);
        expect(
          sut.getFirstPage,
          throwsA(isA<ResponseFailure>()),
        );
      },
    );

    test(
      'page number should be 2 after calling next page api for the first time',
      () async {
        when(mockMuseumDataService.getCollection(2)).thenAnswer(
          (realInvocation) => Future.value(
            Collection(
              artObjects: [ArtObjects(id: '123'), ArtObjects(id: '456')],
            ),
          ),
        );
        final sut = HomePageProvider(mockMuseumDataService);
        await sut.getNextPage();
        expect(sut.page, 2);
      },
    );
    test(
      'items should be appended when calling next page after fetching first page',
      () async {
        when(mockMuseumDataService.getCollection(1)).thenAnswer(
          (realInvocation) => Future.value(
            Collection(
              artObjects: [ArtObjects(id: '123')],
            ),
          ),
        );
        when(mockMuseumDataService.getCollection(2)).thenAnswer(
          (realInvocation) => Future.value(
            Collection(
              artObjects: [ArtObjects(id: '456')],
            ),
          ),
        );
        final sut = HomePageProvider(mockMuseumDataService);
        await sut.getFirstPage();
        await sut.getNextPage();
        expect(sut.items.getOrElse(() => []).length, 2);
      },
    );
    test(
      'items should be appended when calling next page after fetching first page',
      () async {
        final item = ArtObjects(id: '123', objectNumber: '1111');

        when(mockMuseumDataService.getCollection(1)).thenAnswer(
          (realInvocation) => Future.value(
            Collection(
              artObjects: [item],
            ),
          ),
        );

        final sut = HomePageProvider(mockMuseumDataService);

        expect(sut.selectedOptionItem, none<ArtObjects>());

        sut.onItemTapped(artItem: item);

        expect(sut.selectedOptionItem, some(item));
      },
    );
  });
}

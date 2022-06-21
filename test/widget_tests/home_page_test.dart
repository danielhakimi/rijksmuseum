import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:rijksmuseum/enums/notifier_state.dart';
import 'package:rijksmuseum/extensions/art_object_string_extension.dart';
import 'package:rijksmuseum/models/art_objects.dart';
import 'package:rijksmuseum/providers/home_page_provider.dart';
import 'package:rijksmuseum/screens/home_page.dart';
import 'package:rijksmuseum/widgets/list_item.dart';

import '../providers/home_page_provider_test.mocks.dart';

@GenerateMocks([HomePageProvider])
void main() {
  final mockHomePageProvider = MockHomePageProvider();

  group('Home page widget tests - ', () {
    testWidgets(
      'should find the correct amount of list items on the home page after fetching the api results',
      (tester) async {
        when(mockHomePageProvider.items).thenReturn(Right([
          ArtObjects(objectNumber: '1234'),
          ArtObjects(objectNumber: '3456'),
        ]));
        when(mockHomePageProvider.state).thenReturn(NotifierState.loaded);
        when(mockHomePageProvider.pagingState).thenReturn(NotifierState.loaded);
        await tester.pumpWidget(
          ChangeNotifierProvider<HomePageProvider>(
            create: (_) => mockHomePageProvider,
            builder: (a, b) => const MaterialApp(home: HomePage()),
          ),
        );

        expect(find.byType(ListItem), findsNWidgets(2));
      },
    );
    testWidgets(
      'should find the correct amount of list items on the home page after fetching the api results',
      (tester) async {
        final artObjects = ArtObjects(
          objectNumber: '1234',
          title: 'test title',
          longTitle: 'some very long title, with commas, and more words',
        );
        when(mockHomePageProvider.items).thenReturn(Right([
          artObjects,
        ]));
        when(mockHomePageProvider.state).thenReturn(NotifierState.loaded);
        when(mockHomePageProvider.pagingState).thenReturn(NotifierState.loaded);

        await tester.pumpWidget(
          ChangeNotifierProvider<HomePageProvider>(
            create: (_) => mockHomePageProvider,
            builder: (a, b) => const MaterialApp(home: HomePage()),
          ),
        );

        expect(find.text('test title'), findsNWidgets(1));
        expect(find.text(artObjects.buildTitle() ?? ''), findsNWidgets(1));
      },
    );
  });
}

// Mocks generated by Mockito 5.4.4 from annotations
// in rijksmuseum/test/providers/home_page_provider_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;
import 'dart:ui' as _i12;

import 'package:dartz/dartz.dart' as _i7;
import 'package:http/http.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:rijksmuseum/enums/notifier_state.dart' as _i11;
import 'package:rijksmuseum/models/art_objects.dart' as _i10;
import 'package:rijksmuseum/models/collection.dart' as _i3;
import 'package:rijksmuseum/models/collection_details.dart' as _i4;
import 'package:rijksmuseum/models/response_failure.dart' as _i5;
import 'package:rijksmuseum/providers/home_page_provider.dart' as _i9;
import 'package:rijksmuseum/services/museum_data_service.dart' as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeClient_0 extends _i1.SmartFake implements _i2.Client {
  _FakeClient_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCollection_1 extends _i1.SmartFake implements _i3.Collection {
  _FakeCollection_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCollectionDetails_2 extends _i1.SmartFake
    implements _i4.CollectionDetails {
  _FakeCollectionDetails_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponseFailure_3 extends _i1.SmartFake
    implements _i5.ResponseFailure {
  _FakeResponseFailure_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMuseumDataService_4 extends _i1.SmartFake
    implements _i6.MuseumDataService {
  _FakeMuseumDataService_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeOption_5<A> extends _i1.SmartFake implements _i7.Option<A> {
  _FakeOption_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_6<L, R> extends _i1.SmartFake implements _i7.Either<L, R> {
  _FakeEither_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MuseumDataService].
///
/// See the documentation for Mockito's code generation for more information.
class MockMuseumDataService extends _i1.Mock implements _i6.MuseumDataService {
  MockMuseumDataService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Client get client => (super.noSuchMethod(
        Invocation.getter(#client),
        returnValue: _FakeClient_0(
          this,
          Invocation.getter(#client),
        ),
      ) as _i2.Client);

  @override
  _i8.Future<_i3.Collection> getCollection(int? page) => (super.noSuchMethod(
        Invocation.method(
          #getCollection,
          [page],
        ),
        returnValue: _i8.Future<_i3.Collection>.value(_FakeCollection_1(
          this,
          Invocation.method(
            #getCollection,
            [page],
          ),
        )),
      ) as _i8.Future<_i3.Collection>);

  @override
  _i8.Future<_i4.CollectionDetails> getCollectionDetails(
          {required String? objectNumber}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCollectionDetails,
          [],
          {#objectNumber: objectNumber},
        ),
        returnValue:
            _i8.Future<_i4.CollectionDetails>.value(_FakeCollectionDetails_2(
          this,
          Invocation.method(
            #getCollectionDetails,
            [],
            {#objectNumber: objectNumber},
          ),
        )),
      ) as _i8.Future<_i4.CollectionDetails>);

  @override
  _i5.ResponseFailure onError(Object? error) => (super.noSuchMethod(
        Invocation.method(
          #onError,
          [error],
        ),
        returnValue: _FakeResponseFailure_3(
          this,
          Invocation.method(
            #onError,
            [error],
          ),
        ),
      ) as _i5.ResponseFailure);
}

/// A class which mocks [HomePageProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockHomePageProvider extends _i1.Mock implements _i9.HomePageProvider {
  MockHomePageProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.MuseumDataService get museumDataService => (super.noSuchMethod(
        Invocation.getter(#museumDataService),
        returnValue: _FakeMuseumDataService_4(
          this,
          Invocation.getter(#museumDataService),
        ),
      ) as _i6.MuseumDataService);

  @override
  set museumDataService(_i6.MuseumDataService? _museumDataService) =>
      super.noSuchMethod(
        Invocation.setter(
          #museumDataService,
          _museumDataService,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i7.Option<_i10.ArtObjects> get selectedOptionItem => (super.noSuchMethod(
        Invocation.getter(#selectedOptionItem),
        returnValue: _FakeOption_5<_i10.ArtObjects>(
          this,
          Invocation.getter(#selectedOptionItem),
        ),
      ) as _i7.Option<_i10.ArtObjects>);

  @override
  set selectedOptionItem(_i7.Option<_i10.ArtObjects>? _selectedOptionItem) =>
      super.noSuchMethod(
        Invocation.setter(
          #selectedOptionItem,
          _selectedOptionItem,
        ),
        returnValueForMissingStub: null,
      );

  @override
  int get page => (super.noSuchMethod(
        Invocation.getter(#page),
        returnValue: 0,
      ) as int);

  @override
  _i11.NotifierState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _i11.NotifierState.inital,
      ) as _i11.NotifierState);

  @override
  set state(_i11.NotifierState? state) => super.noSuchMethod(
        Invocation.setter(
          #state,
          state,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i11.NotifierState get pagingState => (super.noSuchMethod(
        Invocation.getter(#pagingState),
        returnValue: _i11.NotifierState.inital,
      ) as _i11.NotifierState);

  @override
  set pagingState(_i11.NotifierState? state) => super.noSuchMethod(
        Invocation.setter(
          #pagingState,
          state,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i7.Either<_i5.ResponseFailure, List<_i10.ArtObjects>> get items =>
      (super.noSuchMethod(
        Invocation.getter(#items),
        returnValue: _FakeEither_6<_i5.ResponseFailure, List<_i10.ArtObjects>>(
          this,
          Invocation.getter(#items),
        ),
      ) as _i7.Either<_i5.ResponseFailure, List<_i10.ArtObjects>>);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  _i8.Future<void> getFirstPage() => (super.noSuchMethod(
        Invocation.method(
          #getFirstPage,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<void> getNextPage() => (super.noSuchMethod(
        Invocation.method(
          #getNextPage,
          [],
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  _i8.Future<
      _i7.Either<_i5.ResponseFailure, List<_i10.ArtObjects>>> getArtItems(
          {required int? page}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getArtItems,
          [],
          {#page: page},
        ),
        returnValue: _i8.Future<
                _i7.Either<_i5.ResponseFailure, List<_i10.ArtObjects>>>.value(
            _FakeEither_6<_i5.ResponseFailure, List<_i10.ArtObjects>>(
          this,
          Invocation.method(
            #getArtItems,
            [],
            {#page: page},
          ),
        )),
      ) as _i8.Future<_i7.Either<_i5.ResponseFailure, List<_i10.ArtObjects>>>);

  @override
  _i8.Future<void> onScroll({
    required double? pixels,
    required double? maxScrollExtent,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #onScroll,
          [],
          {
            #pixels: pixels,
            #maxScrollExtent: maxScrollExtent,
          },
        ),
        returnValue: _i8.Future<void>.value(),
        returnValueForMissingStub: _i8.Future<void>.value(),
      ) as _i8.Future<void>);

  @override
  void resetSelectedItem() => super.noSuchMethod(
        Invocation.method(
          #resetSelectedItem,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onItemTapped({_i10.ArtObjects? artItem}) => super.noSuchMethod(
        Invocation.method(
          #onItemTapped,
          [],
          {#artItem: artItem},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addListener(_i12.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i12.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

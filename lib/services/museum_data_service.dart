import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../api/endpoints.dart';
import '../models/art_objects.dart';
import '../models/collection.dart';

class ResponseFailure extends Error {
  final String message;

  ResponseFailure(this.message);

  @override
  String toString() => message;
}

class MuseumDataService {
  final Client client;

  MuseumDataService(this.client);

  Future<Collection> getCollection(int page) async => client
      .get(Uri.parse('$collection&p=$page&culture=en'))
      .then(
        (value) => Collection.fromJson(
          jsonDecode(value.body) as Map<String, dynamic>,
        ),
      )
      .onError((error, _) => throw ResponseFailure(error.toString()));

  Future<Collection> getCollectionDetails(int page) async => client
      .get(Uri.parse('$collection&p=$page&culture=en'))
      .then(
        (value) => Collection.fromJson(
          jsonDecode(value.body) as Map<String, dynamic>,
        ),
      )
      .onError((error, _) => throw ResponseFailure(error.toString()));
}

enum NotifierState {
  inital,
  loading,
  loaded,
}

class HomePageProvider extends ChangeNotifier {
  MuseumDataService museumDataService;

  HomePageProvider(this.museumDataService);

  NotifierState _state = NotifierState.inital;
  NotifierState get state => _state;
  set state(NotifierState state) {
    _state = state;
    notifyListeners();
  }

  NotifierState _pagingState = NotifierState.inital;
  NotifierState get pagingState => _pagingState;
  set pagingState(NotifierState state) {
    _pagingState = state;
    notifyListeners();
  }

  Either<ResponseFailure, List<ArtObjects>> get artItems => _art;
  Either<ResponseFailure, List<ArtObjects>> _art = const Right([]);

  Future<void> getFirstPage() async {
    state = NotifierState.loading;

    await getArtItems(page: 1).whenComplete(() => state = NotifierState.loaded);
  }

  Future<void> getBy({int page = 1}) async {
    if (pagingState == NotifierState.loading) {
      return;
    }
    pagingState = NotifierState.loading;

    await getArtItems(page: page)
        .whenComplete(() => pagingState = NotifierState.loaded);
  }

  Future<Either<ResponseFailure, List<ArtObjects>>> getArtItems({
    required int page,
  }) async =>
      Task(() => museumDataService.getCollection(page))
          .attempt()
          .map((either) => either.leftMap((l) => l as ResponseFailure))
          .run()
          .then(
            (value) => value.fold(
              Left.new,
              (r) => _art = Right<ResponseFailure, List<ArtObjects>>(
                [
                  ..._art.foldRight(<ArtObjects>[], (r, _) => r),
                  ...r.artObjects ?? [],
                ],
              ),
            ),
          );

  void itemTapped() {}
}

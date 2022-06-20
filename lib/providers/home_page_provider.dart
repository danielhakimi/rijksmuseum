import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';

import '../enums/notifier_state.dart';
import '../models/art_objects.dart';
import '../models/response_failure.dart';
import '../services/museum_data_service.dart';
import '../utilities/future_helper.dart';

class HomePageProvider extends ChangeNotifier {
  MuseumDataService museumDataService;

  HomePageProvider(this.museumDataService);

  int _page = 1;

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

  Either<ResponseFailure, List<ArtObjects>> get items => _items;
  Either<ResponseFailure, List<ArtObjects>> _items = const Right([]);

  Option<ArtObjects> selectedArtItem = none();

  Future<void> getFirstPage() async {
    state = NotifierState.loading;

    await getArtItems(page: 1).whenComplete(() => state = NotifierState.loaded);
  }

  Future<void> getNextPage() async {
    if (pagingState == NotifierState.loading) {
      return;
    }

    pagingState = NotifierState.loading;
    await getArtItems(page: _page += 1)
        .then((value) => delay()) // avoids fetching the next page to early
        .whenComplete(() => pagingState = NotifierState.loaded);
  }

  Future<Either<ResponseFailure, List<ArtObjects>>> getArtItems({
    required int page,
  }) async =>
      Task(() => museumDataService.getCollection(page)).unwrapResponse().then(
            (value) => value.fold(
              (l) => _items = Left(l),
              (r) => _items = Right<ResponseFailure, List<ArtObjects>>(
                [
                  ..._items.foldRight(<ArtObjects>[], (r, _) => r),
                  ...r.artObjects ?? [],
                ],
              ),
            ),
          );

  Future<void> onScroll({
    required double pixels,
    required double maxScrollExtent,
  }) async {
    if (pixels >= maxScrollExtent) {
      await getNextPage();
    }
  }

  void resetSelectedItem() {
    selectedArtItem = none();
    notifyListeners();
  }

  void onItemTapped({ArtObjects? artItem}) {
    if (artItem != null) {
      selectedArtItem = some(artItem);

      notifyListeners();
    }
  }
}

extension TaskEx<T> on Task<T> {
  Future<Either<ResponseFailure, T>> unwrapResponse() => attempt()
      .map((either) => either.leftMap((l) => l as ResponseFailure))
      .run();
}

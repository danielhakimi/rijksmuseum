import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import '../enums/notifier_state.dart';

import '../extensions/task_extension.dart';
import '../models/art_objects.dart';
import '../models/response_failure.dart';
import '../services/museum_data_service.dart';

class DetailsPageProvider extends ChangeNotifier {
  MuseumDataService dataService;

  Either<ResponseFailure, ArtObjects> _artItem = Right(ArtObjects());
  Either<ResponseFailure, ArtObjects> get artItem => _artItem;

  DetailsPageProvider(this.dataService);
  NotifierState _state = NotifierState.inital;
  NotifierState get state => _state;
  set state(NotifierState state) {
    _state = state;
    notifyListeners();
  }

  Future<void> getArtItemBy({String? objectNumber}) async {
    if (state == NotifierState.loading) {
      return;
    }
    state = NotifierState.loading;

    await Task(() => dataService.getCollectionDetails(
              objectNumber: objectNumber ?? '',
            ))
        .unwrapResponse()
        .then(
          (value) => value.fold(
            (l) => _artItem = Left(l),
            (r) => _artItem = Right(r.artObject),
          ),
        )
        .whenComplete(() => state = NotifierState.loaded);
  }
}

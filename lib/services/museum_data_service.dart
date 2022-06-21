import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import '../api/endpoints.dart';
import '../models/collection.dart';
import '../models/collection_details.dart';
import '../models/response_failure.dart';

class MuseumDataService {
  final Client client;

  MuseumDataService(this.client);

  Future<Collection> getCollection(int page) async => client
      .get(Uri.parse('$collection&p=$page'))
      .then(
        (value) => Collection.fromJson(
          jsonDecode(value.body) as Map<String, dynamic>,
        ),
      )
      // .then((value) => throw ResponseFailure("something went wrong"))
      .onError((error, _) => throw onError(error));

  Future<CollectionDetails> getCollectionDetails({
    required String objectNumber,
  }) async =>
      client
          .get(Uri.parse(collectionDetails(objectNumber: objectNumber)))
          .then(
            (value) => CollectionDetails.fromJson(
              jsonDecode(value.body) as Map<String, dynamic>,
            ),
          )
          .onError((error, _) => throw onError(error));

  ResponseFailure onError(Object? error) {
    if (error is HttpException) {
      return ResponseFailure(error.message);
    }
    if (error is SocketException) {
      return ResponseFailure(error.message);
    }

    return ResponseFailure('Something went wrong');
  }
}

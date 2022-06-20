import 'package:json_annotation/json_annotation.dart';

import 'art_objects.dart';

part 'details_collection.g.dart';

@JsonSerializable()
class DetailsCollection {
  int? elapsedMilliseconds;
  ArtObjects artObject;

  DetailsCollection({
    this.elapsedMilliseconds,
    required this.artObject,
  });
  factory DetailsCollection.fromJson(Map<String, dynamic> json) =>
      _$DetailsCollectionFromJson(json);
}

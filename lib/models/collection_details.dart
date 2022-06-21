import 'package:json_annotation/json_annotation.dart';

import 'art_objects.dart';

part 'collection_details.g.dart';

@JsonSerializable()
class CollectionDetails {
  int? elapsedMilliseconds;
  ArtObjects artObject;

  CollectionDetails({
    this.elapsedMilliseconds,
    required this.artObject,
  });
  factory CollectionDetails.fromJson(Map<String, dynamic> json) =>
      _$CollectionDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionDetailsToJson(this);
}

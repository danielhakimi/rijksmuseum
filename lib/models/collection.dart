import 'package:json_annotation/json_annotation.dart';

import 'art_objects.dart';

part 'collection.g.dart';

@JsonSerializable()
class Collection {
  List<ArtObjects>? artObjects;

  Collection({this.artObjects});

  factory Collection.fromJson(Map<String, dynamic> json) =>
      _$CollectionFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionToJson(this);
}

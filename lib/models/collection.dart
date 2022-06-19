import 'package:json_annotation/json_annotation.dart';

import 'art_objects.dart';
import 'count_facets.dart';
import 'facet.dart';

part 'collection.g.dart';

@JsonSerializable()
class Collection {
  int? elapsedMilliseconds;
  int? count;
  CountFacets? countFacets;
  List<ArtObjects>? artObjects;
  List<Facet>? facets;

  Collection({
    this.elapsedMilliseconds,
    this.count,
    this.countFacets,
    this.artObjects,
    this.facets,
  });
  factory Collection.fromJson(Map<String, dynamic> json) =>
      _$CollectionFromJson(json);
}

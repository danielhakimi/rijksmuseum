// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Collection _$CollectionFromJson(Map<String, dynamic> json) => Collection(
      elapsedMilliseconds: json['elapsedMilliseconds'] as int?,
      count: json['count'] as int?,
      countFacets: json['countFacets'] == null
          ? null
          : CountFacets.fromJson(json['countFacets'] as Map<String, dynamic>),
      artObjects: (json['artObjects'] as List<dynamic>?)
          ?.map((e) => ArtObjects.fromJson(e as Map<String, dynamic>))
          .toList(),
      facets: (json['facets'] as List<dynamic>?)
          ?.map((e) => Facet.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CollectionToJson(Collection instance) =>
    <String, dynamic>{
      'elapsedMilliseconds': instance.elapsedMilliseconds,
      'count': instance.count,
      'countFacets': instance.countFacets,
      'artObjects': instance.artObjects,
      'facets': instance.facets,
    };

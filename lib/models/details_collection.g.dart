// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailsCollection _$DetailsCollectionFromJson(Map<String, dynamic> json) =>
    DetailsCollection(
      elapsedMilliseconds: json['elapsedMilliseconds'] as int?,
      artObject: ArtObjects.fromJson(json['artObject'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DetailsCollectionToJson(DetailsCollection instance) =>
    <String, dynamic>{
      'elapsedMilliseconds': instance.elapsedMilliseconds,
      'artObject': instance.artObject,
    };

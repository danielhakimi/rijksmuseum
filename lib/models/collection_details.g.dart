// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionDetails _$CollectionDetailsFromJson(Map<String, dynamic> json) =>
    CollectionDetails(
      elapsedMilliseconds: json['elapsedMilliseconds'] as int?,
      artObject: ArtObjects.fromJson(json['artObject'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CollectionDetailsToJson(CollectionDetails instance) =>
    <String, dynamic>{
      'elapsedMilliseconds': instance.elapsedMilliseconds,
      'artObject': instance.artObject,
    };

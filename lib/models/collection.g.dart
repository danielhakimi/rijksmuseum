// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Collection _$CollectionFromJson(Map<String, dynamic> json) => Collection(
      artObjects: (json['artObjects'] as List<dynamic>?)
          ?.map((e) => ArtObjects.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CollectionToJson(Collection instance) =>
    <String, dynamic>{
      'artObjects': instance.artObjects,
    };

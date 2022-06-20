// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'art_objects.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtObjects _$ArtObjectsFromJson(Map<String, dynamic> json) => ArtObjects(
      id: json['id'] as String?,
      objectNumber: json['objectNumber'] as String?,
      title: json['title'] as String?,
      webImage: json['webImage'] == null
          ? null
          : WebImage.fromJson(json['webImage'] as Map<String, dynamic>),
      description: json['description'] as String?,
      hasImage: json['hasImage'] as bool?,
      longTitle: json['longTitle'] as String?,
      subTitle: json['subTitle'] as String?,
      location: json['location'] as String?,
    );

Map<String, dynamic> _$ArtObjectsToJson(ArtObjects instance) =>
    <String, dynamic>{
      'id': instance.id,
      'objectNumber': instance.objectNumber,
      'title': instance.title,
      'webImage': instance.webImage,
      'description': instance.description,
      'hasImage': instance.hasImage,
      'longTitle': instance.longTitle,
      'subTitle': instance.subTitle,
      'location': instance.location,
    };

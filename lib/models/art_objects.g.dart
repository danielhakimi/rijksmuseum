// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'art_objects.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtObjects _$ArtObjectsFromJson(Map<String, dynamic> json) => ArtObjects(
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      id: json['id'] as String?,
      objectNumber: json['objectNumber'] as String?,
      title: json['title'] as String?,
      hasImage: json['hasImage'] as bool?,
      principalOrFirstMaker: json['principalOrFirstMaker'] as String?,
      longTitle: json['longTitle'] as String?,
      showImage: json['showImage'] as bool?,
      permitDownload: json['permitDownload'] as bool?,
      webImage: json['webImage'] == null
          ? null
          : WebImage.fromJson(json['webImage'] as Map<String, dynamic>),
      headerImage: json['headerImage'] == null
          ? null
          : WebImage.fromJson(json['headerImage'] as Map<String, dynamic>),
      productionPlaces: (json['productionPlaces'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ArtObjectsToJson(ArtObjects instance) =>
    <String, dynamic>{
      'links': instance.links,
      'id': instance.id,
      'objectNumber': instance.objectNumber,
      'title': instance.title,
      'hasImage': instance.hasImage,
      'principalOrFirstMaker': instance.principalOrFirstMaker,
      'longTitle': instance.longTitle,
      'showImage': instance.showImage,
      'permitDownload': instance.permitDownload,
      'webImage': instance.webImage,
      'headerImage': instance.headerImage,
      'productionPlaces': instance.productionPlaces,
    };

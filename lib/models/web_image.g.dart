// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebImage _$WebImageFromJson(Map<String, dynamic> json) => WebImage(
      guid: json['guid'] as String?,
      offsetPercentageX: (json['offsetPercentageX'] as num?)?.toInt(),
      offsetPercentageY: (json['offsetPercentageY'] as num?)?.toInt(),
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$WebImageToJson(WebImage instance) => <String, dynamic>{
      'guid': instance.guid,
      'offsetPercentageX': instance.offsetPercentageX,
      'offsetPercentageY': instance.offsetPercentageY,
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
    };

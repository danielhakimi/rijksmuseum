// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebImage _$WebImageFromJson(Map<String, dynamic> json) => WebImage(
      guid: json['guid'] as String?,
      offsetPercentageX: json['offsetPercentageX'] as int?,
      offsetPercentageY: json['offsetPercentageY'] as int?,
      width: json['width'] as int?,
      height: json['height'] as int?,
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

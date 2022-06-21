import 'package:json_annotation/json_annotation.dart';

import 'web_image.dart';

part 'art_objects.g.dart';

@JsonSerializable()
class ArtObjects {
  String? id;
  String? objectNumber;
  String? title;
  WebImage? webImage;
  String? description;
  bool? hasImage;
  String? longTitle;
  String? subTitle;
  String? location;

  ArtObjects({
    this.id,
    this.objectNumber,
    this.title,
    this.webImage,
    this.description,
    this.hasImage,
    this.longTitle,
    this.subTitle,
    this.location,
  });

  factory ArtObjects.fromJson(Map<String, dynamic> json) =>
      _$ArtObjectsFromJson(json);

  Map<String, dynamic> toJson() => _$ArtObjectsToJson(this);
}

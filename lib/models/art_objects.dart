import 'package:json_annotation/json_annotation.dart';

import 'links.dart';
import 'web_image.dart';

part 'art_objects.g.dart';

@JsonSerializable()
class ArtObjects {
  Links? links;
  String? id;
  String? objectNumber;
  String? title;
  bool? hasImage;
  String? principalOrFirstMaker;
  String? longTitle;
  bool? showImage;
  bool? permitDownload;
  WebImage? webImage;
  WebImage? headerImage;
  List<String>? productionPlaces;

  ArtObjects({
    this.links,
    this.id,
    this.objectNumber,
    this.title,
    this.hasImage,
    this.principalOrFirstMaker,
    this.longTitle,
    this.showImage,
    this.permitDownload,
    this.webImage,
    this.headerImage,
    this.productionPlaces,
  });
  factory ArtObjects.fromJson(Map<String, dynamic> json) =>
      _$ArtObjectsFromJson(json);
}

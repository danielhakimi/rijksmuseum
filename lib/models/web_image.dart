import 'package:json_annotation/json_annotation.dart';

part 'web_image.g.dart';

@JsonSerializable()
class WebImage {
  String? guid;
  int? offsetPercentageX;
  int? offsetPercentageY;
  int? width;
  int? height;
  String? url;

  WebImage({
    this.guid,
    this.offsetPercentageX,
    this.offsetPercentageY,
    this.width,
    this.height,
    this.url,
  });
  factory WebImage.fromJson(Map<String, dynamic> json) =>
      _$WebImageFromJson(json);
}

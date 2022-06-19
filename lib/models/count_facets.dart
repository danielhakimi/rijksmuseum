import 'package:json_annotation/json_annotation.dart';

part 'count_facets.g.dart';

@JsonSerializable()
class CountFacets {
  int? hasimage;
  int? ondisplay;

  CountFacets({this.hasimage, this.ondisplay});
  factory CountFacets.fromJson(Map<String, dynamic> json) =>
      _$CountFacetsFromJson(json);
}

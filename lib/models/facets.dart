import 'package:json_annotation/json_annotation.dart';

part 'facets.g.dart';

@JsonSerializable()
class Facets {
  String? key;
  int? value;

  Facets({this.key, this.value});
  factory Facets.fromJson(Map<String, dynamic> json) => _$FacetsFromJson(json);
}

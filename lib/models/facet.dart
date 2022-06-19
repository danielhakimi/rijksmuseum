import 'package:json_annotation/json_annotation.dart';

import 'facets.dart';

part 'facet.g.dart';

@JsonSerializable()
class Facet {
  List<Facets>? facets;
  String? name;
  int? otherTerms;
  int? prettyName;

  Facet({this.facets, this.name, this.otherTerms, this.prettyName});
  factory Facet.fromJson(Map<String, dynamic> json) => _$FacetFromJson(json);
}

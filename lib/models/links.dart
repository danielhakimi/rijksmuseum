import 'package:json_annotation/json_annotation.dart';

part 'links.g.dart';

@JsonSerializable()
class Links {
  String? self;
  String? web;

  Links({this.self, this.web});

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
}

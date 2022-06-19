// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Facet _$FacetFromJson(Map<String, dynamic> json) => Facet(
      facets: (json['facets'] as List<dynamic>?)
          ?.map((e) => Facets.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      otherTerms: json['otherTerms'] as int?,
      prettyName: json['prettyName'] as int?,
    );

Map<String, dynamic> _$FacetToJson(Facet instance) => <String, dynamic>{
      'facets': instance.facets,
      'name': instance.name,
      'otherTerms': instance.otherTerms,
      'prettyName': instance.prettyName,
    };

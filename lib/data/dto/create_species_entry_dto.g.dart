// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_species_entry_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateSpeciesEntryDto _$CreateSpeciesEntryDtoFromJson(
        Map<String, dynamic> json) =>
    CreateSpeciesEntryDto(
      species: json['species'] as int? ?? 0,
      evidenceStatus: json['evidenceStatus'] as int? ?? 0,
      count: json['count'] as int? ?? 1,
      comment: json['comment'] as String? ?? '',
    );

Map<String, dynamic> _$CreateSpeciesEntryDtoToJson(
        CreateSpeciesEntryDto instance) =>
    <String, dynamic>{
      'species': instance.species,
      'comment': instance.comment,
      'evidenceStatus': instance.evidenceStatus,
      'count': instance.count,
    };

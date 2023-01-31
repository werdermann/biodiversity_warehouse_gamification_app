// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'species_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpeciesEntry _$SpeciesEntryFromJson(Map<String, dynamic> json) => SpeciesEntry(
      species: $enumDecodeNullable(_$SpeciesEnumMap, json['species']) ??
          Species.notSpecified,
      evidenceStatus: $enumDecodeNullable(
              _$EvidenceStatusEnumMap, json['evidenceStatus']) ??
          EvidenceStatus.notSpecified,
      count: json['count'] as int? ?? 1,
      comment: json['comment'] as String? ?? '',
    );

Map<String, dynamic> _$SpeciesEntryToJson(SpeciesEntry instance) =>
    <String, dynamic>{
      'species': _$SpeciesEnumMap[instance.species]!,
      'comment': instance.comment,
      'evidenceStatus': _$EvidenceStatusEnumMap[instance.evidenceStatus]!,
      'count': instance.count,
    };

const _$SpeciesEnumMap = {
  Species.notSpecified: 'notSpecified',
  Species.squirrel: 'squirrel',
  Species.hedgehog: 'hedgehog',
  Species.moose: 'moose',
};

const _$EvidenceStatusEnumMap = {
  EvidenceStatus.notSpecified: 'notSpecified',
  EvidenceStatus.alive: 'alive',
  EvidenceStatus.dead: 'dead',
  EvidenceStatus.indirect: 'indirect',
};

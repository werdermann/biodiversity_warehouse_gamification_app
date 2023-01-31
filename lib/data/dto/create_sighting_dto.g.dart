// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_sighting_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateSightingDto _$CreateSightingDtoFromJson(Map<String, dynamic> json) =>
    CreateSightingDto(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      locationComment: json['locationComment'] as String,
      date: json['date'] as String,
      reportMethod: $enumDecode(_$ReportMethodEnumMap, json['reportMethod']),
      detailsComment: json['detailsComment'] as String,
      speciesEntries: (json['speciesEntries'] as List<dynamic>)
          .map((e) => SpeciesEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreateSightingDtoToJson(CreateSightingDto instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'locationComment': instance.locationComment,
      'speciesEntries': instance.speciesEntries,
      'date': instance.date,
      'reportMethod': _$ReportMethodEnumMap[instance.reportMethod]!,
      'detailsComment': instance.detailsComment,
    };

const _$ReportMethodEnumMap = {
  ReportMethod.fishing: 'fishing',
  ReportMethod.notSpecified: 'notSpecified',
  ReportMethod.netCatch: 'netCatch',
  ReportMethod.trapFishing: 'trapFishing',
  ReportMethod.visualObservation: 'visualObservation',
  ReportMethod.misc: 'misc',
  ReportMethod.traditionalFishing: 'traditionalFishing',
};

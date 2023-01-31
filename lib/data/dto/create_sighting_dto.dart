import 'package:biodiversity/data/dto/report_method.dart';
import 'package:biodiversity/domain/model/species_entry.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_sighting_dto.g.dart';

@JsonSerializable()
class CreateSightingDto {
  CreateSightingDto({
    required this.latitude,
    required this.longitude,
    required this.locationComment,
    required this.date,
    required this.reportMethod,
    required this.detailsComment,
    required this.speciesEntries,
  });

  factory CreateSightingDto.fromJson(Map<String, dynamic> json) =>
      _$CreateSightingDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreateSightingDtoToJson(this);

  final double latitude;

  final double longitude;

  final String locationComment;

  final List<SpeciesEntry> speciesEntries;

  final String date;

  final ReportMethod reportMethod;

  final String detailsComment;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_species_entry_dto.g.dart';

/// Data transfer object for creating a single species entry.
@JsonSerializable()
class CreateSpeciesEntryDto {
  CreateSpeciesEntryDto({
    this.species = 0, // Not specified
    this.evidenceStatus = 0, // Not specified
    this.count = 1,
    this.comment = '',
  });

  factory CreateSpeciesEntryDto.fromJson(Map<String, dynamic> json) =>
      _$CreateSpeciesEntryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreateSpeciesEntryDtoToJson(this);

  final int species;

  final String comment;

  final int evidenceStatus;

  final int count;
}

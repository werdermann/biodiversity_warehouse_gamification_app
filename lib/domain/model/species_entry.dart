import 'package:biodiversity/domain/model/evidence_status.dart';
import 'package:biodiversity/domain/model/species.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'species_entry.g.dart';

@JsonSerializable()
class SpeciesEntry extends Equatable {
  /// Constructor
  const SpeciesEntry({
    this.species = Species.notSpecified,
    this.evidenceStatus = EvidenceStatus.notSpecified,
    this.count = 1,
    this.comment = '',
  });

  final Species species;

  final String comment;

  final EvidenceStatus evidenceStatus;

  final int count;

  factory SpeciesEntry.fromJson(Map<String, dynamic> json) =>
      _$SpeciesEntryFromJson(json);

  Map<String, dynamic> toJson() => _$SpeciesEntryToJson(this);

  /// Updates the species entry and returns a new instance.
  SpeciesEntry copyWith({
    Species? species,
    String? comment,
    EvidenceStatus? evidenceStatus,
    int? count,
  }) {
    return SpeciesEntry(
      species: species ?? this.species,
      comment: comment ?? this.comment,
      evidenceStatus: evidenceStatus ?? this.evidenceStatus,
      count: count ?? this.count,
    );
  }

  @override
  List<Object?> get props => [species, comment, evidenceStatus, count];
}

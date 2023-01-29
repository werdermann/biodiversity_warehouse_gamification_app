import 'dart:io';

import 'package:biodiversity/domain/model/evidence_status.dart';
import 'package:biodiversity/domain/model/species.dart';
import 'package:biodiversity/domain/model/species_entry.dart';
import 'package:biodiversity/domain/use_case/take_image/take_camera_image_use_case.dart';
import 'package:biodiversity/domain/use_case/take_image/take_gallery_image_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit({
    required TakeGalleryImageUseCase takeGalleryImageUseCase,
    required TakeCameraImageUseCase takeCameraImageUseCase,
  })  : _takeGalleryImageUseCase = takeGalleryImageUseCase,
        _takeCameraImageUseCase = takeCameraImageUseCase,
        super(const ReportState()) {
    emit(
      state.copyWith(
        species: [SpeciesEntry()],
        date: DateTime.now(),
      ),
    );
  }

  final TakeGalleryImageUseCase _takeGalleryImageUseCase;
  final TakeCameraImageUseCase _takeCameraImageUseCase;

  void showNextStep() {
    emit(state.copyWith(step: state.step + 1));
  }

  void showPreviousStep() {
    emit(state.copyWith(step: state.step - 1));
  }

  void addSpeciesEntry() {
    final species = List<SpeciesEntry>.from(state.species);
    species.add(SpeciesEntry());

    emit(state.copyWith(species: species));
  }

  void speciesChanged({
    required int index,
    required,
    required int speciesIndex,
  }) {
    final speciesList = List<SpeciesEntry>.from(state.species);
    final item = speciesList[index];

    final updatedEntry = item.copyWith(species: Species.values[speciesIndex]);

    speciesList[index] = updatedEntry;

    emit(state.copyWith(species: speciesList));
  }

  void evidenceMethodChanged({
    required int index,
    required int evidenceStatusIndex,
  }) {
    final speciesList = List<SpeciesEntry>.from(state.species);
    final item = speciesList[index];

    final updatedEntry = item.copyWith(
      evidenceStatus: EvidenceStatus.values[evidenceStatusIndex],
    );

    speciesList[index] = updatedEntry;

    emit(state.copyWith(species: speciesList));
  }

  void addSpeciesCount({required index}) {
    final speciesList = List<SpeciesEntry>.from(state.species);
    final item = speciesList[index];

    final updatedEntry = item.copyWith(
      count: item.count + 1,
    );

    speciesList[index] = updatedEntry;

    emit(state.copyWith(species: speciesList));
  }

  void removeSpeciesCount({required index}) {
    final speciesList = List<SpeciesEntry>.from(state.species);
    final item = speciesList[index];

    final updatedEntry = item.copyWith(
      count: item.count - 1,
    );

    speciesList[index] = updatedEntry;

    emit(state.copyWith(species: speciesList));
  }

  void speciesCommentChanged({required int index, required String value}) {
    final speciesList = List<SpeciesEntry>.from(state.species);
    final item = speciesList[index];

    final updatedEntry = item.copyWith(
      comment: value,
    );

    speciesList[index] = updatedEntry;

    emit(state.copyWith(species: speciesList));
  }

  void removeEntry(int index) {
    final speciesList = List<SpeciesEntry>.from(state.species);
    speciesList.removeAt(index);

    emit(state.copyWith(species: speciesList));
  }

  void takeImageFromGallery() async {
    emit(state.copyWith(galleryImageStatus: FormzStatus.submissionInProgress));

    final result = _takeGalleryImageUseCase.execute();

    result.listen((event) {
      event.when(
        success: (data) {
          final images = List<File>.from(state.images);

          images.add(data);
          emit(
            state.copyWith(
              images: images,
              galleryImageStatus: FormzStatus.submissionSuccess,
            ),
          );
        },
        error: (message) {
          emit(
            state.copyWith(
              galleryImageStatus: FormzStatus.submissionFailure,
              galleryImageError: message,
            ),
          );
        },
        loading: () {
          emit(
            state.copyWith(
              galleryImageStatus: FormzStatus.submissionInProgress,
            ),
          );
        },
      );
    });
  }

  void takeImageFromCamera() async {
    emit(state.copyWith(cameraImageStatus: FormzStatus.submissionInProgress));

    final result = _takeCameraImageUseCase.execute();

    /*
    result.listen((event) {
      event.when(loading: (), success: success, error: error)
    }
      success: (file) {},
      failure: (error) {
        emit(
          state.copyWith(
            cameraImageStatus: FormzStatus.submissionFailure,
            cameraImageError: error,
          ),
        );
      },
    );

     */
  }

  void removeImage(File value) {
    final images = List<File>.from(state.images);
    images.remove(value);

    emit(state.copyWith(images: images));
  }

  void methodCommentChanged(String value) {
    emit(state.copyWith(methodComment: value));
  }

  void methodChanged(int? value) {
    emit(state.copyWith(reportMethod: value));
  }

  void dateChanged(DateTime? date) {
    emit(state.copyWith(date: date));
  }

  void submitSighting() async {
    print("Submit sighting1");
  }
}

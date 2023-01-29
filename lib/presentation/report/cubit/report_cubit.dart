import 'dart:io';

import 'package:biodiversity/common/constants.dart';
import 'package:biodiversity/domain/model/evidence_status.dart';
import 'package:biodiversity/domain/model/species.dart';
import 'package:biodiversity/domain/model/species_entry.dart';
import 'package:biodiversity/domain/use_case/location/get_location_use_case.dart';
import 'package:biodiversity/domain/use_case/location/request_location_permission_use_case.dart';
import 'package:biodiversity/domain/use_case/take_image/take_camera_image_use_case.dart';
import 'package:biodiversity/domain/use_case/take_image/take_gallery_image_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:formz/formz.dart';
import 'package:latlong2/latlong.dart';

part 'report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit({
    required TakeGalleryImageUseCase takeGalleryImageUseCase,
    required TakeCameraImageUseCase takeCameraImageUseCase,
    required GetLocationUseCase getLocationUseCase,
    required RequestLocationPermissionUseCase requestLocationPermissionUseCase,
  })  : _takeGalleryImageUseCase = takeGalleryImageUseCase,
        _takeCameraImageUseCase = takeCameraImageUseCase,
        _getLocationUseCase = getLocationUseCase,
        _requestLocationPermissionUseCase = requestLocationPermissionUseCase,
        super(const ReportState()) {
    // Get current date
    emit(
      state.copyWith(
        date: DateTime.now(),
      ),
    );

    _requestLocationPermission();
  }

  final TakeGalleryImageUseCase _takeGalleryImageUseCase;
  final TakeCameraImageUseCase _takeCameraImageUseCase;
  final GetLocationUseCase _getLocationUseCase;
  final RequestLocationPermissionUseCase _requestLocationPermissionUseCase;

  final MapController mapController = MapController();

  void showNextStep() {
    emit(state.copyWith(step: state.step + 1));
  }

  void showPreviousStep() {
    emit(state.copyWith(step: state.step - 1));
  }

  void addSpeciesEntry() {
    final species = List<SpeciesEntry>.from(state.species);
    species.add(const SpeciesEntry());

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

  void getCurrentLocation() async {
    _getLocationUseCase.execute().forEach((result) {
      result.when(
        loading: () {
          emit(
            state.copyWith(
              getPositionStatus: FormzStatus.submissionInProgress,
            ),
          );
        },
        success: (position) {
          final center = LatLng(position.latitude, position.longitude);

          print("Trigger controller!");

          mapController.move(center, Constants.zoomLevel);
        },
        error: (message) {
          emit(
            state.copyWith(
              getPositionStatus: FormzStatus.submissionFailure,
              getPositionError: message,
            ),
          );
        },
      );
    });
  }

  void _requestLocationPermission() async {
    _requestLocationPermissionUseCase.execute().forEach((result) {
      result.when(
        loading: () {
          emit(
            state.copyWith(
              locationPermissionStatus: FormzStatus.submissionInProgress,
            ),
          );
        },
        success: () {
          emit(
            state.copyWith(
              locationPermissionStatus: FormzStatus.submissionSuccess,
            ),
          );
        },
        error: (message) {
          emit(
            state.copyWith(
              locationPermissionStatus: FormzStatus.submissionFailure,
              locationPermissionError: message,
            ),
          );
        },
      );
    });
  }

  void setPositionManually(LatLng position) {
    emit(state.copyWith(location: position));
  }

  void takeImageFromGallery() async {
    _takeGalleryImageUseCase.execute().forEach((result) {
      result.when(
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
    _takeCameraImageUseCase.execute().forEach((result) {
      result.when(
        loading: () {
          emit(
            state.copyWith(
              galleryImageStatus: FormzStatus.submissionInProgress,
            ),
          );
        },
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
              cameraImageError: message,
              cameraImageStatus: FormzStatus.submissionFailure,
            ),
          );
        },
      );
    });
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
    print('Submit sighting1');
  }
}

import 'dart:io';

import 'package:biodiversity/common/constants.dart';
import 'package:biodiversity/data/dto/create_sighting_dto.dart';
import 'package:biodiversity/data/dto/create_species_entry_dto.dart';
import 'package:biodiversity/domain/model/evidence_status.dart';
import 'package:biodiversity/domain/model/report_method.dart';
import 'package:biodiversity/domain/model/species.dart';
import 'package:biodiversity/domain/model/species_entry.dart';
import 'package:biodiversity/domain/use_case/location/get_location_use_case.dart';
import 'package:biodiversity/domain/use_case/location/request_location_permission_use_case.dart';
import 'package:biodiversity/domain/use_case/submit/submit_sighting_use_case.dart';
import 'package:biodiversity/domain/use_case/take_image/take_camera_image_use_case.dart';
import 'package:biodiversity/domain/use_case/take_image/take_gallery_image_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:formz/formz.dart';
import 'package:latlong2/latlong.dart';

part 'report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  /// Constructor
  ReportCubit({
    required TakeGalleryImageUseCase takeGalleryImageUseCase,
    required TakeCameraImageUseCase takeCameraImageUseCase,
    required GetLocationUseCase getLocationUseCase,
    required RequestLocationPermissionUseCase requestLocationPermissionUseCase,
    required SubmitSightingUseCase submitSightingUseCase,
  })  : _takeGalleryImageUseCase = takeGalleryImageUseCase,
        _takeCameraImageUseCase = takeCameraImageUseCase,
        _getLocationUseCase = getLocationUseCase,
        _requestLocationPermissionUseCase = requestLocationPermissionUseCase,
        _submitSightingUseCase = submitSightingUseCase,
        super(const ReportState()) {
    // Set current date and start position
    emit(
      state.copyWith(
        date: DateTime.now(),
        location: Constants.mapStartPosition,
      ),
    );

    _requestLocationPermission();
  }

  final TakeGalleryImageUseCase _takeGalleryImageUseCase;
  final TakeCameraImageUseCase _takeCameraImageUseCase;
  final GetLocationUseCase _getLocationUseCase;
  final RequestLocationPermissionUseCase _requestLocationPermissionUseCase;
  final SubmitSightingUseCase _submitSightingUseCase;

  final MapController mapController = MapController();
  final MapController summaryMapController = MapController();
  final TextEditingController searchSpeciesController = TextEditingController();

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
    emit(state.copyWith(selectSpeciesStatus: FormzStatus.submissionInProgress));

    final speciesList = List<SpeciesEntry>.from(state.species);
    final item = speciesList[index];

    final updatedEntry = item.copyWith(species: Species.values[speciesIndex]);

    speciesList[index] = updatedEntry;

    emit(
      state.copyWith(
        species: speciesList,
        selectSpeciesStatus: FormzStatus.submissionSuccess,
      ),
    );
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
          final location = LatLng(position.latitude, position.longitude);

          mapController.move(location, Constants.zoomLevel);

          // summaryMapController.move(location, Constants.zoomLevel);

          emit(state.copyWith(location: location));
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

  void locationCommentChanged(String value) {
    emit(state.copyWith(locationComment: value));
  }

  void methodCommentChanged(String value) {
    emit(state.copyWith(methodComment: value));
  }

  void methodChanged(ReportMethod? value) {
    emit(state.copyWith(reportMethod: value));
  }

  void dateChanged(DateTime? date) {
    emit(state.copyWith(date: date));
  }

  void submitSighting() async {
    final speciesEntryDtos = state.species
        .map(
          (entry) => CreateSpeciesEntryDto(
            species: entry.species.index,
            evidenceStatus: entry.evidenceStatus.index,
            count: entry.count,
            comment: entry.comment,
          ),
        )
        .toList();

    final createSightingDto = CreateSightingDto(
      latitude: state.location!.latitude,
      longitude: state.location!.longitude,
      locationComment: state.locationComment,
      date: state.date!.toIso8601String(),
      reportMethod: state.reportMethod.index,
      detailsComment: state.methodComment,
      speciesEntries: speciesEntryDtos,
    );

    _submitSightingUseCase
        .execute(createSightingDto: createSightingDto, images: state.images)
        .forEach((result) {
      result.when(
        loading: () {
          emit(
            state.copyWith(
              submitStatus: FormzStatus.submissionInProgress,
            ),
          );
        },
        success: () {
          emit(
            state.copyWith(
              submitStatus: FormzStatus.submissionSuccess,
            ),
          );
        },
        error: (message) {
          emit(
            state.copyWith(
              submitError: message,
              submitStatus: FormzStatus.submissionFailure,
            ),
          );
        },
      );
    });
  }

  void resetState() {
    final resetState = state.resetState();

    emit(
      resetState.copyWith(
        date: DateTime.now(),
        location: Constants.mapStartPosition,
      ),
    );
  }

  void searchSpecies(String value) {
    emit(state.copyWith(searchSpeciesValue: value));
  }

  void resetSpeciesSearch() {
    emit(state.copyWith(searchSpeciesValue: ''));
    searchSpeciesController.clear();
  }
}

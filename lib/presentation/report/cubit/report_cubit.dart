import 'dart:io';

import 'package:biodiversity/domain/take_camera_image_use_case.dart';
import 'package:biodiversity/domain/take_gallery_image_use_case.dart';
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

  void takeImageFromGallery() async {
    emit(state.copyWith(galleryImageStatus: FormzStatus.submissionInProgress));

    final result = await _takeGalleryImageUseCase.execute();

    result.when(
      success: (file) {
        final images = List<File>.from(state.images);

        images.add(file);

        emit(
          state.copyWith(
            images: images,
            galleryImageStatus: FormzStatus.submissionSuccess,
          ),
        );
      },
      failure: (error) {
        emit(
          state.copyWith(
            galleryImageStatus: FormzStatus.submissionFailure,
            galleryImageError: error,
          ),
        );
      },
    );
  }

  void takeImageFromCamera() async {
    emit(state.copyWith(cameraImageStatus: FormzStatus.submissionInProgress));

    final result = await _takeCameraImageUseCase.execute();

    result.when(
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

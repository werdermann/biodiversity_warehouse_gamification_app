import 'dart:io';

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

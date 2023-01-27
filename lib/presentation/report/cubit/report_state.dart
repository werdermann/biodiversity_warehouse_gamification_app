part of 'report_cubit.dart';

class ReportState extends Equatable {
  const ReportState({
    this.step = 0,
    this.cameraImageStatus = FormzStatus.pure,
    this.cameraImageError = '',
    this.galleryImageStatus = FormzStatus.pure,
    this.galleryImageError = '',
    this.images = const [],
    this.methodComment = '',
    this.reportMethod = 4,
    this.date,
  });

  /// The current step of the reporting process.
  final int step;

  /// Validation status when taking an image from the camera.
  final FormzStatus cameraImageStatus;

  /// Error when taking an image from the camera fails.
  final String cameraImageError;

  /// Validation status when taking a gallery from the camera.
  final FormzStatus galleryImageStatus;

  /// Error when taking an image from the gallery fails.
  final String galleryImageError;

  /// Images of the report.
  final List<File> images;

  /// Index of the report method.
  final int reportMethod;

  /// Comment for the report method.
  final String methodComment;

  /// Date of the report.
  final DateTime? date;

  /// Updates the state and returns a new instance.
  ReportState copyWith({
    int? step,
    FormzStatus? cameraImageStatus,
    String? cameraImageError,
    FormzStatus? galleryImageStatus,
    String? galleryImageError,
    List<File>? images,
    String? methodComment,
    int? reportMethod,
    DateTime? date,
  }) {
    return ReportState(
      step: step ?? this.step,
      cameraImageStatus: cameraImageStatus ?? this.cameraImageStatus,
      cameraImageError: cameraImageError ?? this.cameraImageError,
      galleryImageStatus: galleryImageStatus ?? this.galleryImageStatus,
      galleryImageError: galleryImageError ?? this.galleryImageError,
      images: images ?? this.images,
      methodComment: methodComment ?? this.methodComment,
      reportMethod: reportMethod ?? this.reportMethod,
      date: date ?? this.date,
    );
  }

  @override
  List<Object?> get props => [
        step,
        cameraImageStatus,
        cameraImageError,
        galleryImageStatus,
        galleryImageError,
        images,
        methodComment,
        reportMethod,
        date,
      ];
}

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
    this.reportMethod = ReportMethod.notSpecified,
    this.date,
    this.species = const [SpeciesEntry()],
    this.locationPermissionStatus = FormzStatus.pure,
    this.locationPermissionError = '',
    this.getPositionStatus = FormzStatus.pure,
    this.getPositionError = '',
    this.location,
    this.submitStatus = FormzStatus.pure,
    this.submitError = '',
    this.locationComment = '',
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
  final ReportMethod reportMethod;

  /// Comment for the report method.
  final String methodComment;

  /// Date of the report.
  final DateTime? date;

  /// List of species that shall be reported.
  final List<SpeciesEntry> species;

  /// Validation status for requesting the location permission.
  final FormzStatus locationPermissionStatus;

  /// Error message that is being displayed when the requesting the location
  /// permission fails.
  final String locationPermissionError;

  /// Comment based on the location.
  final String locationComment;

  /// Validation status for getting the current position.
  final FormzStatus getPositionStatus;

  /// Error message when getting the current position fails.
  final String getPositionError;

  /// Position of the species.
  final LatLng? location;

  /// Validation status for submitting a sighting.
  final FormzStatus submitStatus;

  /// Error message when submitting a sighting fails.
  final String submitError;

  /// Updates the state and returns a new instance.
  ReportState copyWith({
    int? step,
    FormzStatus? cameraImageStatus,
    String? cameraImageError,
    FormzStatus? galleryImageStatus,
    String? galleryImageError,
    List<File>? images,
    String? methodComment,
    ReportMethod? reportMethod,
    DateTime? date,
    List<SpeciesEntry>? species,
    FormzStatus? locationPermissionStatus,
    String? locationPermissionError,
    FormzStatus? getPositionStatus,
    String? getPositionError,
    LatLng? location,
    FormzStatus? submitStatus,
    String? submitError,
    String? locationComment,
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
      species: species ?? this.species,
      locationPermissionStatus:
          locationPermissionStatus ?? this.locationPermissionStatus,
      locationPermissionError:
          locationPermissionError ?? this.locationPermissionError,
      getPositionStatus: getPositionStatus ?? this.getPositionStatus,
      getPositionError: getPositionError ?? this.getPositionError,
      location: location ?? this.location,
      submitStatus: submitStatus ?? this.submitStatus,
      submitError: submitError ?? this.submitError,
      locationComment: locationComment ?? this.locationComment,
    );
  }

  /// Resets the state to the default values and returns a new instance.
  ReportState resetState() {
    return const ReportState();
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
        species,
        locationPermissionStatus,
        locationPermissionError,
        getPositionStatus,
        getPositionError,
        location,
        submitStatus,
        submitError,
        locationComment,
      ];
}

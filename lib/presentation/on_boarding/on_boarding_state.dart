part of 'on_boarding_cubit.dart';

class OnBoardingState extends Equatable {
  const OnBoardingState({
    this.page = 0,
    this.cameraImageStatus = FormzStatus.pure,
    this.cameraImageError = '',
    this.galleryImageStatus = FormzStatus.pure,
    this.galleryImageError = '',
    this.images = const [],
    this.methodComment = '',
    this.reportMethod = ReportMethod.visualObservation,
    this.date,
    this.species = const [
      SpeciesEntry(
        species: Species.squirrel,
        evidenceStatus: EvidenceStatus.alive,
        comment: 'Hat gefleckte Streifen',
      ),
    ],
    this.locationPermissionStatus = FormzStatus.pure,
    this.locationPermissionError = '',
    this.getPositionStatus = FormzStatus.pure,
    this.getPositionError = '',
    this.location,
    this.submitStatus = FormzStatus.pure,
    this.submitError = '',
    this.locationComment = 'Auf einem Baum',
    this.dialogOneTextIndex = 0,
    this.isDialogOneFinished = false,
    this.isDialogTwoFinished = false,
    this.isDialogThreeFinished = false,
    this.isDialogFourFinished = false,
    this.isDialogFiveFinished = false,
  });

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

  final int page;

  /// Determines which text should be displayed in the dialog.
  final int dialogOneTextIndex;
  final bool isDialogOneFinished;

  final bool isDialogTwoFinished;

  final bool isDialogThreeFinished;

  final bool isDialogFourFinished;

  final bool isDialogFiveFinished;

  /// Updates the state and returns a new instance.
  OnBoardingState copyWith({
    int? page,
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
    int? dialogOneTextIndex,
    bool? isDialogOneFinished,
    bool? isDialogTwoFinished,
    bool? isDialogThreeFinished,
    bool? isDialogFourFinished,
    bool? isDialogFiveFinished,
  }) {
    return OnBoardingState(
      page: page ?? this.page,
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
      dialogOneTextIndex: dialogOneTextIndex ?? this.dialogOneTextIndex,
      isDialogOneFinished: isDialogOneFinished ?? this.isDialogOneFinished,
      isDialogTwoFinished: isDialogTwoFinished ?? this.isDialogTwoFinished,
      isDialogThreeFinished:
          isDialogThreeFinished ?? this.isDialogThreeFinished,
      isDialogFourFinished: isDialogFourFinished ?? this.isDialogFourFinished,
      isDialogFiveFinished: isDialogFiveFinished ?? this.isDialogFiveFinished,
    );
  }

  @override
  List<Object?> get props => [
        page,
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
        dialogOneTextIndex,
        isDialogOneFinished,
        isDialogTwoFinished,
        isDialogThreeFinished,
        isDialogFourFinished,
        isDialogFiveFinished,
      ];
}

/// The report method indicates what method the user used to indicate the
/// reported sighting.
enum ReportMethod {
  fishing(message: 'REPORT.STEP_4.METHODS.FISHING'),
  notSpecified(message: 'REPORT.STEP_4.METHODS.NOT_SPECIFIED'),
  netCatch(message: 'REPORT.STEP_4.METHODS.NET_CATCH'),
  trapFishing(message: 'REPORT.STEP_4.METHODS.TRAP_FISHING'),
  visualObservation(message: 'REPORT.STEP_4.METHODS.VISUAL_OBSERVATION'),
  misc(message: 'REPORT.STEP_4.METHODS.MISC'),
  traditionalFishing(message: 'REPORT.STEP_4.METHODS.TRADITIONAL_FISHING');

  const ReportMethod({required this.message});

  final String message;
}

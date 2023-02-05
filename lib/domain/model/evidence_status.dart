/// The evidence status represents the current state of the animal.
enum EvidenceStatus {
  notSpecified(methodName: 'EVIDENCE_METHOD.NOT_SPECIFIED'),
  alive(methodName: 'EVIDENCE_METHOD.ALIVE'),
  dead(methodName: 'EVIDENCE_METHOD.DEAD'),
  indirect(methodName: 'EVIDENCE_METHOD.INDIRECT');

  const EvidenceStatus({required this.methodName});

  final String methodName;
}

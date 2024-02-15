part of 'visit_cubit.dart';

@freezed
class VisitState with _$VisitState {
  // const factory VisitState.newPatient() = _NewPatient;
  const factory VisitState.editPatient() = _EditPatient;
  const factory VisitState.patientPreview() = _PatientPreview;
  const factory VisitState.activeVisit() = _ActiveVisit;
  const factory VisitState.visitPreview() = _VisitPreview;
}

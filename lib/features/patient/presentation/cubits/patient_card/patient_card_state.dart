part of 'patient_card_cubit.dart';

@freezed
class PatientCardState with _$PatientCardState {
  const factory PatientCardState.initial() = _Initial;
  const factory PatientCardState.newPatient() = _NewPatient;
  const factory PatientCardState.editPatient() = _EditPatient;
  const factory PatientCardState.viewPatient() = _ViewPatient;
}

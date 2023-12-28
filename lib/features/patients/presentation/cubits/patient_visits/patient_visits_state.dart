part of 'patient_visits_cubit.dart';

@freezed
class PatientVisitsState with _$PatientVisitsState {
  const factory PatientVisitsState.initial() = _Initial;
  const factory PatientVisitsState.filtered(List<DataRow2> items) = _Filtered;
}

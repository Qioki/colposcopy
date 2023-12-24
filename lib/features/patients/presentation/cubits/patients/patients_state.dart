part of 'patients_cubit.dart';

@freezed
class PatientsState with _$PatientsState {
  const factory PatientsState.initial() = _Initial;
  const factory PatientsState.search(List<Patient> items) = _Search;
}

part of 'patients_cubit.dart';

@freezed
class PatientsState with _$PatientsState {
  const factory PatientsState.initial() = _Initial;
  const factory PatientsState.filtered(List<DataRow2> items) = _Filtered;
  // const factory PatientsState.empty() = _Empty;
  // const factory PatientsState.search(List<Patient> items) = _Search;
}

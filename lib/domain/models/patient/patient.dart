import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient.freezed.dart';
part 'patient.g.dart';

@Freezed(equal: false, toStringOverride: false, toJson: true)
class Patient with _$Patient {
  const factory Patient({
    int? patientId,
    required int userId,
    required String firstname,
    required String lastname,
    @Default(1) int state,
    String? patronymic,
    String? phone,
    String? email,
    DateTime? birthdate,
    String? snils,
    String? policy,
    String? card,
  }) = _Patient;

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);
}

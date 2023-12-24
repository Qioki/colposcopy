import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient.freezed.dart';
// part 'patient.g.dart';

@Freezed()
class Patient with _$Patient {
  const factory Patient({
    required int patientId,
    required int userId,
    required int state,
    required String firstname,
    required String lastname,
    String? patronymic,
    String? phone,
    String? email,
    DateTime? birthday,
    String? snils,
    String? policy,
    String? card,
  }) = _Patient;
}

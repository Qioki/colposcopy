import 'package:freezed_annotation/freezed_annotation.dart';

part 'visit.freezed.dart';
// part 'visit.g.dart';

@Freezed()
class Visit with _$Visit {
  const factory Visit({
    required int visitId,
    required int userId,
    required int patientId,
    required int protocolId,
    required String protocolData,
    required DateTime visitDate,
  }) = _Visit;
}

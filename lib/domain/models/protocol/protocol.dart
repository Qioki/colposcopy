import 'package:freezed_annotation/freezed_annotation.dart';

part 'protocol.freezed.dart';
part 'protocol.g.dart';

@Freezed(copyWith: false, equal: false, toStringOverride: false)
class Protocol with _$Protocol {
  const factory Protocol({
    int? protocolId,
    @Default(1) int userId,
    @Default(0) int state,
    required String scheme,
  }) = _Protocol;

  factory Protocol.fromJson(Map<String, dynamic> json) =>
      _$ProtocolFromJson(json);
}

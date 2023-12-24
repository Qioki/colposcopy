import 'package:freezed_annotation/freezed_annotation.dart';

part 'protocol.freezed.dart';
// part 'protocol.g.dart';

@Freezed()
class Protocol with _$Protocol {
  const factory Protocol({
    required int protocolId,
    required int state,
    required String scheme,
  }) = _Protocol;

  // factory Protocol.fromJson(Map<String, dynamic> json) => _$ProtocolFromJson(json);
}

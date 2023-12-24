import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting.freezed.dart';
// part 'settings.g.dart';

@Freezed()
class Setting with _$Setting {
  const factory Setting({
    required int settingId,
    required int userId,
    required String param,
    required String value,
  }) = _Setting;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings.freezed.dart';
part 'app_settings.g.dart';

@Freezed(equal: false, toStringOverride: false)
class AppSettings with _$AppSettings {
  @JsonSerializable(includeIfNull: false)
  // @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory AppSettings({
    // @JsonKey(defaultValue: '') required String databasePath,
    @Default('') String databasePath,
    OrganizationData? organization,
    String? colposcopyModel,
    String? pedalType,
    String? cameraLibrary,
    String? videoLibrary,
    String? videoFormat,
    int? logLevel,
  }) = _SettingsParams;

  factory AppSettings.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);
  // Map<String, dynamic> toJson() => _$SettingsParamsToJson(this);
}

@Freezed(equal: false)
class OrganizationData with _$OrganizationData {
  @JsonSerializable(includeIfNull: false)
  const factory OrganizationData({
    String? organizationName,
    String? organizationDescription,
    String? organizationPhone,
    String? organizationEmail,
    String? organizationWebsite,
    String? organizationCode,
    String? organizationLicense,
    String? organizationAddress,
    String? organizationLogo,
  }) = _OrganizationData;

  factory OrganizationData.fromJson(Map<String, dynamic> json) =>
      _$OrganizationDataFromJson(json);
  // Map<String, dynamic> toJson() => _$OrganizationDataToJson(this);
}

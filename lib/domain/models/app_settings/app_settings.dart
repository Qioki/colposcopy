import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings.freezed.dart';
part 'app_settings.g.dart';

// @JsonSerializable(includeIfNull: false)
// @freezed
@Freezed(equal: false)
class AppSettings with _$AppSettings {
  // @JsonKey(defaultValue: '')
  // final String? databasePath;
  // final OrganizationData? organization;
  // final String? colposcopyModel;
  // final String? pedalType;
  // final String? cameraLibrary;
  // final String? videoLibrary;
  // final String? videoFormat;
  // final int? logLevel;
  // CameraFormat camera = CameraFormat(); // Replace CameraFormat with the appropriate class or type

  // SettingsParams(
  //     {required this.databasePath,
  //     this.organization,
  //     this.colposcopyModel,
  //     this.pedalType,
  //     this.cameraLibrary,
  //     this.videoLibrary,
  //     this.videoFormat,
  //     this.logLevel});
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
  // final String? organizationName;
  // final String? organizationDescription;
  // final String? organizationPhone;
  // final String? organizationEmail;
  // final String? organizationWebsite;
  // final String? organizationCode;
  // final String? organizationLicense;
  // final String? organizationAddress;
  // final String? organizationLogo;

  // OrganizationData(
  //     {this.organizationName,
  //     this.organizationDescription,
  //     this.organizationPhone,
  //     this.organizationEmail,
  //     this.organizationWebsite,
  //     this.organizationCode,
  //     this.organizationLicense,
  //     this.organizationAddress,
  //     this.organizationLogo});

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



  // factory SettingsParams.fromJson(Map<String, dynamic> json) => SettingsParams(
  //       databasePath: json["DatabasePath"] ?? AppPaths.pathToDb,
  //       organization: json["Organization"] == null
  //           ? null
  //           : OrganizationData.fromJson(json["Organization"]),
  //       colposcopyModel: json["ColposcopyModel"],
  //       pedalType: json["PedalType"],
  //       cameraLibrary: json["CameraLibrary"],
  //       videoLibrary: json["VideoLibrary"],
  //       videoFormat: json["VideoFormat"],
  //       logLevel: json["LogLevel"],
  //     );

  // void toJson() => {
  //       "DatabasePath": databasePath,
  //       "Organization": organization?.toJson(),
  //       "ColposcopyModel": colposcopyModel,
  //       "PedalType": pedalType,
  //       "CameraLibrary": cameraLibrary,
  //       "VideoLibrary": videoLibrary,
  //       "VideoFormat": videoFormat,
  //       "LogLevel": logLevel,
  //     };


  
  // factory OrganizationData.fromJson(Map<String, dynamic> json) =>
  //     OrganizationData(
  //       organizationName: json["OrganizationName"],
  //       organizationDescription: json["OrganizationDescription"],
  //       organizationPhone: json["OrganizationPhone"],
  //       organizationEmail: json["OrganizationEmail"],
  //       organizationWebsite: json["OrganizationWebsite"],
  //       organizationCode: json["OrganizationCode"],
  //       organizationLicense: json["OrganizationLicense"],
  //       organizationAddress: json["OrganizationAddress"],
  //       organizationLogo: json["OrganizationLogo"],
  //     );
  // void toJson() => {
  //   organizationName == null ? null : "OrganizationName": organizationName,
  //   organizationDescription == null ? null : "OrganizationDescription": organizationDescription,
  // }
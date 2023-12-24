// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingsParamsImpl _$$SettingsParamsImplFromJson(Map<String, dynamic> json) =>
    _$SettingsParamsImpl(
      databasePath: json['databasePath'] as String? ?? '',
      organization: json['organization'] == null
          ? null
          : OrganizationData.fromJson(
              json['organization'] as Map<String, dynamic>),
      colposcopyModel: json['colposcopyModel'] as String?,
      pedalType: json['pedalType'] as String?,
      cameraLibrary: json['cameraLibrary'] as String?,
      videoLibrary: json['videoLibrary'] as String?,
      videoFormat: json['videoFormat'] as String?,
      logLevel: json['logLevel'] as int?,
    );

Map<String, dynamic> _$$SettingsParamsImplToJson(
    _$SettingsParamsImpl instance) {
  final val = <String, dynamic>{
    'databasePath': instance.databasePath,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('organization', instance.organization);
  writeNotNull('colposcopyModel', instance.colposcopyModel);
  writeNotNull('pedalType', instance.pedalType);
  writeNotNull('cameraLibrary', instance.cameraLibrary);
  writeNotNull('videoLibrary', instance.videoLibrary);
  writeNotNull('videoFormat', instance.videoFormat);
  writeNotNull('logLevel', instance.logLevel);
  return val;
}

_$OrganizationDataImpl _$$OrganizationDataImplFromJson(
        Map<String, dynamic> json) =>
    _$OrganizationDataImpl(
      organizationName: json['organizationName'] as String?,
      organizationDescription: json['organizationDescription'] as String?,
      organizationPhone: json['organizationPhone'] as String?,
      organizationEmail: json['organizationEmail'] as String?,
      organizationWebsite: json['organizationWebsite'] as String?,
      organizationCode: json['organizationCode'] as String?,
      organizationLicense: json['organizationLicense'] as String?,
      organizationAddress: json['organizationAddress'] as String?,
      organizationLogo: json['organizationLogo'] as String?,
    );

Map<String, dynamic> _$$OrganizationDataImplToJson(
    _$OrganizationDataImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('organizationName', instance.organizationName);
  writeNotNull('organizationDescription', instance.organizationDescription);
  writeNotNull('organizationPhone', instance.organizationPhone);
  writeNotNull('organizationEmail', instance.organizationEmail);
  writeNotNull('organizationWebsite', instance.organizationWebsite);
  writeNotNull('organizationCode', instance.organizationCode);
  writeNotNull('organizationLicense', instance.organizationLicense);
  writeNotNull('organizationAddress', instance.organizationAddress);
  writeNotNull('organizationLogo', instance.organizationLogo);
  return val;
}

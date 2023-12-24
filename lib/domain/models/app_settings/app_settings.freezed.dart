// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) {
  return _SettingsParams.fromJson(json);
}

/// @nodoc
mixin _$AppSettings {
// @JsonKey(defaultValue: '') required String databasePath,
  String get databasePath => throw _privateConstructorUsedError;
  OrganizationData? get organization => throw _privateConstructorUsedError;
  String? get colposcopyModel => throw _privateConstructorUsedError;
  String? get pedalType => throw _privateConstructorUsedError;
  String? get cameraLibrary => throw _privateConstructorUsedError;
  String? get videoLibrary => throw _privateConstructorUsedError;
  String? get videoFormat => throw _privateConstructorUsedError;
  int? get logLevel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppSettingsCopyWith<AppSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingsCopyWith<$Res> {
  factory $AppSettingsCopyWith(
          AppSettings value, $Res Function(AppSettings) then) =
      _$AppSettingsCopyWithImpl<$Res, AppSettings>;
  @useResult
  $Res call(
      {String databasePath,
      OrganizationData? organization,
      String? colposcopyModel,
      String? pedalType,
      String? cameraLibrary,
      String? videoLibrary,
      String? videoFormat,
      int? logLevel});

  $OrganizationDataCopyWith<$Res>? get organization;
}

/// @nodoc
class _$AppSettingsCopyWithImpl<$Res, $Val extends AppSettings>
    implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? databasePath = null,
    Object? organization = freezed,
    Object? colposcopyModel = freezed,
    Object? pedalType = freezed,
    Object? cameraLibrary = freezed,
    Object? videoLibrary = freezed,
    Object? videoFormat = freezed,
    Object? logLevel = freezed,
  }) {
    return _then(_value.copyWith(
      databasePath: null == databasePath
          ? _value.databasePath
          : databasePath // ignore: cast_nullable_to_non_nullable
              as String,
      organization: freezed == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as OrganizationData?,
      colposcopyModel: freezed == colposcopyModel
          ? _value.colposcopyModel
          : colposcopyModel // ignore: cast_nullable_to_non_nullable
              as String?,
      pedalType: freezed == pedalType
          ? _value.pedalType
          : pedalType // ignore: cast_nullable_to_non_nullable
              as String?,
      cameraLibrary: freezed == cameraLibrary
          ? _value.cameraLibrary
          : cameraLibrary // ignore: cast_nullable_to_non_nullable
              as String?,
      videoLibrary: freezed == videoLibrary
          ? _value.videoLibrary
          : videoLibrary // ignore: cast_nullable_to_non_nullable
              as String?,
      videoFormat: freezed == videoFormat
          ? _value.videoFormat
          : videoFormat // ignore: cast_nullable_to_non_nullable
              as String?,
      logLevel: freezed == logLevel
          ? _value.logLevel
          : logLevel // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OrganizationDataCopyWith<$Res>? get organization {
    if (_value.organization == null) {
      return null;
    }

    return $OrganizationDataCopyWith<$Res>(_value.organization!, (value) {
      return _then(_value.copyWith(organization: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SettingsParamsImplCopyWith<$Res>
    implements $AppSettingsCopyWith<$Res> {
  factory _$$SettingsParamsImplCopyWith(_$SettingsParamsImpl value,
          $Res Function(_$SettingsParamsImpl) then) =
      __$$SettingsParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String databasePath,
      OrganizationData? organization,
      String? colposcopyModel,
      String? pedalType,
      String? cameraLibrary,
      String? videoLibrary,
      String? videoFormat,
      int? logLevel});

  @override
  $OrganizationDataCopyWith<$Res>? get organization;
}

/// @nodoc
class __$$SettingsParamsImplCopyWithImpl<$Res>
    extends _$AppSettingsCopyWithImpl<$Res, _$SettingsParamsImpl>
    implements _$$SettingsParamsImplCopyWith<$Res> {
  __$$SettingsParamsImplCopyWithImpl(
      _$SettingsParamsImpl _value, $Res Function(_$SettingsParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? databasePath = null,
    Object? organization = freezed,
    Object? colposcopyModel = freezed,
    Object? pedalType = freezed,
    Object? cameraLibrary = freezed,
    Object? videoLibrary = freezed,
    Object? videoFormat = freezed,
    Object? logLevel = freezed,
  }) {
    return _then(_$SettingsParamsImpl(
      databasePath: null == databasePath
          ? _value.databasePath
          : databasePath // ignore: cast_nullable_to_non_nullable
              as String,
      organization: freezed == organization
          ? _value.organization
          : organization // ignore: cast_nullable_to_non_nullable
              as OrganizationData?,
      colposcopyModel: freezed == colposcopyModel
          ? _value.colposcopyModel
          : colposcopyModel // ignore: cast_nullable_to_non_nullable
              as String?,
      pedalType: freezed == pedalType
          ? _value.pedalType
          : pedalType // ignore: cast_nullable_to_non_nullable
              as String?,
      cameraLibrary: freezed == cameraLibrary
          ? _value.cameraLibrary
          : cameraLibrary // ignore: cast_nullable_to_non_nullable
              as String?,
      videoLibrary: freezed == videoLibrary
          ? _value.videoLibrary
          : videoLibrary // ignore: cast_nullable_to_non_nullable
              as String?,
      videoFormat: freezed == videoFormat
          ? _value.videoFormat
          : videoFormat // ignore: cast_nullable_to_non_nullable
              as String?,
      logLevel: freezed == logLevel
          ? _value.logLevel
          : logLevel // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$SettingsParamsImpl implements _SettingsParams {
  const _$SettingsParamsImpl(
      {this.databasePath = '',
      this.organization,
      this.colposcopyModel,
      this.pedalType,
      this.cameraLibrary,
      this.videoLibrary,
      this.videoFormat,
      this.logLevel});

  factory _$SettingsParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SettingsParamsImplFromJson(json);

// @JsonKey(defaultValue: '') required String databasePath,
  @override
  @JsonKey()
  final String databasePath;
  @override
  final OrganizationData? organization;
  @override
  final String? colposcopyModel;
  @override
  final String? pedalType;
  @override
  final String? cameraLibrary;
  @override
  final String? videoLibrary;
  @override
  final String? videoFormat;
  @override
  final int? logLevel;

  @override
  String toString() {
    return 'AppSettings(databasePath: $databasePath, organization: $organization, colposcopyModel: $colposcopyModel, pedalType: $pedalType, cameraLibrary: $cameraLibrary, videoLibrary: $videoLibrary, videoFormat: $videoFormat, logLevel: $logLevel)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsParamsImplCopyWith<_$SettingsParamsImpl> get copyWith =>
      __$$SettingsParamsImplCopyWithImpl<_$SettingsParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SettingsParamsImplToJson(
      this,
    );
  }
}

abstract class _SettingsParams implements AppSettings {
  const factory _SettingsParams(
      {final String databasePath,
      final OrganizationData? organization,
      final String? colposcopyModel,
      final String? pedalType,
      final String? cameraLibrary,
      final String? videoLibrary,
      final String? videoFormat,
      final int? logLevel}) = _$SettingsParamsImpl;

  factory _SettingsParams.fromJson(Map<String, dynamic> json) =
      _$SettingsParamsImpl.fromJson;

  @override // @JsonKey(defaultValue: '') required String databasePath,
  String get databasePath;
  @override
  OrganizationData? get organization;
  @override
  String? get colposcopyModel;
  @override
  String? get pedalType;
  @override
  String? get cameraLibrary;
  @override
  String? get videoLibrary;
  @override
  String? get videoFormat;
  @override
  int? get logLevel;
  @override
  @JsonKey(ignore: true)
  _$$SettingsParamsImplCopyWith<_$SettingsParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrganizationData _$OrganizationDataFromJson(Map<String, dynamic> json) {
  return _OrganizationData.fromJson(json);
}

/// @nodoc
mixin _$OrganizationData {
  String? get organizationName => throw _privateConstructorUsedError;
  String? get organizationDescription => throw _privateConstructorUsedError;
  String? get organizationPhone => throw _privateConstructorUsedError;
  String? get organizationEmail => throw _privateConstructorUsedError;
  String? get organizationWebsite => throw _privateConstructorUsedError;
  String? get organizationCode => throw _privateConstructorUsedError;
  String? get organizationLicense => throw _privateConstructorUsedError;
  String? get organizationAddress => throw _privateConstructorUsedError;
  String? get organizationLogo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrganizationDataCopyWith<OrganizationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrganizationDataCopyWith<$Res> {
  factory $OrganizationDataCopyWith(
          OrganizationData value, $Res Function(OrganizationData) then) =
      _$OrganizationDataCopyWithImpl<$Res, OrganizationData>;
  @useResult
  $Res call(
      {String? organizationName,
      String? organizationDescription,
      String? organizationPhone,
      String? organizationEmail,
      String? organizationWebsite,
      String? organizationCode,
      String? organizationLicense,
      String? organizationAddress,
      String? organizationLogo});
}

/// @nodoc
class _$OrganizationDataCopyWithImpl<$Res, $Val extends OrganizationData>
    implements $OrganizationDataCopyWith<$Res> {
  _$OrganizationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizationName = freezed,
    Object? organizationDescription = freezed,
    Object? organizationPhone = freezed,
    Object? organizationEmail = freezed,
    Object? organizationWebsite = freezed,
    Object? organizationCode = freezed,
    Object? organizationLicense = freezed,
    Object? organizationAddress = freezed,
    Object? organizationLogo = freezed,
  }) {
    return _then(_value.copyWith(
      organizationName: freezed == organizationName
          ? _value.organizationName
          : organizationName // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationDescription: freezed == organizationDescription
          ? _value.organizationDescription
          : organizationDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationPhone: freezed == organizationPhone
          ? _value.organizationPhone
          : organizationPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationEmail: freezed == organizationEmail
          ? _value.organizationEmail
          : organizationEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationWebsite: freezed == organizationWebsite
          ? _value.organizationWebsite
          : organizationWebsite // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationCode: freezed == organizationCode
          ? _value.organizationCode
          : organizationCode // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationLicense: freezed == organizationLicense
          ? _value.organizationLicense
          : organizationLicense // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationAddress: freezed == organizationAddress
          ? _value.organizationAddress
          : organizationAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationLogo: freezed == organizationLogo
          ? _value.organizationLogo
          : organizationLogo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrganizationDataImplCopyWith<$Res>
    implements $OrganizationDataCopyWith<$Res> {
  factory _$$OrganizationDataImplCopyWith(_$OrganizationDataImpl value,
          $Res Function(_$OrganizationDataImpl) then) =
      __$$OrganizationDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? organizationName,
      String? organizationDescription,
      String? organizationPhone,
      String? organizationEmail,
      String? organizationWebsite,
      String? organizationCode,
      String? organizationLicense,
      String? organizationAddress,
      String? organizationLogo});
}

/// @nodoc
class __$$OrganizationDataImplCopyWithImpl<$Res>
    extends _$OrganizationDataCopyWithImpl<$Res, _$OrganizationDataImpl>
    implements _$$OrganizationDataImplCopyWith<$Res> {
  __$$OrganizationDataImplCopyWithImpl(_$OrganizationDataImpl _value,
      $Res Function(_$OrganizationDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organizationName = freezed,
    Object? organizationDescription = freezed,
    Object? organizationPhone = freezed,
    Object? organizationEmail = freezed,
    Object? organizationWebsite = freezed,
    Object? organizationCode = freezed,
    Object? organizationLicense = freezed,
    Object? organizationAddress = freezed,
    Object? organizationLogo = freezed,
  }) {
    return _then(_$OrganizationDataImpl(
      organizationName: freezed == organizationName
          ? _value.organizationName
          : organizationName // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationDescription: freezed == organizationDescription
          ? _value.organizationDescription
          : organizationDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationPhone: freezed == organizationPhone
          ? _value.organizationPhone
          : organizationPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationEmail: freezed == organizationEmail
          ? _value.organizationEmail
          : organizationEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationWebsite: freezed == organizationWebsite
          ? _value.organizationWebsite
          : organizationWebsite // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationCode: freezed == organizationCode
          ? _value.organizationCode
          : organizationCode // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationLicense: freezed == organizationLicense
          ? _value.organizationLicense
          : organizationLicense // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationAddress: freezed == organizationAddress
          ? _value.organizationAddress
          : organizationAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      organizationLogo: freezed == organizationLogo
          ? _value.organizationLogo
          : organizationLogo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$OrganizationDataImpl implements _OrganizationData {
  const _$OrganizationDataImpl(
      {this.organizationName,
      this.organizationDescription,
      this.organizationPhone,
      this.organizationEmail,
      this.organizationWebsite,
      this.organizationCode,
      this.organizationLicense,
      this.organizationAddress,
      this.organizationLogo});

  factory _$OrganizationDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrganizationDataImplFromJson(json);

  @override
  final String? organizationName;
  @override
  final String? organizationDescription;
  @override
  final String? organizationPhone;
  @override
  final String? organizationEmail;
  @override
  final String? organizationWebsite;
  @override
  final String? organizationCode;
  @override
  final String? organizationLicense;
  @override
  final String? organizationAddress;
  @override
  final String? organizationLogo;

  @override
  String toString() {
    return 'OrganizationData(organizationName: $organizationName, organizationDescription: $organizationDescription, organizationPhone: $organizationPhone, organizationEmail: $organizationEmail, organizationWebsite: $organizationWebsite, organizationCode: $organizationCode, organizationLicense: $organizationLicense, organizationAddress: $organizationAddress, organizationLogo: $organizationLogo)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrganizationDataImplCopyWith<_$OrganizationDataImpl> get copyWith =>
      __$$OrganizationDataImplCopyWithImpl<_$OrganizationDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrganizationDataImplToJson(
      this,
    );
  }
}

abstract class _OrganizationData implements OrganizationData {
  const factory _OrganizationData(
      {final String? organizationName,
      final String? organizationDescription,
      final String? organizationPhone,
      final String? organizationEmail,
      final String? organizationWebsite,
      final String? organizationCode,
      final String? organizationLicense,
      final String? organizationAddress,
      final String? organizationLogo}) = _$OrganizationDataImpl;

  factory _OrganizationData.fromJson(Map<String, dynamic> json) =
      _$OrganizationDataImpl.fromJson;

  @override
  String? get organizationName;
  @override
  String? get organizationDescription;
  @override
  String? get organizationPhone;
  @override
  String? get organizationEmail;
  @override
  String? get organizationWebsite;
  @override
  String? get organizationCode;
  @override
  String? get organizationLicense;
  @override
  String? get organizationAddress;
  @override
  String? get organizationLogo;
  @override
  @JsonKey(ignore: true)
  _$$OrganizationDataImplCopyWith<_$OrganizationDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

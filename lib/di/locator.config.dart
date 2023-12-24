// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:colposcopy/core/utils/logger.dart' as _i5;
import 'package:colposcopy/data/datasources/base/atlases.dart' as _i25;
import 'package:colposcopy/data/datasources/base/patients.dart' as _i7;
import 'package:colposcopy/data/datasources/base/settings.dart' as _i14;
import 'package:colposcopy/data/datasources/base/users.dart' as _i16;
import 'package:colposcopy/data/datasources/base/visits.dart' as _i20;
import 'package:colposcopy/data/datasources/drift/atlases_impl.dart' as _i26;
import 'package:colposcopy/data/datasources/drift/database/database.dart'
    as _i3;
import 'package:colposcopy/data/datasources/drift/patients_impl.dart' as _i8;
import 'package:colposcopy/data/datasources/drift/settings_impl.dart' as _i15;
import 'package:colposcopy/data/datasources/drift/users_impl.dart' as _i17;
import 'package:colposcopy/data/datasources/drift/visits_impl.dart' as _i21;
import 'package:colposcopy/data/repositories/atlases_impl.dart' as _i28;
import 'package:colposcopy/data/repositories/patients_impl.dart' as _i10;
import 'package:colposcopy/data/repositories/users_impl.dart' as _i19;
import 'package:colposcopy/data/repositories/visits_impl.dart' as _i23;
import 'package:colposcopy/domain/controllers/security_controller.dart' as _i11;
import 'package:colposcopy/domain/controllers/settings_controller.dart' as _i12;
import 'package:colposcopy/domain/repositories/atlases.dart' as _i27;
import 'package:colposcopy/domain/repositories/patients.dart' as _i9;
import 'package:colposcopy/domain/repositories/users.dart' as _i18;
import 'package:colposcopy/domain/repositories/visits.dart' as _i22;
import 'package:colposcopy/features/app/domain/controllers/app_controller_impl.dart'
    as _i24;
import 'package:colposcopy/features/app/domain/controllers/app_launcher.dart'
    as _i30;
import 'package:colposcopy/features/auth/presentation/cubits/auth/auth_cubit.dart'
    as _i29;
import 'package:colposcopy/features/patient/presentation/cubits/patient/patient_cubit.dart'
    as _i31;
import 'package:colposcopy/features/patients/presentation/cubits/patient_visits/patient_visits_cubit.dart'
    as _i6;
import 'package:colposcopy/features/patients/presentation/cubits/patients/patients_cubit.dart'
    as _i32;
import 'package:colposcopy/features/settings/domain/settings_controller_impl.dart'
    as _i13;
import 'package:colposcopy/features/visit/presentation/cubits/visit/visit_cubit.dart'
    as _i33;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.Database>(() => _i3.Database());
    gh.lazySingleton<_i4.Logger>(() => _i5.AppLogger.debugLogger());
    gh.factory<_i6.PatientVisitsCubit>(() => _i6.PatientVisitsCubit());
    gh.lazySingleton<_i7.PatientsDatasource>(
        () => _i8.PatientsDatasourceImpl(database: gh<_i3.Database>()));
    gh.lazySingleton<_i9.PatientsRepository>(() =>
        _i10.PatientsRepositoryImpl(datasource: gh<_i7.PatientsDatasource>()));
    gh.lazySingleton<_i11.SecurityController>(() => _i11.SecurityController());
    gh.lazySingleton<_i12.SettingsController>(
        () => _i13.SettingsControllerImpl(gh<_i4.Logger>()));
    gh.lazySingleton<_i14.SettingsDatasource>(
        () => _i15.SettingsDatasourceImpl(database: gh<_i3.Database>()));
    gh.lazySingleton<_i16.UsersDatasource>(
        () => _i17.UsersDatasourceImpl(database: gh<_i3.Database>()));
    gh.lazySingleton<_i18.UsersRepository>(
        () => _i19.UsersRepositoryImpl(datasource: gh<_i16.UsersDatasource>()));
    gh.lazySingleton<_i20.VisitsDatasource>(
        () => _i21.VisitsDatasourceImpl(database: gh<_i3.Database>()));
    gh.lazySingleton<_i22.VisitsRepository>(() =>
        _i23.VisitsRepositoryImpl(datasource: gh<_i20.VisitsDatasource>()));
    gh.lazySingleton<_i24.AppController>(
        () => _i24.AppControllerImpl(gh<_i12.SettingsController>()));
    gh.lazySingleton<_i25.AtlasesDatasource>(
        () => _i26.AtlasesDatasourceImpl(database: gh<_i3.Database>()));
    gh.lazySingleton<_i27.AtlasesRepository>(() =>
        _i28.AtlasesRepositoryImpl(datasource: gh<_i25.AtlasesDatasource>()));
    gh.factory<_i29.AuthCubit>(() => _i29.AuthCubit(
          gh<_i18.UsersRepository>(),
          gh<_i24.AppController>(),
        ));
    await gh.lazySingletonAsync<_i30.LaunchController>(
      () {
        final i = _i30.AppLauncherImpl(gh<_i12.SettingsController>());
        return i.onAppStart().then((_) => i);
      },
      preResolve: true,
    );
    gh.factory<_i31.PatientCubit>(
        () => _i31.PatientCubit(gh<_i9.PatientsRepository>()));
    gh.factory<_i32.PatientsCubit>(
        () => _i32.PatientsCubit(gh<_i9.PatientsRepository>()));
    gh.factory<_i33.VisitCubit>(
        () => _i33.VisitCubit(gh<_i22.VisitsRepository>()));
    return this;
  }
}

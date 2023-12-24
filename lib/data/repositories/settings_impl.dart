import 'package:colposcopy/data/datasources/base/settings.dart';
import 'package:colposcopy/domain/models/setting/setting.dart';
import 'package:colposcopy/domain/repositories/settings.dart';

class SettingsRepositoryImpl extends SettingsRepository {
  SettingsRepositoryImpl({required this.datasource});

  SettingsDatasource datasource;

  @override
  Future<Setting> getSettings() => datasource.getSettings();

  @override
  Future<int> addSettings(Setting item) => datasource.addSettings(item);

  @override
  Future<void> deleteSettingsWithId(int id) =>
      datasource.deleteSettingsWithId(id);

  @override
  Future<void> updateSettings(Setting item) => datasource.updateSettings(item);
}

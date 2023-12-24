import 'package:colposcopy/domain/models/setting/setting.dart' as model;

abstract class SettingsDatasource {
  Future<model.Setting> getSettings();
  Future<int> addSettings(model.Setting item);
  Future<void> deleteSettingsWithId(int id);
  Future<void> updateSettings(model.Setting item);
}

import 'package:colposcopy/domain/models/setting/setting.dart';

abstract class SettingsRepository {
  Future<Setting> getSettings();
  Future<int> addSettings(Setting item);
  Future<void> deleteSettingsWithId(int id);
  Future<void> updateSettings(Setting item);
}

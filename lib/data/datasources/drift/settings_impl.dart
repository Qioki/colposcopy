import 'package:colposcopy/data/datasources/drift/database/database.dart';
import 'package:colposcopy/data/datasources/drift/mappers/settings.dart';
import 'package:colposcopy/data/datasources/base/settings.dart';
import 'package:colposcopy/domain/models/setting/setting.dart' as model;
import 'package:injectable/injectable.dart';

@LazySingleton(as: SettingsDatasource)
class SettingsDatasourceImpl extends SettingsDatasource {
  SettingsDatasourceImpl({required this.database});

  final Database database;

  @override
  Future<model.Setting> getSettings() => database
      .select(database.settings)
      .getSingle()
      .then(SettingsMapper.toModel);

  @override
  Future<int> addSettings(model.Setting item) =>
      database.into(database.settings).insert(SettingsMapper.toEntity(item));

  @override
  Future<void> deleteSettingsWithId(int id) =>
      (database.delete(database.settings)
            ..where((tbl) => tbl.settingId.equals(id)))
          .go();

  @override
  Future<void> updateSettings(model.Setting item) =>
      database.update(database.settings).replace(SettingsMapper.toEntity(item));
}

import 'package:colposcopy/data/datasources/drift/database/database.dart';
import 'package:colposcopy/domain/models/setting/setting.dart' as model;

class SettingsMapper {
  static model.Setting toModel(Setting entity) => model.Setting(
        settingId: entity.settingId,
        userId: entity.userId,
        param: entity.param,
        value: entity.value,
      );

  static Setting toEntity(model.Setting model) => Setting(
        settingId: model.settingId,
        userId: model.userId,
        param: model.param,
        value: model.value,
      );

  static List<model.Setting> toModelList(List<Setting> entities) =>
      entities.map(toModel).toList();
}

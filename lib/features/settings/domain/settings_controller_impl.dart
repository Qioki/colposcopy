import 'dart:async';

import 'package:colposcopy/core/utils/file_paths.dart';
import 'package:colposcopy/core/utils/file_helper.dart';
import 'package:colposcopy/domain/controllers/settings_controller.dart';
import 'package:colposcopy/domain/models/app_settings/app_settings.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: SettingsController)
class SettingsControllerImpl extends SettingsController {
  // late ILoggingService _logger;
  // late Map<String, BehaviorSubject<String>> _paramSubjects = {};

  @override
  AppSettings get settings => _settings;
  // TODO default factory. fix: AppPaths.pathToDb create file
  AppSettings _settings = const AppSettings(databasePath: '');
  // final _logger = locator<Logger>();
  final Logger _logger;

  SettingsControllerImpl(this._logger);
  // {
  //   init();
  // }

  // @PostConstruct()
  @override
  Future<void> init() async {
    await loadSettings();

    try {
      // TODO throw exception if not exists
      FilePaths.pathToDb = settings.databasePath;
      print(FilePaths.pathToDbFolder);
      // AppPaths.pathToDbFolder =
      //     File(settings.databasePath).parent?.absolute.path ?? '';
    } catch (e) {
      _logger.e(e);
    }
  }

  Future<void> loadSettings() async {
    try {
      var json = await FileHelper.readJsonFile(FilePaths.pathToSettingsJson);
      var s = AppSettings.fromJson(json);
      _settings = s;
      print(_settings.databasePath);

      // settings = settings.copyWith(databasePath: AppPaths.pathToDb);
    } catch (e) {
      _logger.e(e);
    }

    if (_settings.databasePath.isEmpty) {
      _settings = _settings.copyWith(databasePath: FilePaths.pathToDb);
      save();
    }
  }

  @override
  void save() {
    //   _logger.info();
    //   // _dbAdapter.AddOrUpdate(settings);
    try {
      FileHelper.writeJsonFile(
          FilePaths.pathToSettingsJson, _settings.toJson());
      // JsonHelper.serializeObjectToFile(settings, AppPaths.pathToSettingsJson);
    } catch (e) {
      _logger.e(e);
    }
  }

  // static Future<List<Map>> readJsonFile(String filePath) async {
  //   try {

  //   var input = await File(filePath).readAsString();
  // var map = jsonDecode(input);
  // return map['users'];
  //   } catch (e) {

  //   }
  // }

//   Future<void> readJson(String path) async {
//     final String response = await rootBundle.loadString(path);
//     final data = await json.decode(response);
// // ...
//   }
  // void subscribeParam(String key, Function(String) onNext) {
  //   if (!_paramSubjects.containsKey(key)) {
  //     _paramSubjects[key] = BehaviorSubject<String>.seeded(null);
  //   }
  //   _paramSubjects[key]?.stream.listen(onNext);
  // }

  // void paramChanged(String key, String value) {
  //   if (_paramSubjects.containsKey(key)) {
  //     _paramSubjects[key]?.add(value);
  //   }
  // }

  // SettingsParams makeDefaultSettings() =>
  //     SettingsParams(databasePath: AppPaths.defaultPathToDb);
}

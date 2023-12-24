import 'package:colposcopy/domain/models/app_settings/app_settings.dart';

abstract class SettingsController {
  AppSettings get settings;
  Future<void> init();
  void save();
}

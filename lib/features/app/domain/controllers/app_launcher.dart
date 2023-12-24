import 'package:colposcopy/domain/controllers/settings_controller.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LaunchController)
class AppLauncherImpl extends LaunchController {
  AppLauncherImpl(this.settingsController);

  final SettingsController settingsController;

  @PostConstruct(preResolve: true)
  @override
  Future<void> onAppStart() async {
    // await loadSettings();
    await settingsController.init();
  }

  // Future<void> loadSettings() async {
  //   settingsController.init();
  // }

  void onAppClose() {
    // TODO: implement onAppClose
  }
}

abstract class LaunchController {
  void onAppStart();
}

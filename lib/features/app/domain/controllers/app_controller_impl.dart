import 'package:colposcopy/domain/controllers/settings_controller.dart';
import 'package:colposcopy/domain/models/app_session/app_session.dart';
import 'package:colposcopy/domain/models/user/user.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AppController)
class AppControllerImpl extends AppController {
  AppControllerImpl(this.settingsController);

  final SettingsController settingsController;

  AppSession appSession = const AppSession.initial();

  @override
  void onLogin(User user) {
    print('successful login');
    appSession = AppSession.loggedIn(currentUser: user);
  }

  @override
  void onLogout() {}
}

abstract class AppController {
  void onLogin(User user);

  void onLogout();
}

import 'package:colposcopy/domain/controllers/settings_controller.dart';
import 'package:colposcopy/domain/models/app_session/app_session.dart';
import 'package:colposcopy/domain/models/user/user.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AppController)
class AppControllerImpl extends AppController {
  AppControllerImpl(this.settingsController);

  final SettingsController settingsController;

  @override
  AppSession get appSession => _appSession;
  AppSession _appSession = const AppSession.inactive();

  @override
  void onLogin(User user) {
    print('successful login');
    _appSession = AppSession.active(currentUser: user);
  }

  @override
  void onLogout() {
    _appSession = const AppSession.inactive();
  }
}

abstract class AppController {
  void onLogin(User user);

  void onLogout();

  AppSession get appSession;
}

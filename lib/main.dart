import 'dart:io';

import 'package:colposcopy/core/constants/strings.dart';
import 'package:colposcopy/di/locator.dart';
import 'package:colposcopy/features/app/domain/controllers/app_launcher.dart';
import 'package:colposcopy/presentation/app.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  if (Platform.isWindows) {
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      minimumSize: Size(1200, 800),
      // center: true,
      backgroundColor: Colors.white,
      titleBarStyle: TitleBarStyle.normal,
      title: Strings.appName,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  locator<LaunchController>();

  runApp(const AppRoot());
}

// import 'dart:async';
import 'dart:io';

// import 'package:camera_windows/camera_service.dart';
// import 'package:camera_base/camera_base.dart';
import 'package:colposcopy/core/constants/string.dart';
import 'package:colposcopy/di/locator.dart';
import 'package:colposcopy/domain/models/form_item_data/form_item_data.dart';
import 'package:colposcopy/domain/models/patient/patient.dart';
import 'package:colposcopy/domain/models/protocol/protocol.dart';
import 'package:colposcopy/domain/models/visit/visit.dart';
import 'package:colposcopy/domain/repositories/patients.dart';
import 'package:colposcopy/domain/repositories/users.dart';
import 'package:colposcopy/domain/repositories/visits.dart';
import 'package:colposcopy/features/app/domain/controllers/app_launcher.dart';
import 'package:colposcopy/presentation/app.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  // Wakelock.enable();
  // MediaKit.ensureInitialized();

  if (Platform.isWindows) {
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      minimumSize: Size(800, 600),
      // size: Size.infinite, //(1400, 800),
      // center: true,
      backgroundColor: Colors.white,

      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.normal,
      title: Strings.appName,
      windowButtonVisibility: true,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  locator<LaunchController>();

  runApp(const AppRoot());

  test();
}

void test() {
  // var repo = await locator<PatientsRepository>();
  // for (var i = 0; i < 30; i++) {
  //   await repo.addPatient(Patient(
  //     userId: -1,
  //     state: 1,
  //     patientId: i,
  //     firstname: 'other $i',
  //     lastname: 'other $i',
  //     birthdate: DateTime.now().subtract(const Duration(days: 365 * 5)),
  //     phone: 'some phone',
  //     email: 'some email',
  //     card: '{}',
  //   ));
  // }
  // await locator<UsersRepository>().getUserById(99);
  // await locator<VisitsRepository>().addVisit(Visit(
  //     visitId: -4,
  //     userId: 1,
  //     patientId: 1,
  //     protocolId: 1,
  //     visitDate: DateTime.now(),
  //     protocolData: '{}'));
}

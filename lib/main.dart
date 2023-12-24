// import 'dart:async';
import 'dart:io';

// import 'package:camera_windows/camera_service.dart';
// import 'package:camera_base/camera_base.dart';
import 'package:colposcopy/core/constants/string.dart';
import 'package:colposcopy/di/locator.dart';
import 'package:colposcopy/domain/models/protocol/protocol.dart';
import 'package:colposcopy/domain/models/visit/visit.dart';
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

  // if (Platform.isWindows) {
  //   await windowManager.ensureInitialized();

  //   WindowOptions windowOptions = const WindowOptions(
  //     minimumSize: Size(800, 700),
  //     size: Size(1400, 800),
  //     center: true,
  //     backgroundColor: Colors.transparent,
  //     // skipTaskbar: false,
  //     titleBarStyle: TitleBarStyle.normal,
  //     title: Strings.appName,
  //     windowButtonVisibility: true,
  //   );
  //   windowManager.waitUntilReadyToShow(windowOptions, () async {
  //     await windowManager.show();
  //     await windowManager.focus();
  //   });
  // }

  locator<LaunchController>();

  runApp(const AppRoot());

  // await locator<UsersRepository>().getUserById(99);
  // await locator<VisitsRepository>().addVisit(Visit(
  //     visitId: -4,
  //     userId: 1,
  //     patientId: 1,
  //     protocolId: 1,
  //     visitDate: DateTime.now(),
  //     protocolData: '{}'));
}

// class MyTestApp extends StatefulWidget {
//   const MyTestApp({super.key});

//   @override
//   State<MyTestApp> createState() => _MyTestAppState();
// }

// CameraService cameraService = CameraMfService();

// class _MyTestAppState extends State<MyTestApp> {
//   @override
//   void initState() {
//     super.initState();
//     testInit();
//   }

//   int cameraId = -1;
//   late List<CameraFormat> formats;

//   void testInit() async {
//     try {
//       // cameraService = CameraMfService();
//       var cameras = await cameraService.availableCameras();
//       cameraId = await cameraService.selectCamera(cameras[0]);
//       formats = await cameraService.enumerateFormats();
//       var formatIndex = 19;
//       print(
//           'format: ${formats[formatIndex].width} ${formats[formatIndex].height} ${formats[formatIndex].framerate}');

//       final Future<CameraInitializedEvent> initialized =
//           cameraService.onCameraEvent<CameraInitializedEvent>(cameraId).first;

//       await cameraService.initCamera(cameraId, formats[formatIndex]);

//       final CameraInitializedEvent event = await initialized;
//       print(
//           'previewWidth: ${event.previewWidth} previewHeight: ${event.previewHeight}');
//       // var _previewSize = Size(
//       //   event.previewWidth,
//       //   event.previewHeight,
//       // );
//       setState(() {});
//     } on CameraException catch (e) {
//       try {
//         if (cameraId >= 0) {
//           await cameraService.dispose();
//         }
//       } on CameraException catch (e) {
//         debugPrint('Failed to dispose camera: ${e.code}: ${e.description}');
//       }
//     }
//   }

//   Future<void> _disposeCurrentCamera() async {
//     // if (_cameraId >= 0 && _initialized) {
//     // if (_initialized) {
//     try {
//       await cameraService.dispose();
//       // cameraId = -1;

//       if (mounted) {
//         setState(() {
//           // _initialized = false;
//           // _previewSize = null;
//           // _recording = false;
//           // _recordingTimed = false;
//           // _previewPaused = false;
//           // _cameraInfo = 'Camera disposed';
//         });
//       }
//     } on CameraException catch (e) {
//       if (mounted) {
//         setState(() {
//           print('object');
//           // _cameraInfo =
//           //     'Failed to dispose camera: ${e.code}: ${e.description}';
//         });
//       }
//     }
//     // }
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     cameraService.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Stack(
//           children: [
//             cameraService.cameraPreview,
//             Row(
//               children: [
//                 ElevatedButton(
//                   onPressed: () async {
//                     await _disposeCurrentCamera();
//                     print('dispose');

//                     setState(() {});
//                   },
//                   child: Text('data'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () async {
//                     var cameras = await cameraService.availableCameras();
//                     cameraId = await cameraService.selectCamera(cameras[0]);
//                     formats = await cameraService.enumerateFormats();
//                     var formatIndex = 0;
//                     // cameraId = await cameraService.selectCamera(cameras[0]);
//                     print(
//                         'format: ${formats[formatIndex].width} ${formats[formatIndex].height} ${formats[formatIndex].framerate}');

//                     final Future<CameraInitializedEvent> initialized =
//                         cameraService
//                             .onCameraEvent<CameraInitializedEvent>(cameraId)
//                             .first;

//                     await cameraService.initCamera(
//                         cameraId, formats[formatIndex]);

//                     final CameraInitializedEvent event = await initialized;
//                     print(
//                         'previewWidth: ${event.previewWidth} previewHeight: ${event.previewHeight}');

//                     setState(() {});
//                   },
//                   child: Text('data'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

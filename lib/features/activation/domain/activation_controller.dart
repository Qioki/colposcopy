// import 'dart:io';

// import 'package:colposcopy/core/constants/string.dart';
// import 'package:colposcopy/core/utils/file_paths.dart';
// import 'package:colposcopy/features/activation/domain/pc_protection.dart';
// import 'package:logger/logger.dart';

// class ActivationController {
//   ActivationController({required this.logger});

//   // Guard() {
//   //   // _logger.i();

//   //   _dbAdapter = ServiceLocator.Get<IDbAdapter>();

//   //   trialDateStart = DateTime.fromMillisecondsSinceEpoch(0);
//   //   activationState = ActivationState.notActivated;

//   //   checkActivation();
//   // }
 
//   final Logger logger;// = localor<Guard>();

//   // final UsbProtection _usbProtection = UsbProtection();
//   final PcProtection _pcProtection = PcProtection();
//   // final IDbAdapter _dbAdapter;

//   bool isActivated = false;
//   bool canLogin = false;

//   String statusText = '';
//   String codeRequest = '';

//   DateTime trialDateStart = DateTime.now();
//   bool trialPeriodEnded = false;
//   bool canActivateTrial = false;

//   ActivationState activationState = ActivationState.notActivated;


//   void onActivationStateChanged() {
//     // _logger.i('${activationState}');
//     switch (activationState) {
//       case ActivationState.notActivated:
//         statusText = Strings.activationOff;
//         isActivated = false;
//         canLogin = false;
//         break;
//       case ActivationState.activated:
//         statusText = Strings.activationOn;
//         isActivated = true;
//         canLogin = true;
//         break;
//       case ActivationState.usbKey:
//         statusText = Strings.activationUsb;
//         isActivated = true;
//         canLogin = true;
//         break;
//       case ActivationState.trial:
//         statusText = Strings.activationTrial;
//         isActivated = false;
//         canLogin = true;
//         break;
//     }
//   }

//   void checkActivation() {
//     if (checkUsbKey()) return;
//     if (checkActivationKey()) return;
//     if (codeRequest.isEmpty) generateRequestCode();
//     if (checkTrial()) return;
//     // TestActivation();
//   }

//   bool checkUsbKey() {
//     // _logger.i();
//     try {
//       var deviceInfo = _usbProtection.findUsbKey();
//       activationState = deviceInfo != null
//           ? ActivationState.usbKey
//           : ActivationState.notActivated;
//     } catch (e) {
//       logger.e(e);
//     }
//     return isActivated;
//   }

//   bool checkActivationKey() {
//     // _logger.i();
//     try {
//       var result =
//           _pcProtection.checkActivationData(FilePaths.pathToTrialLicenseFile);
//       activationState =
//           result ? ActivationState.activated : ActivationState.notActivated;
//       logger.i('${result}');
//       return result;
//     } catch (e) {
//       logger.e(e);
//     }
//     return isActivated;
//   }

//   bool checkTrial() {
//     // _logger.i();
//     try {
//       var dbTrialSettings = _dbAdapter.getSettings().firstWhere(
//           (s) => s.key == ConstantsBase.trialDate,
//           orElse: () => null);

//       if (dbTrialSettings != null) {
//         canActivateTrial = false;
//         return !checkTrialPeriodEnded(dbTrialSettings.value);
//       }

//       var fi = getTrialLicenseFile();
//       if (!fi.existsSync()) {
//         canActivateTrial = true;
//         return false;
//       }

//       var rs = fi.openText();
//       var line = rs.readLine();
//       if (line != null && line.isNotEmpty) {
//         canActivateTrial = false;
//         return !checkTrialPeriodEnded(line);
//       } else {
//         canActivateTrial = true;
//       }
//     } catch (e) {
//       logger.e(e);
//     }

//     return false;
//   }

//   bool tryActivate(String licenseKey) {
//     // _logger.i();
//     try {
//       var result = _pcProtection.checkActivationData(codeRequest, licenseKey);

//       if (!result) logger.w('${licenseKey}');

//       if (result) _pcProtection.saveLicenseData(FilePaths.pathToLicenseFile);

//       activationState =
//           result ? ActivationState.activated : ActivationState.notActivated;

//       logger.i('${result}');
//       return result;
//     } catch (e) {
//       logger.e(e);
//     }
//     return true;
//   }

//   bool tryActivateTrial() {
//     try {
//       final dateUtc = DateTime.now().toUtc().microsecondsSinceEpoch;

//       _dbAdapter.addOrUpdate(Settings(
//         key: ConstantsBase.trialDate,
//         value: dateUtc.toString(),
//         userId: 1,
//       ));

//       final fi = getTrialLicenseFile();

//       if (fi.existsSync()) fi.deleteSync();

//       final sw = fi.openSync(mode: FileMode.write);
//       sw.writeStringSync(dateUtc.toString());
//       sw.closeSync();

//       checkTrial();

//       return true;
//     } catch (e) {
//       logger.e(e);
//     }

//     return false;
//   }

//   void generateRequestCode() {
//     codeRequest =
//         _pcProtection.generateCodeRequest(StringHelper.randomString(2));
//   }

//   File getTrialLicenseFile() {
//     final pathToSettingsFile = FilePaths.pathToTrialLicenseFile;
//     logger.i('path $pathToSettingsFile');

//     final fi = File(pathToSettingsFile);
//     if (!fi.existsSync()) {
//       fi.createSync();
//     }

//     return fi;
//   }

//   bool checkTrialPeriodEnded(String line) {
//     try {
//       final longTime = int.tryParse(line) ?? 1;

//       final date = DateTime.fromMicrosecondsSinceEpoch(longTime);
//       trialDateStart = date.toLocal();

//       logger.i('${(DateTime.now().toUtc() - trialDateStart.toUtc()).inDays}');
//       trialPeriodEnded =
//           (DateTime.now().toUtc() - trialDateStart.toUtc()).inDays > 30 ||
//               (DateTime.now().toUtc() - trialDateStart.toUtc()).inDays < 0;
//       activationState = !trialPeriodEnded
//           ? ActivationState.trial
//           : ActivationState.notActivated;

//       return trialPeriodEnded;
//     } catch (e) {
//       logger.e(e);
//     }

//     return false;
//   }
// }

// enum ActivationState {
//   notActivated,
//   activated,
//   usbKey,
//   trial,
// }

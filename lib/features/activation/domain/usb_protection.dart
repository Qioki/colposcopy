// import 'dart:io';
// import 'package:nlog/nlog.dart';

// class UsbProtection {
//   static final Logger _logger = LogManager.getCurrentClassLogger();
//   String _serialNumber;
//   String _driveLetter;
//   final List<USBDeviceInfo> usbDeviceList = [];

//   USBDeviceInfo findUsbKey() {
//     findDevices();
//     if (usbDeviceList.isEmpty) return null;
//     return usbDeviceList.firstWhere(
//       (usbDeviceInfo) => searchKey(usbDeviceInfo),
//       orElse: () => null,
//     );
//   }

//   bool searchKey(USBDeviceInfo deviceInfo) {
//     try {
//       final fi = File('${deviceInfo.device}/key');
//       if (!fi.existsSync()) return false;
//       final keyString = fi.readAsStringSync();
//       if (keyString.isEmpty) return false;
//       final txt = DataProtection.decryptUsb(keyString);
//       print('SearchKey: $txt vs ${deviceInfo.serialNumber}');
//       return txt == deviceInfo.serialNumber;
//     } catch (e) {
//       _logger.error(e);
//     }
//     return false;
//   }

//   bool createKey(USBDeviceInfo deviceInfo) {
//     try {
//       final key = DataProtection.encryptUsb(deviceInfo.serialNumber);
//       final fi = File('${deviceInfo.device}/key');
//       fi.writeAsStringSync(key);
//       return true;
//     } catch (e) {
//       _logger.error(e);
//     }
//     return false;
//   }

//   List<USBDeviceInfo> findDevices() {
//     usbDeviceList.clear();
//     for (var device in Directory.logicalDrives) {
//       try {
//         final dr = Directory(device);
//         if (dr.existsSync() && dr.statSync().type == FileSystemEntityType.directory) {
//           // USBSerial usb = new USBSerial();
//           final serial = getSerialNumberFromDriveLetter(device.substring(0, 2));
//           usbDeviceList.add(USBDeviceInfo(
//             device: device.substring(0, 2),
//             name: dr.path,
//             serialNumber: serial,
//           ));
//           print('restoreUSBS $device ${dr.path} $serial');
//         }
//       } catch (e) {
//         _logger.error(e);
//       }
//     }
//     return usbDeviceList;
//   }

//   String getSerialNumberFromDriveLetter(String driveLetter) {
//     try {
//       _driveLetter = driveLetter.toUpperCase();
//       if (!_driveLetter.contains(':')) _driveLetter += ':';
//       matchDriveLetterWithSerial();
//     } catch (e) {
//       _logger.error(e);
//     }
//     return _serialNumber;
//   }

//   void matchDriveLetterWithSerial() {
//     final searcher1 = FileStat('SELECT * FROM Win32_LogicalDiskToPartition');
//     for (var managementBaseObject in searcher1.get()) {
//       final dm = managementBaseObject as ManagementObject;
//       var diskArray = <String>[];
//       var driveLetter = getValueInQuotes(dm['Dependent'].toString());
//       diskArray = getValueInQuotes(dm['Antecedent'].toString()).split(',');
//       var driveNumber = diskArray[0].substring(6).trim();
//       if (driveLetter == _driveLetter) {
//         final disks = FileStat('SELECT * FROM Win32_DiskDrive');
//         for (var o in disks.get()) {
//           final disk = o as ManagementObject;
//           if (disk['Name'].toString() == '\\\\.PHYSICALDRIVE$driveNumber' &&
//               disk['InterfaceType'].toString() == 'USB') {
//             _serialNumber = parseSerialFromDeviceID(disk['PNPDeviceID'].toString());
//           }
//         }
//       }
//     }
//   }

//   String parseSerialFromDeviceID(String deviceId) {
//     final splitDeviceId = deviceId.split('\\');
//     var serialArray = <String>[];
//     var serial = '';
//     var arrayLen = splitDeviceId.length - 1;
//     serialArray =
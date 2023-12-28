import 'dart:io';
import 'package:colposcopy/core/utils/file_helper.dart';
import 'package:path/path.dart';

class FileNamesConstants {
  static const String resourcesFolderName = 'Resources';
  static const String assetsFolderName = 'assets';
  static const String assetsJsonsFolderName = 'jsons';
  static const String atlasFolderName = 'Atlas';
  static const String cacheFolderName = 'Cache';
  // static const String cacheFolderName = 'Atlas';
  static const String settingsJsonName = 'settings.json';
  static const String databaseFileName = "colposcopy.db";
  static const String databaseFolderName = "Database";
  static const String videoFolderName = "Video";
  static const String trialLicenseFileName = "tlic";
  static const String licenseFileName = "lic";
  static const String logsFileName = "logs.txt";
  static const String defaultSettingsFileName = "default_settings.json";
  static const String protocolFileName = "protocol.json";
  static const String patientCardFileName = "patient_card.json";
  static const String atlasFileName = "atlas.json";
  static const String atlasZipFileName = "atlas.zip";
}

class ConstantsBase {
  static final String manufacturer = 'ZMir';
  static final String appName = 'Colposcopy';
}

class FilePaths {
  static String get pathToResourcesFolder => FileHelper.checkFolder(
      join(Directory.current.path, FileNamesConstants.resourcesFolderName));

  static String get pathToJsonsFolder => join(
      FileNamesConstants.assetsFolderName,
      FileNamesConstants.assetsJsonsFolderName);

  static String get pathToAppDataFolder => FileHelper.checkFolder(join(
      Directory.systemTemp.path,
      ConstantsBase.manufacturer,
      ConstantsBase.appName));

  static String get pathToCacheFolder => FileHelper.checkFolder(
      join(pathToAppDataFolder, FileNamesConstants.cacheFolderName));

  static String get pathToAtlasFolder =>
      join(pathToResourcesFolder, FileNamesConstants.atlasFolderName);

  static String get pathToLogs =>
      join(pathToResourcesFolder, FileNamesConstants.logsFileName);

  static String get pathToSettingsJson => FileHelper.checkJsonFile(
      join(pathToResourcesFolder, FileNamesConstants.settingsJsonName));

  static String get pathToDefaultProtocolJson =>
      join(pathToJsonsFolder, FileNamesConstants.protocolFileName);

  static String get pathToDefaultPatientCardJson =>
      join(pathToJsonsFolder, FileNamesConstants.patientCardFileName);

  static String get pathToAtlasJson => FileHelper.checkJsonFile(
      join(pathToResourcesFolder, FileNamesConstants.atlasFileName));

  static String get pathToTrialLicenseFile =>
      join(pathToAppDataFolder, FileNamesConstants.trialLicenseFileName);

  static String get pathToLicenseFile =>
      join(pathToAppDataFolder, FileNamesConstants.licenseFileName);

  static String get pathToDbFolder {
    return File(pathToDb).parent.absolute.path;
    // return join(Directory.current.path, FileConstants.databaseFolderName);
  }

  /*
  

Directory directory = await getApplicationDocumentsDirectory();
var dbPath = join(directory.path, "app.txt");
ByteData data = await rootBundle.load("assets/demo.txt");
List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
await File(dbPath).writeAsBytes(bytes);
  */
  static Future<String> loadDefaultProtocol() async {
    return FileHelper.loadStringFromAssetsFile(pathToDefaultProtocolJson);
  }

  static String get pathToDb {
    if (_pathToDb.isEmpty) {
      _pathToDb = join(
          Directory.current.path,
          FileNamesConstants.databaseFolderName,
          FileNamesConstants.databaseFileName);
    }
    FileHelper.checkDbFile(_pathToDb);
    return _pathToDb;
  }

  static set pathToDb(String value) {
    FileHelper.checkDbFile(value);
    _pathToDb = value;
  }

  static String _pathToDb = '';

  // static String checkFolder(String pathToFolder) {
  //   try {
  //     createIfNotExistsDirectory(Directory(pathToFolder));
  //   } catch (e) {
  //     print(e);
  //   }
  //   return pathToFolder;
  // }

  // static String checkJsonFile(String path) {
  //   try {
  //     if (!File(path).existsSync()) {
  //       createIfNotExistsPathToFile(path);
  //       File(path).writeAsStringSync('{}');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  //   return path;
  // }

  // static String checkDbFile(String path) {
  //   try {
  //     if (!File(path).existsSync()) {
  //       createIfNotExistsPathToFile(path);
  //     }
  //     // if (!FileService.pathToDb.exists) {
  //     //   createIfNotExistsPathToFile(FileService.pathToDb.path);
  //     //   FileService.pathToDb.createSync();
  //     // }
  //   } catch (e) {
  //     print(e);
  //   }
  //   return path;
  //   // return FileController.pathToDb;
  // }

  // static File copyFileToDirectory(String srcPath, String desPathDirectory) {
  //   try {
  //     File src = File(srcPath);
  //     bool dirEx = createIfNotExistsDirectory(desPathDirectory);
  //     if (!dirEx || !src.existsSync()) return null;

  //     String fileName = basenameWithoutExtension(srcPath);
  //     String extension = extension(srcPath);
  //     int i = 1;

  //     File des = File(join(desPathDirectory, src.path.split('/').last));
  //     while (des.existsSync()) {
  //       des = File(join(desPathDirectory, '${fileName} (${i++})${extension}'));
  //       print('CopyFileToDirectory ${des.path}');
  //     }

  //     print('CopyFileToDirectory ${des.path}');
  //     File f = src.copySync(des.path);
  //     return f;
  //   } catch (e) {
  //     print(e);
  //   }
  //   return null;
  // }

  // static void createIfNotExistsPathToFile(String pathToFile) {
  //   File fi = File(pathToFile);
  //   if (fi.existsSync()) return;

  //   createIfNotExistsDirectory(fi.parent);
  //   // createIfNotExistsDirectory(fi.parent.path);
  // }

  // // static bool createIfNotExistsDirectory(String path) {
  // static bool createIfNotExistsDirectory(Directory di) {
  //   //   return createIfNotExistsDirectory(Directory(path));
  //   // }

  //   // static bool createIfNotExistsDirectory(Directory di) {
  //   // var di = Directory(path);
  //   try {
  //     if (!di.existsSync()) {
  //       print('${di.parent} not exists');
  //       // if (di.parent == null) return false;
  //       createIfNotExistsDirectory(di.parent);
  //       // createIfNotExistsDirectory(di.parent.path);
  //       di.createSync();
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  //   return di.existsSync();
  // }

  // static bool unZip(String zipFile, String folderPath) {
  //   if (!File(zipFile).existsSync()) return false;

  //   createIfNotExistsDirectory(folderPath);

  //   try {
  //     ZipDecoder().decodeBytes(File(zipFile).readAsBytesSync(),
  //         to: Directory(folderPath));
  //     return true;
  //   } catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }
}

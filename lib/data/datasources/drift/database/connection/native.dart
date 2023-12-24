import 'dart:io';

import 'package:colposcopy/core/utils/file_paths.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';

File get databaseFile {
  final dbFile = File(FilePaths.pathToDb);
  print('path: ${dbFile.path}');
  if (!dbFile.existsSync()) {
    dbFile.createSync(recursive: true);
  }
  return dbFile;
}

DatabaseConnection connect() =>
    DatabaseConnection(NativeDatabase.createBackgroundConnection(databaseFile));

// Future<File> get databaseFileDelayed async {
// var dbFolder = await getApplicationDocumentsDirectory();
// final dbFile = File(p.join(dbFolder.path, 'colposcopy3.db'));
//   print('path: ${dbFile.path}');
//   if (!dbFile.existsSync()) {
//     dbFile.createSync(recursive: true);
//   }
//   return dbFile;
// }
// DatabaseConnection connectDelayed() => DatabaseConnection.delayed(
//     databaseFileDelayed.then(NativeDatabase.createBackgroundConnection));

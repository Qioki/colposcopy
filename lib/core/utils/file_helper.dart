import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';

class FileHelper {
  FileHelper._();

  static Future<Map<String, dynamic>> readJsonFile(String filePath) async {
    try {
      var input = await File(filePath).readAsString();
      // print(input);
      return json.decode(input);
    } catch (e) {
      print(e);
      return {};
    }
  }

  static void writeJsonFile(String filePath, Map<String, dynamic> json) {
    File(filePath).writeAsStringSync(jsonEncode(json));
  }

  static String checkFolder(String pathToFolder) {
    print(pathToFolder);
    try {
      createIfNotExistsDirectory(Directory(pathToFolder));
    } catch (e) {
      print(e);
    }
    return pathToFolder;
  }

  static String checkJsonFile(String path) {
    try {
      if (!File(path).existsSync()) {
        createIfNotExistsPathToFile(path);
        File(path).writeAsStringSync('{}');
      }
    } catch (e) {
      print(e);
    }
    return path;
  }

  static String checkDbFile(String path) {
    try {
      if (!File(path).existsSync()) {
        createIfNotExistsPathToFile(path);
      }
      // if (!FileService.pathToDb.exists) {
      //   createIfNotExistsPathToFile(FileService.pathToDb.path);
      //   FileService.pathToDb.createSync();
      // }
    } catch (e) {
      print(e);
    }
    return path;
  }

  static void createIfNotExistsPathToFile(String pathToFile) {
    File fi = File(pathToFile);
    if (fi.existsSync()) return;

    createIfNotExistsDirectory(fi.parent);
  }

  static bool createIfNotExistsDirectory(Directory di) {
    try {
      if (!di.existsSync()) {
        print('${di.path} not exists');
        // createIfNotExistsDirectory(di.parent);
        di.createSync(recursive: true);
      }
    } catch (e) {
      print(e);
    }
    return di.existsSync();
  }

  static Future<String> loadStringFromAssetsFile(String path) async {
    try {
      return rootBundle.loadString(path);
    } catch (e) {
      print(e);
    }
    return '{}';
  }
}

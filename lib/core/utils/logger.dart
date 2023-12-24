// abstract class LoggerService {}
import 'dart:io';

import 'package:colposcopy/core/utils/file_paths.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: Logger)
class AppLogger extends Logger {
  AppLogger({super.printer, super.output});

//   late final void Function(String message) log;
//   final _logger = Logger(
//     printer: PrettyPrinter(
//       errorMethodCount: 3,
//       lineLength: 2,
//       colors: false,
//       printTime: true,
//       // noBoxingByDefault: true,
//     ),
//   );
//   // final _logger = Logger(output: FileOutput(), printer: SimplePrinter());
//   AppLogger() {
//     log = _logger.w;
//   }

//   void log2(String msg) => log(msg);
  @factoryMethod
  factory AppLogger.debugLogger() => AppLogger(
        printer: PrettyPrinter(
          errorMethodCount: 3,
          lineLength: 2,
          colors: false,
          printTime: true,
        ),
      );

  // @factoryMethod
  factory AppLogger.fileLogger() => AppLogger(
        printer: PrettyPrinter(
          errorMethodCount: 3,
          lineLength: 2,
          colors: false,
          printTime: true,
          // noBoxingByDefault: true,
        ),
        output: FileOutput(),
      );
}

// TODO edit. async file writing, hide, add level
// @LazySingleton(as: Logger)
AppLogger get logger => AppLogger(
      printer: PrettyPrinter(
        errorMethodCount: 3,
        lineLength: 2,
        colors: false,
        printTime: true,
      ),
    );

AppLogger get fileLogger => AppLogger(
      printer: PrettyPrinter(
        errorMethodCount: 3,
        lineLength: 2,
        colors: false,
        printTime: true,
        // noBoxingByDefault: true,
      ),
      output: FileOutput(),
    );

class FileOutput extends LogOutput {
  FileOutput();

  late File file;

  @override
  Future<void> init() async {
    super.init();
    file = File(FilePaths.pathToLogs);
    if (!file.existsSync()) {
      await file.create();
    }
    // print(AppPaths.pathToLogs);
  }

  @override
  void output(OutputEvent event) async {
    print(event.level);
    if (file.existsSync()) {
      for (var line in event.lines) {
        print(line);
        await file.writeAsString("${line.toString()}\n",
            mode: FileMode.writeOnlyAppend);
      }
    }
  }
}

class ConsoleOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    for (var line in event.lines) {
      print(line);
    }
  }
}

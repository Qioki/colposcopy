import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primary = Color.fromARGB(255, 105, 153, 220);
  static const Color primaryLight = Color.fromARGB(255, 242, 245, 249);
  // static const Color primaryLight = Color.fromARGB(255, 245, 249, 255);
  // static const Color primaryLight = Color.fromARGB(255, 240, 245, 252);
  static const Color test = Color.fromARGB(255, 82, 255, 151);
  static const Color onErrorAccent = Color.fromARGB(255, 238, 85, 95);
}

class AppTheme {
  static ThemeData light = _buildTheme(Brightness.light);

  static ThemeData _buildTheme(Brightness brightness) {
    var baseTheme = ThemeData(brightness: brightness);

    return baseTheme.copyWith(
      // textTheme: GoogleFonts.latoTextTheme(),
      textTheme: GoogleFonts.robotoTextTheme(baseTheme.textTheme).copyWith(
          // bodyMedium: GoogleFonts.roboto(textStyle: baseTheme.textTheme.bodyMedium),
          ),
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        onError: AppColors.onErrorAccent,
        outline: AppColors.primary,
      ),
      disabledColor: Colors.red,
      primaryTextTheme: Typography.whiteCupertino,
      primaryColor: AppColors.primary,
      expansionTileTheme:
          const ExpansionTileThemeData(shape: RoundedRectangleBorder()),
      inputDecorationTheme: const InputDecorationTheme(
        helperMaxLines: 1,
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        constraints: BoxConstraints(maxHeight: 65, maxWidth: 300),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(color: AppColors.primary, width: 0.35),
        ),
        // focusedBorder: OutlineInputBorder(
        //   borderSide:
        //       BorderSide(width: 3, color: Colors.greenAccent), //<-- SEE HERE
        //   // borderRadius: BorderRadius.circular(25),
        // ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        // filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            borderSide: BorderSide(
              width: 1.5,
              color: AppColors.primary,
            )),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              // shape: const StadiumBorder(),
              elevation: 1,
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 14,
              ),
              textStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ))),
      dataTableTheme: DataTableThemeData(
        dataRowMaxHeight: 35,
        dataRowMinHeight: 32,
        // dataRowColor: MaterialStateProperty.all(
        //   Colors.transparent,
        // ),
        headingRowColor:
            MaterialStateColor.resolveWith((states) => AppColors.primary),
        horizontalMargin: 12,
        columnSpacing: 4,
        headingRowHeight: 32,
        dividerThickness: 0,
        headingTextStyle: const TextStyle(color: Colors.white),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
              strokeAlign: BorderSide.strokeAlignOutside,
              color: AppColors.primary),
        ),
      ),
      // textButtonTheme: TextButtonThemeData(
      //   style: TextButton.styleFrom(
      //     // primary: Colors.white,
      //     padding: const EdgeInsets.all(10),
      //     fixedSize: const Size(100, 40),
      //     backgroundColor: Colors.blueGrey,
      //     textStyle: const TextStyle(fontSize: 16),
      //   ),
      // ),
    );
  }
}

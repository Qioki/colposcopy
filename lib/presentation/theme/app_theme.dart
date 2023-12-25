import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primary = Color.fromARGB(255, 105, 153, 220);
  static const Color test = Color.fromARGB(255, 82, 255, 151);
  static const Color onErrorAccent = Color.fromARGB(255, 238, 85, 95);
}

class AppTheme {
  static ThemeData light = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      // secondary: AppColors.test,
      // onSecondary: AppColors.test,
      // onPrimary: AppColors.test,
      // onPrimaryContainer: AppColors.test,
      // onSurface: AppColors.test,
      // surface: AppColors.test,
      // background: AppColors.test,
      // onBackground: AppColors.test,
      onError: AppColors.onErrorAccent,
      // error: AppColors.test,
      // onErrorContainer: AppColors.test,
      // onSurfaceVariant: AppColors.test,
      // onSecondaryContainer: AppColors.test,
      outline: AppColors.primary,
      // outlineVariant: AppColors.test,
      // shadow: AppColors.test,
      // onInverseSurface: AppColors.test,
    ),
    // brightness: Brightness.light,
    // textButtonTheme: TextButtonThemeData(
    //   style: TextButton.styleFrom(
    //     // primary: Colors.white,
    //     padding: const EdgeInsets.all(10),
    //     fixedSize: const Size(100, 40),
    //     backgroundColor: Colors.blueGrey,
    //     textStyle: const TextStyle(fontSize: 16),
    //   ),
    // ),
    // scaffoldBackgroundColor: AppColor.border,
    // backgroundColor: AppColor.border,
    primaryColor: AppColors.primary,
    useMaterial3: true,
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
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
              strokeAlign: BorderSide.strokeAlignOutside,
              color: AppColors.primary)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      // focusedBorder: OutlineInputBorder(
      //   borderSide:
      //       BorderSide(width: 3, color: Colors.greenAccent), //<-- SEE HERE
      //   // borderRadius: BorderRadius.circular(25),
      // ),
    ),
    // fontFamily: appFont,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            // shape: const StadiumBorder(),
            elevation: 1,
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 15,
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ))),
    textTheme: GoogleFonts.latoTextTheme(),
  );
}

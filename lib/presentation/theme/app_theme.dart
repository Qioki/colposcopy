import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primary = Color.fromARGB(255, 105, 153, 220);
  static const Color primaryLight = Color.fromARGB(255, 245, 249, 255);
  // static const Color primaryLight = Color.fromARGB(255, 240, 245, 252);
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
      // onSurface: Colors.red,
      // surface: Colors.red,
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
      // onTertiary: AppColors.test,
      // onTertiaryContainer: AppColors.test,
      // tertiary: AppColors.test,
      // tertiaryContainer: AppColors.test,
      // scrim: AppColors.primary,
      // inversePrimary: AppColors.test,
      // inverseSurface: AppColors.test,
    ),
    disabledColor: Colors.red,
    primaryTextTheme: Typography.whiteCupertino,
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
    expansionTileTheme:
        const ExpansionTileThemeData(shape: RoundedRectangleBorder()),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle:
          TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
      hintStyle:
          TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
      helperStyle:
          TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
      prefixStyle:
          TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
      suffixStyle:
          TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
      counterStyle:
          TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          borderSide: BorderSide(color: AppColors.primary, width: 0.35)),
      // focusedBorder: OutlineInputBorder(
      //   borderSide:
      //       BorderSide(width: 3, color: Colors.greenAccent), //<-- SEE HERE
      //   // borderRadius: BorderRadius.circular(25),
      // ),
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
              horizontal: 25,
              vertical: 15,
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ))),
    // textTheme: GoogleFonts.latoTextTheme().copyWith(),
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
    // fontFamily: appFont,
  );
}

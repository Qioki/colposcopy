import 'package:colposcopy/di/locator.dart';
import 'package:colposcopy/features/auth/presentation/cubits/auth/auth_cubit.dart';
import 'package:colposcopy/features/patients/presentation/cubits/patient_visits/patient_visits_cubit.dart';
import 'package:colposcopy/features/patients/presentation/cubits/patients/patients_cubit.dart';
import 'package:colposcopy/presentation/routes/app_router.dart';
// import 'package:colposcopy/presentation/theme/app_theme.dart';
import 'package:colposcopy/core/constants/string.dart';
import 'package:colposcopy/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: AppTheme.light,
      routerConfig: AppRouter.router,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => locator<AuthCubit>(),
            ),
            BlocProvider(
              create: (context) => locator<PatientsCubit>(),
            ),
            BlocProvider(
              create: (context) => locator<PatientVisitsCubit>(),
            ),
            // BlocProvider(
            //   create: (context) => PatientCubit(),
            // )
          ],
          child: child!,
        );
      },
      supportedLocales: [
        Locale('ru'),
      ],
    );
  }
}
// import 'package:colposcopy/presentation/app_router.dart';
// import 'package:colposcopy/presentation/theme/app_theme.dart';
// import 'package:colposcopy/core/constants/string.dart';
// import 'package:fluent_ui/fluent_ui.dart';
// import 'package:flutter/material.dart' as m;
// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';

// const Color primary = Color.fromARGB(255, 105, 153, 220);

// const String appTitle = 'Win UI for Flutter';

// class AppRoot extends StatelessWidget {
//   const AppRoot({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final appTheme = AppTheme();
//     return FluentApp.router(
//       title: appTitle,
//       themeMode: appTheme.mode,
//       debugShowCheckedModeBanner: false,
//       color: appTheme.color,
//       darkTheme: FluentThemeData(
//         brightness: Brightness.dark,
//         accentColor: appTheme.color,
//         visualDensity: VisualDensity.standard,
//         focusTheme: FocusThemeData(
//           glowFactor: is10footScreen(context) ? 2.0 : 0.0,
//         ),
//       ),
//       theme: FluentThemeData(
//         accentColor: appTheme.color,
//         visualDensity: VisualDensity.standard,
//         focusTheme: FocusThemeData(
//           glowFactor: is10footScreen(context) ? 2.0 : 0.0,
//         ),
//       ),
//       locale: appTheme.locale,
//       routerConfig: AppRouter.router,
//       builder: (context, child) {
//         return Directionality(
//           textDirection: appTheme.textDirection,
//           child: NavigationPaneTheme(
//             data: const NavigationPaneThemeData(
//                 backgroundColor: Colors.transparent
//                 // appTheme.windowEffect != flutter_acrylic.WindowEffect.disabled
//                 //     ? Colors.transparent
//                 //     : null,
//                 ),
//             child: child!,
//           ),
//         );
//       },
//     );
//   }
// }

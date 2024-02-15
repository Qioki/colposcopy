import 'package:colposcopy/di/locator.dart';
import 'package:colposcopy/features/auth/presentation/cubits/auth/auth_cubit.dart';
import 'package:colposcopy/features/patient/presentation/cubits/patient_card/patient_card_cubit.dart';
import 'package:colposcopy/features/patients/presentation/cubits/patient_visits/patient_visits_cubit.dart';
import 'package:colposcopy/features/patients/presentation/cubits/patients/patients_cubit.dart';
import 'package:colposcopy/features/protocol/presentation/cubits/cubit/protocol_cubit.dart';
import 'package:colposcopy/features/visit/presentation/cubits/visit/visit_cubit.dart';
import 'package:colposcopy/presentation/cubits/visit_main/visit_main_cubit.dart';
import 'package:colposcopy/presentation/routes/app_router.dart';
import 'package:colposcopy/core/constants/strings.dart';
import 'package:colposcopy/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: AppTheme.light,
      routerConfig: locator<AppRouter>().initRouter(),
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
            BlocProvider(
              create: (context) => locator<PatientCardCubit>(),
            ),
            BlocProvider(
              create: (context) => locator<PatientVisitsCubit>(),
            ),
            BlocProvider(
              create: (context) => locator<VisitCubit>(),
            ),
            BlocProvider(
              create: (context) => locator<ProtocolCubit>(),
            ),
            BlocProvider(
              create: (context) => locator<VisitMainCubit>(),
            ),
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

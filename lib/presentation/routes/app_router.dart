import 'package:colposcopy/core/constants/app_screens.dart';
import 'package:colposcopy/features/auth/presentation/forms/signup_form.dart';
import 'package:colposcopy/features/auth/presentation/screens/login_screen.dart';
import 'package:colposcopy/features/auth/presentation/screens/welcome_screen.dart';
import 'package:colposcopy/features/patient/presentation/forms/patient_card_form.dart';
import 'package:colposcopy/features/patient/presentation/screens/patient_screen.dart';
import 'package:colposcopy/features/patients/presentation/screens/patients_screen.dart';
import 'package:colposcopy/features/protocol/presentation/screens/protocol_screen.dart';
import 'package:colposcopy/presentation/screens/visit_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

part 'app_router.g.dart';

@singleton
class AppRouter {
  late GoRouter _router;
  GoRouter initRouter() {
    _router = GoRouter(
      initialLocation: Screens.patient,
      routes: $appRoutes,
      redirect: (BuildContext context, GoRouterState state) {
        return null;
      },
    );
    return _router;
  }

  static void goModal(String name, BuildContext context, {dynamic arguments}) {
    switch (name) {
      case Modals.signUp:
        showDialog(
          context: context,
          builder: (BuildContext context) => const AlertDialog(
            contentPadding: EdgeInsets.all(0),
            content: SignUpForm(),
            backgroundColor: Colors.white,
          ),
        );
        break;
      default:
    }
  }

  static Widget getProtocolScreen() => const ProtocolScreen();

  void pop(String path) => _router.pop(path);
  void go(String path) => _router.go(path);
  void push(String path) => _router.push(path);
}

@TypedStatefulShellRoute<VisitMainShellRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<PatientShellBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<PatientRoute>(path: Screens.patient),
      ],
    ),
    TypedStatefulShellBranch<ExaminationShellBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<ExaminationRoute>(path: Screens.examination),
      ],
    ),
    TypedStatefulShellBranch<ProtocolShellBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<ProtocolRoute>(path: Screens.protocol),
      ],
    ),
    TypedStatefulShellBranch<ReportShellBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<ReportRoute>(path: Screens.report),
      ],
    ),
  ],
)
class VisitMainShellRouteData extends StatefulShellRouteData {
  const VisitMainShellRouteData();

  @override
  Page<void> pageBuilder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) =>
      _getFadeTransitionPage(VisitMainScreen(navigationShell: navigationShell));
}

CustomTransitionPage _getFadeTransitionPage(Widget screen) {
  return CustomTransitionPage(
    transitionDuration: const Duration(milliseconds: 300),
    child: screen,
    transitionsBuilder: (_, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
        child: child,
      );
    },
  );
}

class PatientShellBranchData extends StatefulShellBranchData {}

class ExaminationShellBranchData extends StatefulShellBranchData {}

class ProtocolShellBranchData extends StatefulShellBranchData {}

class ReportShellBranchData extends StatefulShellBranchData {}

@TypedGoRoute<DebugRoute>(path: Screens.debug)
class DebugRoute extends GoRouteData {
  const DebugRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PatientCardForm();
  }
}

@TypedGoRoute<WelcomeRoute>(path: Screens.welcome)
class WelcomeRoute extends GoRouteData {
  const WelcomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const WelcomeScreen();
}

@TypedGoRoute<LoginRoute>(path: Screens.login)
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      _getFadeTransitionPage(const LoginScreen());
}

@TypedGoRoute<PatientsRoute>(path: Screens.patients)
class PatientsRoute extends GoRouteData {
  const PatientsRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      _getFadeTransitionPage(const PatientsScreen());
}

class PatientRoute extends GoRouteData {
  const PatientRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const PatientScreen();
}

class ExaminationRoute extends GoRouteData {
  const ExaminationRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const Text('ExaminationRoute');
}

class ProtocolRoute extends GoRouteData {
  const ProtocolRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const Text('ProtocolRoute');
}

class ReportRoute extends GoRouteData {
  const ReportRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const Text('ReportRoute');
}

@TypedGoRoute<SettingsRoute>(path: Screens.settings)
class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => Scaffold(
        appBar: AppBar(),
        body: const Text('Settings'),
      );
}

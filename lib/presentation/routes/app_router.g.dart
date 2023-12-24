// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $welcomeRoute,
      $loginRoute,
      $patientsRoute,
      $visitRoute,
      $patientRoute,
      $settingsRoute,
    ];

RouteBase get $welcomeRoute => GoRouteData.$route(
      path: '/',
      factory: $WelcomeRouteExtension._fromState,
    );

extension $WelcomeRouteExtension on WelcomeRoute {
  static WelcomeRoute _fromState(GoRouterState state) => const WelcomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginRoute => GoRouteData.$route(
      path: '/login',
      factory: $LoginRouteExtension._fromState,
    );

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  String get location => GoRouteData.$location(
        '/login',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $patientsRoute => GoRouteData.$route(
      path: '/patients',
      factory: $PatientsRouteExtension._fromState,
    );

extension $PatientsRouteExtension on PatientsRoute {
  static PatientsRoute _fromState(GoRouterState state) => const PatientsRoute();

  String get location => GoRouteData.$location(
        '/patients',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $visitRoute => GoRouteData.$route(
      path: '/visit',
      factory: $VisitRouteExtension._fromState,
    );

extension $VisitRouteExtension on VisitRoute {
  static VisitRoute _fromState(GoRouterState state) => const VisitRoute();

  String get location => GoRouteData.$location(
        '/visit',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $patientRoute => GoRouteData.$route(
      path: '/patient',
      factory: $PatientRouteExtension._fromState,
    );

extension $PatientRouteExtension on PatientRoute {
  static PatientRoute _fromState(GoRouterState state) => const PatientRoute();

  String get location => GoRouteData.$location(
        '/patient',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $settingsRoute => GoRouteData.$route(
      path: '/settings',
      factory: $SettingsRouteExtension._fromState,
    );

extension $SettingsRouteExtension on SettingsRoute {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  String get location => GoRouteData.$location(
        '/settings',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

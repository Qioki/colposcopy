import 'package:colposcopy/core/constants/app_pages.dart';
import 'package:colposcopy/di/locator.dart';
import 'package:colposcopy/features/auth/presentation/forms/signup_form.dart';
import 'package:colposcopy/features/auth/presentation/screens/login_screen.dart';
import 'package:colposcopy/features/auth/presentation/screens/welcome_screen.dart';
import 'package:colposcopy/features/patient/presentation/forms/patient_card_form.dart';
import 'package:colposcopy/features/patient/presentation/screens/patient_screen.dart';
import 'package:colposcopy/features/patients/presentation/screens/patients_screen.dart';
import 'package:colposcopy/features/visit/presentation/screens/visit_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

part 'app_router.g.dart';

/*

-auth
  Welcome
  LogIn
  modal SignUp
  modal Activation

-app
  HomeScreen
  Settings
  Patients
  Visit

*/
@singleton
class AppRouter {
  // AppRouter._();

  late GoRouter _router;
  GoRouter initRouter() {
    _router = GoRouter(
      initialLocation: Pages.debug,
      routes: $appRoutes,
      // redirect: (BuildContext context, GoRouterState state) { return null; },
    );
    return _router;
  }

  static void goModal(String name, BuildContext context) {
    switch (name) {
      case Modals.patientCard:
        showDialog(
          context: context,
          builder: (BuildContext context) => const AlertDialog(
            content: PatientCardForm(),
            backgroundColor: Colors.white,
          ),
        );
        break;
      case Modals.signUp:
        showDialog(
          context: context,
          builder: (BuildContext context) => const AlertDialog(
            content: SignUpForm(),
            backgroundColor: Colors.white,
          ),
        );
        break;
      default:
    }
  }

  void go(String path) => _router.go(path);
}

@TypedGoRoute<DebugRoute>(path: Pages.debug)
class DebugRoute extends GoRouteData {
  const DebugRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PatientCardForm();
  }
}

@TypedGoRoute<WelcomeRoute>(path: Pages.welcome)
class WelcomeRoute extends GoRouteData {
  const WelcomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const WelcomeScreen();
}

@TypedGoRoute<LoginRoute>(path: Pages.login)
class LoginRoute extends GoRouteData {
  const LoginRoute();

  // @override Widget build(BuildContext context, GoRouterState state) => const LoginScreen();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      CustomTransitionPage(
        key: state.pageKey,
        transitionDuration: const Duration(milliseconds: 300),
        child: const LoginScreen(),
        transitionsBuilder: (_, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          );
        },
      );
}

@TypedGoRoute<PatientsRoute>(path: Pages.patients)
class PatientsRoute extends GoRouteData {
  const PatientsRoute();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      CustomTransitionPage(
        key: state.pageKey,
        transitionDuration: const Duration(milliseconds: 300),
        child: const PatientsScreen(),
        transitionsBuilder: (_, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          );
        },
      );
}

@TypedGoRoute<VisitRoute>(path: Pages.visit)
class VisitRoute extends GoRouteData {
  const VisitRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const VisitScreen();
}

//patient
@TypedGoRoute<PatientRoute>(path: Pages.patient)
class PatientRoute extends GoRouteData {
  const PatientRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const PatientScreen();
}

@TypedGoRoute<SettingsRoute>(path: Pages.settings)
class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => Scaffold(
        appBar: AppBar(),
        body: const Text('Settings'),
      );
}





//   static GoRouter router = GoRouter(
//     initialLocation: Pages.welcome,
//     routes: [
//       GoRoute(
//         path: Pages.welcome,
//         // path: '/${Pages.welcome}',
//         builder: (BuildContext context, GoRouterState state) {
//           return const WelcomeScreen();
//           // return const DetailsScreen();
//         },
//       ),
//       GoRoute(
//         path: '/auth',
//         builder: (BuildContext context, GoRouterState state) {
//           return Scaffold(
//               body: Column(
//             children: [
//               InkWell(
//                 onTap: () => context.go('/tabB/details'),
//                 child: Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: Text('item:'),
//                 ),
//               ),
//               Text('/'),
//             ],
//           ));
//           // return const HomeScreen();
//           // dart run build_runner --delete-conflicting-outputs
//         },
//         routes: <RouteBase>[
//           GoRoute(
//             path: '1',
//             builder: (BuildContext context, GoRouterState state) {
//               return Text('auth1');
//               // return const DetailsScreen();
//             },
//           ),
//         ],
//       ),
//       //   GoRoute(
//       //     path: home,
//       //     builder: (BuildContext context, GoRouterState state) =>
//       //         const HomeScreen(),
//       //     routes: [
//       //       GoRoute(
//       //         path: ':id',
//       //         builder: (context, state) {
//       //           return state.pathParameters['id'] == null
//       //               ? const Text('No data')
//       //               : PostListScreen(categoryName: state.pathParameters['id']!);
//       //         },
//       //         routes: [
//       //           GoRoute(
//       //             path: ':post',
//       //             builder: (context, state) {
//       //               return state.pathParameters['id'] == null
//       //                   ? const Text('No data')
//       //                   : PostDetailScreen(
//       //                       categoryName: state.pathParameters['id']!,
//       //                       postName: state.pathParameters['post']!,
//       //                     );
//       //             },
//       //           ),
//       //         ],
//       //       ),
//       //     ],
//       //   ),
//     ],
//     redirect: (BuildContext context, state) {
//       return null;
//     },
//   );
// }

// final GoRouter routes = GoRouter(
//   initialLocation: '/welcome',
//   routes: [
//     GoRoute(
//       path: '/welcome',
//       builder: (BuildContext context, GoRouterState state) {
//         return WelcomeScreen();
//         // return const DetailsScreen();
//       },
//     ),
//     GoRoute(
//       path: '/auth',
//       builder: (BuildContext context, GoRouterState state) {
//         return Scaffold(
//             body: Column(
//           children: [
//             InkWell(
//               onTap: () => context.go('/tabB/details'),
//               child: Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: Text('item:'),
//               ),
//             ),
//             Text('/'),
//           ],
//         ));
//         // return const HomeScreen();
//       },
//       routes: <RouteBase>[
//         GoRoute(
//           path: '1',
//           builder: (BuildContext context, GoRouterState state) {
//             return Text('auth1');
//             // return const DetailsScreen();
//           },
//         ),
//       ],
//     ),
//     StatefulShellRoute.indexedStack(
//         builder: (BuildContext context, GoRouterState state,
//             StatefulNavigationShell navigationShell) {
//           return ScaffoldNavBar(navigationShell: navigationShell);
//         },
//         branches: <StatefulShellBranch>[
//           StatefulShellBranch(
//             routes: <RouteBase>[
//               GoRoute(
//                 path: '/main',
//                 builder: (BuildContext context, GoRouterState state) =>
//                     const Text('1'),
//                 routes: <RouteBase>[
//                   GoRoute(
//                     path: 'details',
//                     builder: (BuildContext context, GoRouterState state) =>
//                         const Text('from Main Page'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           StatefulShellBranch(
//             routes: <RouteBase>[
//               GoRoute(
//                 path: '/tabB',
//                 builder: (BuildContext context, GoRouterState state) =>
//                     const Text('2'),
//                 routes: <RouteBase>[
//                   GoRoute(
//                     path: 'details',
//                     builder: (BuildContext context, GoRouterState state) =>
//                         Scaffold(
//                       appBar: AppBar(),
//                       body: const Text('from Tab B'),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ]),
//     // GoRoute(
//     //   path: '/',
//     //   builder: (BuildContext context, GoRouterState state) {
//     //     return Text('/');
//     //     // return const HomeScreen();
//     //   },
//     //   routes: <RouteBase>[
//     //     GoRoute(
//     //       path: '1',
//     //       builder: (BuildContext context, GoRouterState state) {
//     //         return Text('/1');
//     //         // return const DetailsScreen();
//     //       },
//     //     ),
//     //   ],
//     // ),
//     // GoRoute(
//     //   path: '/home',
//     //   builder: (BuildContext context, GoRouterState state) {
//     //     return Text('/');
//     //     // return const HomeScreen();
//     //   },
//     //   routes: <RouteBase>[
//     //     GoRoute(
//     //       path: '1',
//     //       builder: (BuildContext context, GoRouterState state) {
//     //         return Text('/1');
//     //         // return const DetailsScreen();
//     //       },
//     //     ),
//     //   ],
//     // ),
//   ],
// );

// class ScaffoldNavBar extends StatelessWidget {
//   const ScaffoldNavBar({
//     required this.navigationShell,
//     Key? key,
//   }) : super(key: key ?? const ValueKey<String>('ScaffoldNavBar'));

//   final StatefulNavigationShell navigationShell;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: navigationShell,
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Main'),
//           BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Tab b'),
//         ],
//         currentIndex: navigationShell.currentIndex,
//         onTap: (int index) => _onTap(context, index),
//       ),
//     );
//   }

//   void _onTap(BuildContext context, int index) {
//     print('index: $index');
//     navigationShell.goBranch(
//       index,
//       initialLocation: index == navigationShell.currentIndex,
//     );
//   }
// }

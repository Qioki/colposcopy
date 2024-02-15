import 'package:colposcopy/features/visit/presentation/cubits/visit/visit_cubit.dart';
import 'package:colposcopy/presentation/cubits/visit_main/visit_main_cubit.dart';
import 'package:colposcopy/presentation/widgets/main_nav_bar.dart';
import 'package:colposcopy/presentation/widgets/patient_nav_bar_widget.dart';
import 'package:colposcopy/presentation/widgets/visit_nav_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VisitMainScreen extends StatelessWidget {
  const VisitMainScreen({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    print('visit mainscreen ${navigationShell.currentIndex}');
    // var cubit = context.read<VisitCubit>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          MainNavBarWidget(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: BlocBuilder<VisitMainCubit, VisitMainState>(
                builder: (context, state) => state.when(
                  patient: () => const PatientNavBarWidget(editMode: false),
                  // patientPreview: () =>
                  //     const PatientNavBarWidget(editMode: false),
                  // activeVisit: () => VisitNavBarWidget(
                  //   navigationShell: navigationShell,
                  //   // editMode: false,
                  // ),
                  visit: () => VisitNavBarWidget(
                    navigationShell: navigationShell,
                    // editMode: false,
                  ),
                ),
              ),
            ),
          ),
          Expanded(child: navigationShell),
        ],
      ),
    );
  }
}

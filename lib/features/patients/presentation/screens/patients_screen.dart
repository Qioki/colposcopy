import 'package:colposcopy/core/constants/app_screens.dart';
import 'package:colposcopy/core/constants/strings.dart';
import 'package:colposcopy/features/patient/presentation/cubits/patient_card/patient_card_cubit.dart';
import 'package:colposcopy/features/patients/presentation/cubits/patient_visits/patient_visits_cubit.dart';
import 'package:colposcopy/features/patients/presentation/cubits/patients/patients_cubit.dart';
import 'package:colposcopy/presentation/cubits/visit_main/visit_main_cubit.dart';
import 'package:colposcopy/presentation/routes/app_router.dart';
import 'package:colposcopy/presentation/theme/app_theme.dart';
import 'package:colposcopy/presentation/widgets/main_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:data_table_2/data_table_2.dart';

class PatientsScreen extends StatelessWidget {
  const PatientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PatientsCubit>();
    // var visitCubit = context.read<PatientVisitsCubit>();
    var visitMainCubit = context.read<VisitMainCubit>();
    var patientCardCubit = context.read<PatientCardCubit>();
    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      body: Column(
        children: [
          // APPBAR
          MainNavBarWidget(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 6, left: 20),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 20,
                runSpacing: 10,
                children: [
                  SizedBox(
                      height: 32,
                      child: SearchField(cubit.onSearchTextChanged)),
                  BlocBuilder<PatientsCubit, PatientsState>(
                    builder: (context, state) => ElevatedButton(
                      onPressed: cubit.selectedItem == null
                          ? null
                          : () {
                              if (cubit.selectedItem != null) {
                                patientCardCubit.viewPatient(
                                    cubit.selectedItem!.patientId!);
                                visitMainCubit.patientMode();
                                const PatientRoute().go(context);
                              }
                            },
                      child: const Text(Strings.commandsOpen),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      patientCardCubit.newPatient();
                      visitMainCubit.patientMode();
                      const PatientRoute().go(context);
                    },
                    child: const Text(Strings.patientNew),
                  ),
                ],
              ),
            ),
          ),
          // BODY
          Flexible(
            child: Row(
              children: [
                // PATIENTS
                const Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    child: PatientsTable(),
                  ),
                ),
                // VISITS
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // const SizedBox(height: 10),
                        // // BUTTONS
                        // Wrap(
                        //   spacing: 20,
                        //   runSpacing: 10,
                        //   children: [
                        //     BlocBuilder<PatientsCubit, PatientsState>(
                        //       builder: (context, state) => ElevatedButton(
                        //         onPressed: visitCubit.selectedItem == null
                        //             ? null
                        //             : visitCubit.tryOpenVisit,
                        //         child: const Text(Strings.commandsOpen),
                        //       ),
                        //     ),
                        //     BlocBuilder<PatientsCubit, PatientsState>(
                        //       builder: (context, state) => ElevatedButton(
                        //         onPressed: cubit.selectedItem == null
                        //             ? null
                        //             : () {
                        //                 // const VisitRoute().push(context);
                        //               },
                        //         child: const Text(Strings.commandsNewVisit),
                        //       ),
                        //     ),
                        //     // const SizedBox(width: 20),
                        //   ],
                        // ),
                        // const SizedBox(height: 16),
                        // TABLE
                        Expanded(child: VisitsTable()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PatientsTable extends StatelessWidget {
  const PatientsTable({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PatientsCubit>();
    return BlocBuilder<PatientsCubit, PatientsState>(
        builder: (context, state) => state.when(
              initial: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              filtered: (items) {
                return DataTable2(
                  border: const TableBorder(
                    horizontalInside:
                        BorderSide(color: AppColors.primary, width: 0.35),
                    bottom: BorderSide(color: AppColors.primary, width: 0.35),
                    verticalInside:
                        BorderSide(color: AppColors.primary, width: 0.1),
                  ),
                  dividerThickness: 0,
                  showCheckboxColumn: false,
                  // isHorizontalScrollBarVisible: true,
                  // isVerticalScrollBarVisible: true,
                  columns: cubit.columns,
                  rows: items,
                );
              },
              // empty: () {
              //   return Center(
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         const Text(Strings.patientsDatabaseEmpty,
              //             style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300)),
              //         const SizedBox(height: 26),
              //         ElevatedButton(
              //             onPressed: () {},
              //             child: const Text(Strings.patientNew)),
              //       ],
              //     ),
              //   );
              // },
            ));
  }
}

class VisitsTable extends StatelessWidget {
  const VisitsTable({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PatientVisitsCubit>();
    return BlocBuilder<PatientVisitsCubit, PatientVisitsState>(
        builder: (context, state) => state.when(
              initial: () {
                return const Center(
                    // child: Text(
                    //   'Посещений нет',
                    //   style: TextStyle(fontSize: 24),
                    // ), // TODO: edit
                    );
              },
              filtered: (items) {
                return DataTable2(
                  border: const TableBorder(
                    horizontalInside:
                        BorderSide(color: AppColors.primary, width: 0.35),
                    bottom: BorderSide(color: AppColors.primary, width: 0.35),
                    verticalInside:
                        BorderSide(color: AppColors.primary, width: 0.1),
                  ),
                  dividerThickness: 0,
                  showCheckboxColumn: false,
                  // isHorizontalScrollBarVisible: true,
                  // isVerticalScrollBarVisible: true,
                  columns: cubit.columns,
                  rows: items,
                );
              },
            ));
  }
}

class SearchField extends StatelessWidget {
  SearchField(this.onChanged, {super.key});

  final _controller = TextEditingController();
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: _controller,
        onChanged: onChanged,
        // cursorColor: AppColors.primary,
        decoration: InputDecoration(
          constraints: const BoxConstraints(maxWidth: 260), // maxHeight: 36
          fillColor: Colors.white,
          hoverColor: Colors.black12,
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            onPressed: () {
              _controller.clear();
              onChanged('');
            },
            icon: const Icon(Icons.clear),
            hoverColor: Colors.transparent,
          ),
          filled: true,
          isDense: true,
          hintText: Strings.commandsSearch,
          hintStyle: const TextStyle(color: Colors.black45, fontSize: 14),
          // contentPadding: EdgeInsets.all(0),
          // border: OutlineInputBorder(
          //     borderRadius: BorderRadius.all(Radius.circular(25))),
          // enabledBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.all(Radius.circular(25)),
          //     borderSide: BorderSide(color: AppColors.primary, width: 0.35)),
          // hoverColor: AppColors.primaryLight,
        ));
  }
}

import 'package:colposcopy/core/constants/app_pages.dart';
import 'package:colposcopy/core/constants/string.dart';
import 'package:colposcopy/features/patients/presentation/cubits/patient_visits/patient_visits_cubit.dart';
import 'package:colposcopy/features/patients/presentation/cubits/patients/patients_cubit.dart';
import 'package:colposcopy/presentation/routes/app_router.dart';
import 'package:colposcopy/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:data_table_2/data_table_2.dart';

class PatientsScreen extends StatelessWidget {
  const PatientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PatientsCubit>();
    var visitCubit = context.read<PatientVisitsCubit>();
    print('after');
    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      body: Column(
        children: [
          // APPBAR
          Container(
            // color: Colors.black12,
            alignment: Alignment.centerRight,
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    tooltip: Strings.settings,
                    // TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.settings,
                      textDirection: TextDirection.rtl,
                      color: AppColors.primary,
                      size: 20,
                    ),
                    // label: const Text(Strings.settings),
                  ),
                  // const SizedBox(width: 20),
                  const VerticalDivider(
                      thickness: 0.5,
                      indent: 9,
                      endIndent: 9,
                      width: 30,
                      color: AppColors.primary),
                  IconButton(
                    // TextButton.icon(
                    onPressed: () {
                      if (cubit.tryLogout()) {
                        const LoginRoute().go(context);
                      }
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: AppColors.primary,
                      size: 20,
                    ),
                    // label: const Text(Strings.menuLogOut),
                    tooltip: Strings.menuLogOut,
                  ),
                  const SizedBox(width: 15),
                ],
              ),
            ),
          ),
          // BODY
          Flexible(
            child: Row(
              children: [
                // PATIENTS
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        // BUTTONS
                        Wrap(
                          spacing: 20,
                          runSpacing: 10,
                          children: [
                            SizedBox(
                                height: 36,
                                child: SearchField(cubit.onSearchTextChanged)),
                            // const SizedBox(width: 20),
                            BlocBuilder<PatientsCubit, PatientsState>(
                              builder: (context, state) => ElevatedButton(
                                onPressed: cubit.selectedItem == null
                                    ? null
                                    : cubit.tryOpenPatient,
                                child: const Text(Strings.commandsOpen),
                              ),
                            ),
                            // const SizedBox(width: 20),
                            ElevatedButton(
                              onPressed: () {
                                AppRouter.goModal(Modals.patientCard, context);
                                // showDialog(
                                //   context: context,
                                //   builder: (BuildContext context) =>
                                //       const AlertDialog(
                                //     content: PatientForm(),
                                //     backgroundColor: Colors.white,
                                //   ),
                                // );
                              },
                              child: const Text(Strings.patientNew),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // TABLE
                        const Expanded(child: PatientsTable()),
                      ],
                    ),
                  ),
                ),
                // VISITS
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        // BUTTONS
                        Wrap(
                          spacing: 20,
                          runSpacing: 10,
                          children: [
                            BlocBuilder<PatientsCubit, PatientsState>(
                              builder: (context, state) => ElevatedButton(
                                onPressed: visitCubit.selectedItem == null
                                    ? null
                                    : visitCubit.tryOpenVisit,
                                child: const Text(Strings.commandsOpen),
                              ),
                            ),
                            BlocBuilder<PatientsCubit, PatientsState>(
                              builder: (context, state) => ElevatedButton(
                                onPressed: cubit.selectedItem == null
                                    ? null
                                    : () {
                                        const VisitRoute().push(context);
                                      },
                                child: const Text(Strings.commandsNewVisit),
                              ),
                            ),
                            // const SizedBox(width: 20),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // TABLE
                        const Expanded(child: VisitsTable()),
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

//TODO: pagination table
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

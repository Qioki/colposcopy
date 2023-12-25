import 'package:colposcopy/core/constants/string.dart';
import 'package:colposcopy/features/patients/presentation/cubits/patients/patients_cubit.dart';
import 'package:colposcopy/features/patients/presentation/screens/patients_table.dart';
import 'package:colposcopy/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:data_table_2/data_table_2.dart';

class PatientsScreen extends StatelessWidget {
  const PatientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PatientsCubit>();
    return Scaffold(
      body: Container(
        // color: Colors.red,
        child: Column(
          children: [
            Container(
                // height: 500,
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.settings,
                          color: Colors.black54,
                        )),
                    // TextButton(
                    //   child: const Text(Strings.menuLogOut),
                    //   onPressed: () => const LoginRoute().go(context),
                    // ),
                  ],
                )),
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
                          // BUTTONS
                          Row(
                            children: [
                              SearchField(cubit.onSearchTextChanged),
                              const SizedBox(width: 20),
                              ElevatedButton(
                                onPressed: cubit.selectedPatient == null
                                    ? null
                                    : () => cubit.tryOpenPatient(),
                                child: const Text(Strings.commandsOpen),
                              ),
                              const SizedBox(width: 20),
                              ElevatedButton(
                                onPressed: () {
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
                          Expanded(
                            child: BlocBuilder<PatientsCubit, PatientsState>(
                                builder: (context, state) => state.when(
                                      initial: () {
                                        return Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                  Strings.patientsDatabaseEmpty,
                                                  style: TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.w300)),
                                              const SizedBox(height: 26),
                                              ElevatedButton(
                                                  onPressed: () {},
                                                  child: const Text(
                                                      Strings.patientNew)),
                                            ],
                                          ),
                                        );
                                      },
                                      filtered: (items) {
                                        return DataTable2(
                                          border: const TableBorder(
                                            horizontalInside: BorderSide(
                                                color: AppColors.primary,
                                                width: 0.35),
                                            bottom: BorderSide(
                                                color: AppColors.primary,
                                                width: 0.35),
                                            verticalInside: BorderSide(
                                                color: AppColors.primary,
                                                width: 0.1),
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  strokeAlign: BorderSide
                                                      .strokeAlignOutside,
                                                  color: AppColors.primary)),
                                          // columnSpacing: 12,
                                          horizontalMargin: 12,
                                          headingRowHeight: 32,
                                          dividerThickness: 0,
                                          showCheckboxColumn: false,
                                          // fixedColumnsColor: AppColors.primary,
                                          headingRowColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) =>
                                                      AppColors.primary),
                                          headingTextStyle: const TextStyle(
                                              color: Colors.white),
                                          // isHorizontalScrollBarVisible: true,
                                          isVerticalScrollBarVisible: true,
                                          fixedCornerColor: Colors.green,
                                          columns: cubit.patientColumns,
                                          rows: items,
                                        );
                                      },
                                    )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // VISITS
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          Text(''),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
        decoration: InputDecoration(
          constraints: const BoxConstraints(maxWidth: 260), // maxHeight: 36
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          prefixIcon: const Icon(Icons.search),
          // contentPadding: EdgeInsets.all(8),
          isDense: true,
          hintText: Strings.commandsSearch,
          hintStyle: const TextStyle(color: Colors.black45, fontSize: 14),
        ));
  }
}

import 'package:colposcopy/core/constants/string.dart';
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
    print('after');
    return Scaffold(
      body: Column(
        children: [
          // APPBAR
          Container(
            // color: Colors.black12,
            alignment: Alignment.centerRight,
            child: Wrap(
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings,
                    textDirection: TextDirection.rtl,
                    color: AppColors.primary,
                    size: 18,
                  ),
                  label: const Text(Strings.settings),
                ),
                const SizedBox(width: 20),
                TextButton.icon(
                  onPressed: () {
                    if (cubit.tryLogout()) {
                      const LoginRoute().go(context);
                    }
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: AppColors.primary,
                    size: 16,
                  ),
                  label: const Text(Strings.menuLogOut,
                      style: TextStyle(fontSize: 16)),
                ),
                const SizedBox(width: 20),
              ],
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
                        // BUTTONS
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 20,
                          runSpacing: 10,
                          children: [
                            SearchField(cubit.onSearchTextChanged),
                            // const SizedBox(width: 20),
                            BlocBuilder<PatientsCubit, PatientsState>(
                              builder: (context, state) => ElevatedButton(
                                onPressed: cubit.selectedPatient == null
                                    ? null
                                    : cubit.tryOpenPatient,
                                child: const Text(Strings.commandsOpen),
                              ),
                            ),
                            // const SizedBox(width: 20),
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
                        const Expanded(child: PatientsTable()),
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
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(Strings.patientsDatabaseEmpty,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w300)),
                      const SizedBox(height: 26),
                      ElevatedButton(
                          onPressed: () {},
                          child: const Text(Strings.patientNew)),
                    ],
                  ),
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
                  isVerticalScrollBarVisible: true,
                  columns: cubit.patientColumns,
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

import 'package:colposcopy/core/constants/strings.dart';
import 'package:colposcopy/features/patient/presentation/cubits/patient_card/patient_card_cubit.dart';
import 'package:colposcopy/presentation/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientNavBarWidget extends StatelessWidget {
  const PatientNavBarWidget({
    required this.editMode,
    super.key,
  });
  final bool editMode;

  @override
  Widget build(BuildContext context) {
    var patientCardCubit = context.read<PatientCardCubit>();
    return BlocBuilder<PatientCardCubit, PatientCardState>(
      builder: (context, state) => state.when(
        initial: () => Text(''),
        newPatient: () => Row(
          children: [
            TextButton.icon(
              icon: const Icon(Icons.cancel, size: 18),
              // icon: const Icon(Icons.arrow_back, size: 18),
              onPressed: () => const PatientsRoute().go(context),
              label: const Text(Strings.commandsCancel),
            ),
            TextButton.icon(
              icon: const Icon(Icons.save, size: 18),
              onPressed: () {
                patientCardCubit.tryAddPatient();
              },
              label: const Text(Strings.commandsSave),
            ),
          ],
        ),
        editPatient: () => Row(
          children: [
            TextButton.icon(
              icon: const Icon(Icons.cancel, size: 18),
              // icon: const Icon(Icons.arrow_back, size: 18),
              onPressed: () => const PatientsRoute().go(context),
              label: const Text(Strings.commandsCancel),
            ),
            TextButton.icon(
              icon: const Icon(Icons.save, size: 18),
              onPressed: () {},
              label: const Text(Strings.commandsSave),
            ),
          ],
        ),
        viewPatient: () => Row(
          children: [
            const Text(''),
            Expanded(
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => const PatientsRoute().go(context),
                      icon: const Icon(Icons.arrow_back),
                    ),
                    // const SizedBox(width: 15),
                    // const Text('Новый пациент', style: TextStyle(fontSize: 18)),
                    const Spacer(),
                    const SizedBox(width: 25),
                    const VerticalDivider(
                        thickness: 0.5,
                        indent: 9,
                        endIndent: 9,
                        width: 30,
                        color: Colors.black54),
                    TextButton.icon(
                      icon: const Icon(Icons.edit, size: 18),
                      onPressed: () {},
                      label: const Text(Strings.commandsEdit),
                    ),
                    TextButton.icon(
                      icon: const Icon(Icons.add, size: 18),
                      onPressed: () {},
                      label: const Text(Strings.commandsNewVisit),
                    ),
                    // ElevatedButton(
                    //   onPressed: () {},
                    //   child: const Text(Strings.commandsEdit),
                    // ),
                    // const SizedBox(width: 15),
                    // ElevatedButton(
                    //   onPressed: () {},
                    //   child: const Text(Strings.commandsNewVisit),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// class PatientButtonsWidget extends StatelessWidget {
//   const PatientButtonsWidget({required this.editMode, super.key});
//   final bool editMode;

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//         onPressed: () {}, child: const Text(Strings.commandsNewVisit));
//   }
// }
// class VisitButtonsWidget extends StatelessWidget {
//   const VisitButtonsWidget({required this.visitState, super.key});
//   final VisitEnumState visitState;

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

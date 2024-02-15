import 'package:colposcopy/core/constants/strings.dart';
import 'package:colposcopy/features/patient/presentation/cubits/patient_card/patient_card_cubit.dart';
import 'package:colposcopy/features/form_engine/presentation/form_items.dart';
import 'package:colposcopy/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PatientCardForm extends StatelessWidget {
  const PatientCardForm({this.newPatient = true, super.key});

  final bool newPatient;

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<PatientCardCubit>();
    // print(cubit.scheme.fid.itemType);
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 30),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      constraints: const BoxConstraints(maxWidth: 1100, minWidth: 800),
      // width: double.infinity,
      // height: double.infinity,
      // constraints: const BoxConstraints(maxHeight: 700),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 16),
            child: Row(
              children: [
                const SizedBox(width: 30),
                const Text(
                  Strings.patientNew,
                  style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        cubit.clearForm();
                        Navigator.pop(context);
                      },
                      child: const Text(Strings.commandsCancel),
                    ),
                    const SizedBox(width: 30),
                    ElevatedButton(
                      onPressed: () {
                        print(cubit.formGroup.value);
                        cubit.setReadOnly(true);
                      },
                      child: const SizedBox(
                        width: 90,
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(Strings.commandsCreate),
                            Icon(
                              Icons.arrow_forward,
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // IntrinsicHeight(
          //   child: Row(
          //     // crossAxisAlignment: CrossAxisAlignment.baseline,
          //     children: [
          //       Expanded(
          //         child: SizedBox(
          //           child: Container(
          //             // width: 300,
          //             // alignment: Alignment.center,
          //             padding: const EdgeInsets.only(left: 50, right: 20),
          //             // constraints: const BoxConstraints(maxWidth: 100),
          //             child: const Column(
          //               crossAxisAlignment: CrossAxisAlignment.end,
          //               children: [
          //                 Text(
          //                   Strings.patientNew,
          //                   style: TextStyle(
          //                       color: AppColors.primary,
          //                       fontSize: 32,
          //                       fontWeight: FontWeight.bold),
          //                 ),
          //                 // Text(
          //                 //   Strings.patientCreation,
          //                 //   textAlign: TextAlign.end,
          //                 //   style:
          //                 //       TextStyle(fontSize: 18, color: Colors.black38),
          //                 // ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //       // VerticalDivider(
          //       //   color: Theme.of(context).colorScheme.primary,
          //       //   thickness: 1,
          //       // ),
          //       Expanded(
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             TextButton(
          //               onPressed: () {
          //                 cubit.clearForm();
          //                 Navigator.pop(context);
          //               },
          //               child: const Text(Strings.commandsCancel),
          //             ),
          //             const SizedBox(width: 30),
          //             ElevatedButton(
          //               onPressed: () {
          //                 print(cubit.formGroup.value);
          //                 cubit.setReadOnly(true);
          //               },
          //               child: const SizedBox(
          //                 width: 90,
          //                 height: 30,
          //                 child: Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     Text(Strings.commandsCreate),
          //                     Icon(
          //                       Icons.arrow_forward,
          //                       size: 15,
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // const SizedBox(height: 24),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                color: AppColors.primaryLight,
              ),
              // color: AppColors.primaryLight,
              child: SingleChildScrollView(
                // padding: EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: ReactiveForm(
                    formGroup: cubit.formGroup,
                    child: FormRoot(
                      child: cubit.scheme.build(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      // AppBar(backgroundColor: Colors.transparent, elevation: 0),
    );
  }
}

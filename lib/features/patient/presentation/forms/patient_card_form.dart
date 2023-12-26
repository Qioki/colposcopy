import 'package:colposcopy/core/constants/string.dart';
import 'package:colposcopy/features/patient/presentation/cubits/patient_card/patient_card_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PatientCardForm extends StatelessWidget {
  const PatientCardForm({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PatientCardCubit>();
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 40),
                ReactiveForm(
                  formGroup: cubit.formGroup,
                  child: SizedBox(
                    child: Wrap(
                      spacing: 40,
                      runSpacing: 10,
                      children:
                          cubit.formFields.map((e) => Text('test')).toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                    onPressed: () => null,
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
                    ))
              ],
            ),
          ),
          // AppBar(backgroundColor: Colors.transparent, elevation: 0),
        ],
      ),
    );
  }
}
import 'package:colposcopy/features/form_engine/presentation/form_items.dart';
import 'package:colposcopy/features/patient/presentation/cubits/patient_card/patient_card_cubit.dart';
import 'package:colposcopy/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PatientScreen extends StatelessWidget {
  const PatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<PatientCardCubit>();
    return SingleChildScrollView(
      child: Container(
        color: AppColors.primaryLight,
        child: Center(
          child: ReactiveForm(
            formGroup: cubit.formGroup,
            child: FormRoot(
              child: cubit.scheme.build(),
            ),
          ),
        ),
      ),
    );
  }
}

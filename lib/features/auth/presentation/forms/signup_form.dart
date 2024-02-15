import 'package:colposcopy/core/constants/strings.dart';
import 'package:colposcopy/presentation/widgets/logo_zmir_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:colposcopy/features/auth/presentation/cubits/auth/auth_cubit.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const LogoZmirWidget(160),
                const SizedBox(height: 40),
                ReactiveForm(
                  formGroup: cubit.signUpForm,
                  child: SizedBox(
                    child: Wrap(
                      spacing: 40,
                      runSpacing: 10,
                      children: cubit.formFields
                          .map((e) => ReactiveTextField<String>(
                                formControlName: e.formKey,
                                onSubmitted: (control) => cubit.trySignUp(),
                                decoration: InputDecoration(
                                  constraints: const BoxConstraints(
                                      maxHeight: 65, maxWidth: 200),
                                  labelText: e.label,
                                  helperText: '',
                                  suffixIcon: Icon(e.icon, size: 15),
                                  helperMaxLines: 1,
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                    onPressed: cubit.trySignUp,
                    child: const SizedBox(
                      width: 90,
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(Strings.commandsCreate),
                          Icon(Icons.arrow_forward, size: 15),
                        ],
                      ),
                    ))
              ],
            ),
          ),
          AppBar(backgroundColor: Colors.transparent, elevation: 0),
        ],
      ),
    );
  }
}

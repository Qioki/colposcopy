import 'package:colposcopy/core/constants/string.dart';
import 'package:colposcopy/domain/models/user/user.dart';
import 'package:colposcopy/presentation/routes/app_router.dart';
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
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const FlutterLogo(size: 80),
                const SizedBox(height: 30),
                ReactiveForm(
                  formGroup: cubit.signUpForm,
                  child: SizedBox(
                    child: Wrap(
                      spacing: 40,
                      runSpacing: 10,
                      children: cubit.formFields
                          .map((e) => ReactiveTextField<String>(
                                formControlName: e.formKey,
                                onSubmitted: (control) =>
                                    trySignUp(context, cubit.trySignUp()),
                                // cubit.trySignUp().then((value) => {
                                //       if (value != null)
                                //         PatientsRoute(value).push(context),
                                //     }),
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
                    onPressed: () => trySignUp(context, cubit.trySignUp()),
                    // onPressed: () => cubit.trySignUp(),
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
          AppBar(backgroundColor: Colors.transparent, elevation: 0),
        ],
      ),
    );
  }

  // TODO
  void trySignUp(BuildContext context, Future<User?> trySignUp) async =>
      trySignUp.then(
          (value) => {if (value != null) const PatientsRoute().go(context)});
}

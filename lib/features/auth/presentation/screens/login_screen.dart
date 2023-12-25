import 'package:colposcopy/core/constants/string.dart';
import 'package:colposcopy/domain/models/user/user.dart';
import 'package:colposcopy/features/auth/presentation/cubits/auth/auth_cubit.dart';
import 'package:colposcopy/features/auth/presentation/forms/signup_form.dart';
import 'package:colposcopy/presentation/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('build login screen');
    var cubit = context.read<AuthCubit>();
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          height: 600,
          child: ReactiveForm(
            formGroup: cubit.loginForm,
            child: Column(
              children: [
                const FlutterLogo(size: 120),
                const SizedBox(height: 60),
                Autocomplete<User>(
                  displayStringForOption: _displayStringForOption,
                  optionsBuilder: cubit.searchUsersByText,
                  fieldViewBuilder: (BuildContext context,
                      TextEditingController fieldTextEditingController,
                      FocusNode fieldFocusNode,
                      VoidCallback onFieldSubmitted) {
                    return ReactiveTextField<String>(
                      onChanged: (control) => cubit.selectUser(null),
                      formControlName: 'name',
                      textInputAction: TextInputAction.done,
                      controller: fieldTextEditingController,
                      onSubmitted: (value) =>
                          tryLogin(context, cubit.tryLogin()), // TODO: edit
                      focusNode: fieldFocusNode,
                      decoration: const InputDecoration(
                        labelText: Strings.userName,
                      ),
                    );
                  },
                  optionsViewBuilder: (context, onSelected, options) =>
                      AutocmpletePopupWidget(onSelected, options),
                  onSelected: (User selection) => cubit.selectUser(selection),
                ),
                const SizedBox(height: 10),
                PasswordField(() => tryLogin(context, cubit.tryLogin())),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      maximumSize: const Size.fromHeight(50)),
                  onPressed: () => tryLogin(context, cubit.tryLogin()),
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 30,
                    child: const Text(
                      Strings.commandsEnter,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(
                    height: 50,
                    thickness: 1,
                    indent: 50,
                    endIndent: 50,
                    color: Colors.black45),
                const Text(Strings.authLogInNoHave,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
                TextButton(
                    onPressed: () {
                      cubit.clearSignUpForm();

                      showDialog(
                        context: context,
                        builder: (BuildContext context) => const AlertDialog(
                          content: SignUpForm(),
                          backgroundColor: Colors.white,
                        ),
                      );
                    },
                    child: const Text(Strings.authLogInNewUser,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ))),
              ],
            ),
            // },
          ),
        ),
      ),
    );
  }

  // TODO
  void tryLogin(BuildContext context, Future<User?> tryLogin) async {
    tryLogin.then(
        (value) => {if (value != null) const PatientsRoute().go(context)});
  }

  static String _displayStringForOption(User option) =>
      '${option.lastname} ${option.firstname}';
}

class AutocmpletePopupWidget extends StatelessWidget {
  const AutocmpletePopupWidget(this.onSelected, this.items, {super.key});
  final Iterable<User> items;
  final AutocompleteOnSelected<User> onSelected;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Material(
        child: Container(
          constraints: const BoxConstraints(maxHeight: 250, maxWidth: 300),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(10),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final User item = items.elementAt(index);
                return GestureDetector(
                    onTap: () => onSelected(item),
                    child: ListTile(
                      title: Text('${item.lastname} ${item.firstname}'),
                    ));
              }),
        ),
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField(this.onSubmitted, {super.key});
  final void Function() onSubmitted;

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField<String>(
      formControlName: 'password',
      obscureText: true,
      textInputAction: TextInputAction.done,
      onSubmitted: (value) => onSubmitted(),
      decoration: const InputDecoration(
        labelText: Strings.userPassword,
        // helperText: '',
        // helperStyle: TextStyle(height: 0.7),
        // errorStyle: TextStyle(height: 0.7),
      ),
    );
  }
}
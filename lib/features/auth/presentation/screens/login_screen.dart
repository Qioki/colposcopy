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
                      onSubmitted: (value) {
                        // cubit.tryLogin();
                        tryLogin(context, cubit.tryLogin());
                      },
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
                // PasswordField(cubit.tryLogin),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      maximumSize: const Size.fromHeight(50)),
                  onPressed: () => tryLogin(context, cubit.tryLogin()),
                  //  {
                  //   cubit.tryLogin().then((value) {
                  //     if(value == null) return;

                  //   });
                  // },
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
                    onPressed: () async {
                      cubit.clearSignUpForm();
                      return showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            const AlertDialog(content: SignUpForm()),
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
        // border: OutlineInputBorder(
        //   borderSide:
        //       BorderSide(width: 3, color: Colors.greenAccent), //<-- SEE HERE
        //   borderRadius: BorderRadius.circular(25),
        // ),
      ),
    );
  }
}

// return Container(
//   alignment: Alignment.center,
//   height: 50,
//   child: TextField(
//     controller: fieldTextEditingController,
//     focusNode: fieldFocusNode,
//     // onSubmitted: (v) => onFieldSubmitted(),
//     decoration: InputDecoration(
//       contentPadding:
//           const EdgeInsets.symmetric(horizontal: 10),
//       labelText: Strings.userName,
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(25),
//       ),
//       // contentPadding:
//       //     EdgeInsets.only(bottom: 18, left: 15, right: 15),
//     ),
//     maxLines: 1,
//   ),
// );

// class AutocompleteBasicUserExample extends StatelessWidget {
//   const AutocompleteBasicUserExample({super.key});

//   static const List<User> _userOptions = <User>[
//     User(name: 'Alice', email: 'alice@example.com'),
//     User(name: 'Bob', email: 'bob@example.com'),
//     User(name: 'Charlie', email: 'charlie123@gmail.com'),
//   ];

//   static String _displayStringForOption(User option) => option.name;

//   @override
//   Widget build(BuildContext context) {
//     return Autocomplete<User>(
//       displayStringForOption: _displayStringForOption,
//       optionsBuilder: (TextEditingValue textEditingValue) {
//         if (textEditingValue.text == '') {
//           return const Iterable<User>.empty();
//         }
//         return _userOptions.where((User option) {
//           return option
//               .toString()
//               .contains(textEditingValue.text.toLowerCase());
//         });
//       },
//       onSelected: (User selection) {
//         debugPrint('You just selected ${_displayStringForOption(selection)}');
//       },
//     );
//   }
// }
// @immutable
// class User {
//   const User({
//     required this.email,
//     required this.name,
//   });

//   final String email;
//   final String name;

//   @override
//   String toString() {
//     return '$name, $email';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (other.runtimeType != runtimeType) {
//       return false;
//     }
//     return other is User && other.name == name && other.email == email;
//   }

//   @override
//   int get hashCode => Object.hash(email, name);
// }

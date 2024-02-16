import 'package:bloc/bloc.dart';
import 'package:colposcopy/core/constants/app_screens.dart';
import 'package:colposcopy/core/constants/strings.dart';
import 'package:colposcopy/di/locator.dart';
import 'package:colposcopy/domain/controllers/security_controller.dart';
import 'package:colposcopy/domain/models/user/user.dart';
import 'package:colposcopy/domain/repositories/users.dart';
import 'package:colposcopy/features/app/domain/controllers/app_controller_impl.dart';
import 'package:colposcopy/presentation/routes/app_router.dart';
import 'package:colposcopy/presentation/validators/required_validator.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._repository, this._appController)
      : super(const AuthState.initial()) {
    _repository.watchUsers().listen((event) {
      _users = event;
      emit(const AuthState.initial());
    });
  }

  final UsersRepository _repository;
  final AppController _appController;

  List<User> _users = [];
  List<User> get users => _users;

  // LOGIN FORM
  final loginForm = fb.group({
    AuthFormKeys.login: FormControl<String>(
      value: '',
      // validators: [const RequiredCustomValidator()],
    ),
    AuthFormKeys.password: FormControl<String>(value: ''),
    AuthFormKeys.error: FormControl<String>(value: ''),
  }, [
    const RequiredAppValidator()
  ]);

  // SIGNUP FORM
  final signUpForm = fb.group({
    AuthFormKeys.firstname: FormControl<String>(
      value: '',
      validators: [const RequiredAppValidator()],
    ),
    AuthFormKeys.lastname: FormControl<String>(
      value: '',
      validators: [const RequiredAppValidator()],
    ),
    AuthFormKeys.patronymic: FormControl<String>(value: ''),
    AuthFormKeys.phone: FormControl<String>(value: ''),
    AuthFormKeys.email: FormControl<String>(value: ''),
    AuthFormKeys.password: FormControl<String>(value: ''),
  });

  final List<FromData> formFields = [
    FromData(AuthFormKeys.firstname, Strings.personName, Icons.person),
    FromData(AuthFormKeys.lastname, Strings.personLastname, Icons.person),
    FromData(AuthFormKeys.patronymic, Strings.personPatronymic, Icons.person),
    FromData(AuthFormKeys.phone, Strings.personPhone, Icons.phone),
    FromData(AuthFormKeys.email, Strings.personEmail, Icons.email),
    FromData(AuthFormKeys.password, Strings.userPassword, Icons.lock),
  ];

  // TODO: accent if selected
  User? selection;
  void selectUser(User? selection) => this.selection = selection;

  void tryLogin() async {
    if (selection == null || selection!.userId == null) return null;

    String password = loginForm.control(AuthFormKeys.password).value ?? '';
    if (password.isNotEmpty) {
      password = SecurityController.hashPassword(password);
    }

    _tryLogin(selection!.userId!, password);
  }

  void trySignUp() async {
    signUpForm.markAllAsTouched();

    if (!signUpForm.valid) return null;

    var userJson = signUpForm.value;

    var password = '';
    if (userJson[AuthFormKeys.password] is String &&
        userJson[AuthFormKeys.password] != '') {
      password = userJson[AuthFormKeys.password] as String;
      if (password.isNotEmpty) {
        password = SecurityController.hashPassword(password);
      }
    }

    userJson = {
      ...userJson,
      AuthFormKeys.password: password,
    };

    // TODO: check if user exists
    var userId = await _repository.addUser(User.fromJson(userJson));

    locator<AppRouter>().pop(Screens.patients);

    _tryLogin(userId, password);
  }

  void _tryLogin(int userId, String hashedPassword) async {
    var user =
        await _repository.getUserWithIdAndPassword(userId, hashedPassword);
    if (user == null) return null;

    onLogin(user);

    locator<AppRouter>().go(Screens.patients);
  }

  void onLogin(User user) {
    print(user);
    selection = null;
    _appController.onLogin(user);
    Future.delayed(const Duration(seconds: 1), () {
      signUpForm.reset();
      loginForm.reset();
    });
  }

  //TODO logout
  bool tryLogout() {
    return true;
  }

  void clearSignUpForm() {
    signUpForm.reset();
  }

  // @override
  // Future<void> close() {
  //   return super.close();
  // }

  late AutocompleteOptionsBuilder<User> searchUsersByText = (searchText) {
    if (searchText.text == '') {
      return const Iterable<User>.empty();
    }
    var textItems = searchText.text.toLowerCase().split(' ');
    return users.where((User item) =>
        textItems.every((textItem) => _ifTextContaints(item, textItem)));
  };

  bool _ifTextContaints(User item, String textItem) =>
      item.lastname.toLowerCase().contains(textItem) ||
      item.firstname.toLowerCase().contains(textItem) ||
      (item.patronymic != null
          ? item.patronymic!.toLowerCase().contains(textItem)
          : false);
}

class AuthFormKeys {
  static const login = 'login';
  static const password = 'password';
  static const firstname = 'firstname';
  static const lastname = 'lastname';
  static const patronymic = 'patronymic';
  static const email = 'email';
  static const phone = 'phone';

  static const error = 'error';
}

class FromData {
  String formKey, label;
  IconData icon;
  FromData(this.formKey, this.label, this.icon);
}

import 'package:bloc/bloc.dart';
import 'package:colposcopy/core/constants/string.dart';
import 'package:colposcopy/domain/controllers/security_controller.dart';
import 'package:colposcopy/domain/models/user/user.dart';
import 'package:colposcopy/domain/repositories/users.dart';
import 'package:colposcopy/features/app/domain/controllers/app_controller_impl.dart';
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
    FormKeys.name: FormControl<String>(
      value: '',
      // validators: [const RequiredCustomValidator()],
    ),
    FormKeys.password: FormControl<String>(value: ''),
    FormKeys.error: FormControl<String>(value: ''),
  }, [
    const RequiredCustomValidator()
  ]);

  // SIGNUP FORM
  final signUpForm = fb.group({
    FormKeys.firstname: FormControl<String>(
      value: '',
      validators: [const RequiredCustomValidator()],
    ),
    FormKeys.lastname: FormControl<String>(
      value: '',
      validators: [const RequiredCustomValidator()],
    ),
    FormKeys.patronymic: FormControl<String>(value: ''),
    FormKeys.phone:
        FormControl<String>(value: '', validators: [Validators.maxLength(10)]),
    FormKeys.email:
        FormControl<String>(value: '', validators: [Validators.email]),
    FormKeys.password: FormControl<String>(value: ''),
  });

  final List<FromData> formFields = [
    FromData(FormKeys.firstname, Strings.personName, Icons.person),
    FromData(FormKeys.lastname, Strings.personLastname, Icons.person),
    FromData(FormKeys.patronymic, Strings.personPatronymic, Icons.person),
    FromData(FormKeys.phone, Strings.personPhone, Icons.phone),
    FromData(FormKeys.email, Strings.personEmail, Icons.email),
    FromData(FormKeys.password, Strings.userPassword, Icons.lock),
  ];

  User? selection;
  void selectUser(User? selection) {
    print(selection);
    this.selection = selection;
  }

  Future<User?> tryLogin() async {
    if (selection == null || selection!.userId == null) {
      return null;
    }

    String password = loginForm.control('password').value ?? '';
    if (password.isNotEmpty) {
      password = SecurityController.hashPassword(password);
    }

    var user = await _repository.getUserWithIdAndPassword(
        selection!.userId!, password);
    print(user);

    if (user == null) {
      return null;
    }

    _appController.onLogin(user);

    loginForm.reset();
    selection = null;
    return user;
  }

  Future<User?> trySignUp() async {
    print('trySignUp ${signUpForm.valid}');
    print('${signUpForm.value}');
    signUpForm.markAllAsTouched();

    if (!signUpForm.valid) {
      return null;
    }

    String password = signUpForm.control('password').value ?? '';
    if (password.isNotEmpty) {
      password = SecurityController.hashPassword(password);
    }
    signUpForm.control('password').value = password;

    var userId = await _repository.addUser(User.fromJson(signUpForm.value));
    var user = await _repository.getUserWithIdAndPassword(userId, password);
    if (user == null) {
      return null;
    }
    _appController.onLogin(user);
    signUpForm.reset();
    return await _repository.getUserById(userId);
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

class FormKeys {
  static const name = 'name';
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

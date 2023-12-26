import 'package:bloc/bloc.dart';
import 'package:colposcopy/core/constants/string.dart';
import 'package:colposcopy/domain/repositories/patients.dart';
import 'package:colposcopy/presentation/validators/required_validator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'patient_card_state.dart';
part 'patient_card_cubit.freezed.dart';

@injectable
class PatientCardCubit extends Cubit<PatientCardState> {
  PatientCardCubit(this._repository) : super(const PatientCardState.initial());

  final PatientsRepository _repository;

  var jsonScheme =
      '''{
  "personal": {
    "name": "...",
    "email": "..."
  },
  "phone": {
    "phoneNumber": "...",
    "countryIso": "..."
  },
  "address": {
    "street": "...",
    "city": "...",
    "zip": "..."
  }
}''';

  final formGroup = fb.group({
    // PatientCardFormKeys.firstname: FormControl<String>(
    //   value: '',
    //   validators: [const RequiredCustomValidator()],
    // ),
    // PatientCardFormKeys.lastname: FormControl<String>(
    //   value: '',
    //   validators: [const RequiredCustomValidator()],
    // ),
    // PatientCardFormKeys.patronymic: FormControl<String>(value: ''),
    // PatientCardFormKeys.phone: FormControl<String>(value: ''),
    // PatientCardFormKeys.email: FormControl<String>(value: ''),
    // PatientCardFormKeys.password: FormControl<String>(value: ''),
    // PatientCardFormKeys.birthdate: DateTime.now(),
  });

  final List<FromData> formFields = [
    FromData(PatientCardFormKeys.firstname, Strings.personName),
    FromData(PatientCardFormKeys.lastname, Strings.personLastname),
    FromData(PatientCardFormKeys.patronymic, Strings.personPatronymic),
    FromData(PatientCardFormKeys.phone, Strings.personPhone),
    FromData(PatientCardFormKeys.email, Strings.personEmail),
  ];
}

class PatientCardFormKeys {
  static const firstname = 'firstname';
  static const lastname = 'lastname';
  static const patronymic = 'patronymic';
  static const birthdate = 'birthdate';
  static const snils = 'snils';

  static const email = 'email';
  static const phone = 'phone';

  static const error = 'error';
}

class FromData {
  String formKey, label;
  FromData(this.formKey, this.label);
}

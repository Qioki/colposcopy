import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:colposcopy/core/constants/app_screens.dart';
import 'package:colposcopy/di/locator.dart';
import 'package:colposcopy/domain/controllers/visit_controller.dart';
import 'package:colposcopy/domain/models/patient/patient.dart';
import 'package:colposcopy/presentation/routes/app_router.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:colposcopy/core/constants/strings.dart';
import 'package:colposcopy/domain/repositories/patients.dart';
import 'package:colposcopy/domain/repositories/protocols.dart';
import 'package:colposcopy/features/form_engine/domain/form_controller.dart';
import 'package:colposcopy/features/form_engine/domain/models/form_item_data/form_item_data.dart';
import 'package:colposcopy/features/form_engine/domain/models/scheme_item/scheme_item.dart';

part 'patient_card_state.dart';
part 'patient_card_cubit.freezed.dart';

@injectable
class PatientCardCubit extends Cubit<PatientCardState> {
  PatientCardCubit(
      this._patientsRepository, this._protocolRepository, this._visitController)
      : super(const PatientCardState.newPatient()) {
    init();
  }

  final PatientsRepository _patientsRepository;
  final ProtocolRepository _protocolRepository;
  final VisitController _visitController;

  final FormController formController = FormController()..inputMaxLenght = 30;
  late SchemeItem scheme = SchemeItemContainer.empty();

  FormGroup formGroup = FormGroup({});
  // = FormController().fidToFormGroup(scheme);
  // final formGroup = fb.group({
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
  // });

  void init() async {
    formGroup = formController.formGroup;

    Map<String, dynamic> titlesJson =
        jsonDecode(await rootBundle.loadString('assets/jsons/pc_keys.json'));
    formController.setTitles(titlesJson);

    var json = _protocolRepository.getPatientCardJson();
    FormItemData tree = FormItemData.fromJson(json);

    scheme = formController.fidToSchemeItem(tree);
    emit(const PatientCardState.editPatient());
  }

  void newPatient() {
    _visitController.newPatient();
    clearForm();
    formGroup.markAsEnabled();

    emit(const PatientCardState.newPatient());
  }

  Future<bool> tryAddPatient() async {
    // print(formGroup.value);

    formGroup.markAllAsTouched();

    if (!formGroup.valid) return false;
    DateTime bitrhdate = DateTime.now();

    var formJson = formGroup.value;
    if (formJson['birthdate'] is DateTime) {
      bitrhdate = formJson['birthdate'] as DateTime;
    }

    var json = {
      ...formJson,
      'userId': 1, // TODO get from AppSession
      'birthdate': DateFormat('yyyy-MM-dd').format(bitrhdate),
      'card': formJson.toString(),
    };

    var id = await _patientsRepository.addPatient(Patient.fromJson(json));
    viewPatient(id);
    return true;
  }

  void viewPatient(int id) async {
    clearForm();

    var patient = await _patientsRepository.getPatientById(id);
    if (patient == null) return null;

    // formGroup.markAsDisabled();
    setReadOnly(true);
    var patientJson = patient.toJson();
    print('viewPatient ${patientJson}');

    var json = {
      ...patientJson,
      'birthdate': DateTime.parse(patientJson['birthdate']),
    };

    formGroup.updateValue(json);

    _visitController.setActivePatient(patient);

    emit(const PatientCardState.viewPatient());
  }

  Future<bool> trySave() async {
    return true;
  }

  void expand(String s, bool value) {
    // formGroup.markAsDisabled();
    // print('${formController.schemeMap[s]}');
    // if (formController.schemeMap[s] is SchemeItemExpander) {
    //   (formController.schemeMap[s] as SchemeItemExpander).value.value = false;
    // }
  }

  void clearForm() {
    formGroup.reset();
  }

  void setReadOnly(bool readOnly) {
    // emit(const PatientCardState.viewPatient());
    formGroup.markAsDisabled(updateParent: true, emitEvent: true);
  }

  // FormControl<T> didToFormControl2<T>(FormItemData fid, T value) {
  //   switch (fid.itemType) {
  //     case FormItemType.inputLine:
  //       return FormControl<T>(
  //         value: value,
  //         disabled: true,
  //       );
  //     default:
  //   }
  //   return FormControl<T>(
  //       value: value, validators: [RequiredCustomValidator()]);
  // }

  final List<FromData> formFields = [
    FromData(PatientCardFormKeys.firstname, Strings.personName),
    FromData(PatientCardFormKeys.lastname, Strings.personLastname),
    FromData(PatientCardFormKeys.patronymic, Strings.personPatronymic),
    FromData(PatientCardFormKeys.phone, Strings.personPhone),
    FromData(PatientCardFormKeys.email, Strings.personEmail),
  ];

  // TODO: readonly
  // late FormItemData tree = FormItemData.fromJson(jsonDecode(jsonString));

  // String jsonString = '{}';
//   late FormItemData tree = FormItemData(
//     key: 'key 2',
//     itemType: FormItemType.expander,
//     title: 'expansion',
//     items: [
//       const FormItemData(
//         key: 'key 1',
//         itemType: FormItemType.input,
//         title: 'Firstname',
//         // items: [],
//         properties: ['vertical'],
//         defaultValue: 'Mari',
//         hint: 'type firstname',
//         validators: ['required'],
//         minWidth: 100,
//         maxWidth: 100,
//         // minHeight: 0,
//         // maxHeight: 0,
//       ),
//       FormItemData(
//         key: 'key 3',
//         itemType: FormItemType.date,
//         title: 'Birthdate',
//         // items: [],
//         properties: ['vertical'],
//         defaultValue: DateTime.now(),
//         hint: 'type firstname',
//         validators: ['required'],
//         minWidth: 100,
//         maxWidth: 100,
//         // minHeight: 0,
//         // maxHeight: 0,
//       )
//     ],
//     // properties: ['vertical'],
//   );
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

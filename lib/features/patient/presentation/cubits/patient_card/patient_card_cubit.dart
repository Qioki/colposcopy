import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:colposcopy/core/constants/string.dart';
import 'package:colposcopy/domain/repositories/patients.dart';
import 'package:colposcopy/features/form_engine/domain/form_controller.dart';
import 'package:colposcopy/features/form_engine/domain/models/form_item_data/form_item_data.dart';
import 'package:colposcopy/features/form_engine/domain/models/scheme_item/scheme_item.dart';
import 'package:colposcopy/presentation/validators/required_validator.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'patient_card_state.dart';
part 'patient_card_cubit.freezed.dart';

@injectable
class PatientCardCubit extends Cubit<PatientCardState> {
  PatientCardCubit(this._repository) : super(const PatientCardState.initial()) {
    testInit();
  }
  void testInit() async {
    formGroup = formController.formGroup;
    String jsonString =
        await rootBundle.loadString('assets/jsons/test_protocol.json');
    print(jsonString);
    FormItemData tree = FormItemData.fromJson(jsonDecode(jsonString));
    print(tree.itemType);

    scheme = formController.fidToSchemeItem(tree);
    // emit(const PatientCardState.initial());
  }

  final PatientsRepository _repository;
  final FormController formController = FormController();
  late SchemeItem scheme = SchemeItemContainer.container();

  late FormGroup formGroup; // = FormController().fidToFormGroup(scheme);
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

  void setReadOnly(bool readOnly) {
    emit(const PatientCardState.initial());
    // formGroup.markAsDisabled(updateParent: true, emitEvent: true);
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

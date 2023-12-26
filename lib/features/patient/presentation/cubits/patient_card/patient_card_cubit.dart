import 'package:bloc/bloc.dart';
import 'package:colposcopy/core/constants/string.dart';
import 'package:colposcopy/domain/models/form_item_data/form_item_data.dart';
import 'package:colposcopy/domain/repositories/patients.dart';
import 'package:colposcopy/presentation/validators/required_validator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'patient_card_state.dart';
part 'patient_card_cubit.freezed.dart';

@injectable
class PatientCardCubit extends Cubit<PatientCardState> {
  PatientCardCubit(this._repository)
      : super(const PatientCardState.initial()) {}

  final PatientsRepository _repository;

  late FormGroup formGroup = fidToFormGroup(scheme);
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

  FormGroup fidToFormGroup(FormItemData fid) {
    if (fid.items == null) {
      return FormGroup({
        fid.key: didToFormControl(fid),
      });
    }

    var map = {
      for (var e in fid.items!)
        e.key: e.items != null ? fidToFormGroup(e) : didToFormControl(e)
    };
    return FormGroup(
      map,
    );
  }

  void setReadOnly(bool readOnly) {
    formGroup.markAsDisabled(updateParent: true, emitEvent: true);
  }

  AbstractControl didToFormControl(FormItemData fid) {
    switch (fid.itemType) {
      case FormItemType.inputDate:
        return FormControl<DateTime>(
          value: fid.defaultValue is DateTime
              ? fid.defaultValue as DateTime
              : null,
        );
      case FormItemType.inputLine:
      case FormItemType.inputNotes:
      default:
        return FormControl<String>(
          value: fid.defaultValue is String ? fid.defaultValue as String : null,
          // disabled: true,
        );
    }
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
  late FormItemData scheme = FormItemData(
    key: 'key 2',
    itemType: FormItemType.expander,
    title: 'expansion',
    items: [
      const FormItemData(
        key: 'key 1',
        itemType: FormItemType.inputLine,
        title: 'Firstname',
        // items: [],
        properties: ['vertical'],
        defaultValue: 'Mari',
        hint: 'type firstname',
        validators: ['required'],
        minWidth: 100,
        maxWidth: 100,
        // minHeight: 0,
        // maxHeight: 0,
      ),
      FormItemData(
        key: 'key 3',
        itemType: FormItemType.inputDate,
        title: 'Birthdate',
        // items: [],
        properties: ['vertical'],
        defaultValue: DateTime.now(),
        hint: 'type firstname',
        validators: ['required'],
        minWidth: 100,
        maxWidth: 100,
        // minHeight: 0,
        // maxHeight: 0,
      )
    ],
    // properties: ['vertical'],
  );
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

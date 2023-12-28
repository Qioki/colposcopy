import 'package:reactive_forms/reactive_forms.dart';

class RequiredAppValidator extends Validator<dynamic> {
  const RequiredAppValidator() : super();
  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final error = <String, dynamic>{'Это обязательное поле': true};

    if (control.value == null) {
      return error;
    } else if (control.value is String) {
      return (control.value as String).trim().isEmpty ? error : null;
    }

    return null;
  }
}

class MaxLengthAppValidator extends Validator<dynamic> {
  final int maxLength;
  const MaxLengthAppValidator(this.maxLength) : super();

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final error = <String, dynamic>{'Максимальная длина: $maxLength': true};
    if (control.value == null) {
      return null;
    }

    List<dynamic>? collection;

    if (control is FormArray<dynamic>) {
      collection = control.value;
    } else if (control is FormGroup) {
      collection = control.value.keys.toList();
    } else if (control is FormControl<Iterable<dynamic>>) {
      collection = control.value?.toList();
    } else if (control is FormControl<String> || control.value is String) {
      collection = control.value.toString().runes.toList();
      if (collection.length > maxLength) {
        control.value = control.value.toString().substring(0, maxLength);
        control.markAsTouched();
      }
    }

    return (collection == null || collection.length <= maxLength)
        ? null
        : error;
    // : <String, dynamic>{
    //     ValidationMessage.maxLength: {
    //       'requiredLength': maxLength,
    //       'actualLength': collection.length,
    //     }
    //   };
  }
}

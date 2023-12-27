import 'package:colposcopy/features/form_engine/domain/models/form_item_data/form_item_data.dart';
import 'package:colposcopy/features/form_engine/presentation/form_items.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormController {
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

  // void generateScheme(FormItemData fid) {
  //   switch (fid.itemType) {
  //     case FormItemType.inputLine:
  //       var scheme = SchemeItem(
  //         builder: (p0) {
  //           return FormItemInputLine(p0);
  //         },
  //         fid: fid,
  //       );
  //       break;
  //     case FormItemType.inputDate:
  //       break;
  //     case FormItemType.inputNotes:
  //       break;
  //     default:
  //   }
  // }
}

// class FromItemFactory {
//   FormItem generateFormItem(FormItemData fid) {}
// }

// class SchemeItem<T> {
//   SchemeItem({required this.fid, required this.builder});
//   final FormItemData fid;
//   final FormItem Function(SchemeItem) builder;
//   late T value;
//   // void set (T v) => value = v;

//   Widget build
// }

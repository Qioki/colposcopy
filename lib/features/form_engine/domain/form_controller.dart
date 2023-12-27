import 'package:colposcopy/features/form_engine/domain/models/form_item_data/form_item_data.dart';
import 'package:colposcopy/features/form_engine/domain/models/scheme_item/scheme_item.dart';
import 'package:colposcopy/features/form_engine/presentation/form_items.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormController {
  FormGroup formGroup = FormGroup({});
  SchemeItem fidToSchemeItem(FormItemData fid) {
    try {
      checkProperties(fid);
    } catch (e) {
      print(e);
    }
    print('fidToSchemeItem ${fid.itemType}');
    switch (fid.itemType) {
      // case FormItemType.unknown:
      //   var hasItems = fid.items!.isNotEmpty;
      //   if (hasItems) {
      //     return SchemeItemExpander(fid: fid, formGroup: formGroup)
      //       ..items = fid.items!.map(fidToSchemeItem).toList();
      //   }
      //   return SchemeItemInput(fid: fid, formGroup: formGroup);

      case FormItemType.date:
        formGroup.addAll({fid.key: FormControl<DateTime>()});
        return SchemeItemDate(fid: fid, formGroup: formGroup);

      case FormItemType.input:
        formGroup.addAll({fid.key: FormControl<String>()});
        return SchemeItemInput(fid: fid, formGroup: formGroup);

      case FormItemType.expander:
        return SchemeItemExpander(fid: fid, formGroup: formGroup)
          ..items = fid.items!.map(fidToSchemeItem).toList();
      default:
        throw UnimplementedError();
    }
  }

  void checkProperties(FormItemData fid) {
    if (fid.properties != null && fid.properties!.isNotEmpty) {
      for (var element in fid.properties!) {
        var property = element.toLowerCase();
        switch (property) {
          case 'vertical':
            fid = fid.copyWith(itemType: FormItemType.column);
            break;
          case 'wrap':
            fid = fid.copyWith(itemType: FormItemType.wrap);
            break;
          case 'expander':
            fid = fid.copyWith(itemType: FormItemType.expander);
            break;
          case 'input':
            fid = fid.copyWith(itemType: FormItemType.input);
            break;
          case 'notes':
            fid = fid.copyWith(itemType: FormItemType.notes);
            break;
          case 'date':
            fid = fid.copyWith(itemType: FormItemType.date);
            break;
          case 'radio':
            fid = fid.copyWith(itemType: FormItemType.radio);
            break;
          case 'checkbox':
            fid = fid.copyWith(itemType: FormItemType.checkbox);
            break;
          case 'checkboxgroup':
            fid = fid.copyWith(itemType: FormItemType.checkboxGroup);
            break;
          case 'radiogroup':
            fid = fid.copyWith(itemType: FormItemType.radioGroup);
            break;
        }

        if (property.contains('validator')) {
          if (fid.validators == null) {
            fid = fid.copyWith(validators: []);
          }
          fid.validators!.add(property);
        }
      }
    }
    if (fid.itemType == FormItemType.unknown) {
      var hasItems = fid.items != null && fid.items!.isNotEmpty;
      var hasTitle = fid.title.isNotEmpty;
      if (hasItems) {
        fid = fid.copyWith(itemType: FormItemType.column);
      } else if (hasTitle) {
        fid = fid.copyWith(itemType: FormItemType.text);
      } else {
        throw UnimplementedError();
      }
    }

    if (fid.properties == null) {}
  }

  // FormGroup fidToFormGroup(FormItemData fid) {
  //   if (fid.items == null) {
  //     return FormGroup({
  //       fid.key: didToFormControl(fid),
  //     });
  //   }

  //   var map = {
  //     for (var e in fid.items!)
  //       e.key: e.items != null ? fidToFormGroup(e) : didToFormControl(e)
  //   };
  //   return FormGroup(
  //     map,
  //   );
  // }

  // AbstractControl didToFormControl(FormItemData fid) {
  //   switch (fid.itemType) {
  //     case FormItemType.date:
  //       return FormControl<DateTime>(
  //         value: fid.defaultValue is DateTime
  //             ? fid.defaultValue as DateTime
  //             : null,
  //       );
  //     case FormItemType.input:
  //     case FormItemType.notes:
  //     default:
  //       return FormControl<String>(
  //         value: fid.defaultValue is String ? fid.defaultValue as String : null,
  //         // disabled: true,
  //       );
  //   }
  // }
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

// ValueListenableBuilder

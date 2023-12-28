import 'package:colposcopy/features/form_engine/domain/models/form_item_data/form_item_data.dart';
import 'package:colposcopy/features/form_engine/domain/models/scheme_item/scheme_item.dart';
import 'package:colposcopy/presentation/validators/required_validator.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormController {
  FormGroup formGroup = FormGroup({});
  Map<String, SchemeItem> schemeMap = {};
  // SchemeItem scheme = SchemeItemContainer.empty();

  SchemeItem initItem(SchemeItem item) {
    schemeMap[item.fid.key] = item;
    return item;
  }

  SchemeItem fidToSchemeItem(FormItemData fid) {
    if (fid.title.isEmpty && fid.key.isNotEmpty && titles[fid.key] != null) {
      fid.title = titles[fid.key]!;
    }

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

      case FormItemType.text:
        formGroup.addAll({fid.key: FormControl<String>()});
        return initItem(SchemeItemText(fid: fid, formGroup: formGroup));

      case FormItemType.input:
        var validators = checkValidators(fid);
        formGroup.addAll({
          fid.key: FormControl<String>(
              validators: validators.isEmpty
                  ? [const MaxLengthAppValidator(15)]
                  : validators)
        });

        return initItem(SchemeItemInput(fid: fid, formGroup: formGroup));

      case FormItemType.notes:
        formGroup.addAll(
            {fid.key: FormControl<String>(validators: checkValidators(fid))});
        return initItem(SchemeItemNotes(fid: fid, formGroup: formGroup));

      case FormItemType.date:
        formGroup.addAll(
            {fid.key: FormControl<DateTime>(validators: checkValidators(fid))});
        return initItem(SchemeItemDate(fid: fid, formGroup: formGroup));

      // Containers
      case FormItemType.expander:
        var items = fid.items!.map(fidToSchemeItem).toList();
        return initItem(
            SchemeItemExpander(items: items, fid: fid, formGroup: formGroup));

      case FormItemType.column:
        var items = fid.items!.map(fidToSchemeItem).toList();
        return initItem(
            SchemeItemColumn(items: items, fid: fid, formGroup: formGroup));

      case FormItemType.wrap:
        var items = fid.items!.map(fidToSchemeItem).toList();
        return initItem(
            SchemeItemWrap(items: items, fid: fid, formGroup: formGroup));

      case FormItemType.tabs:
        print('tabs: ${fid.itemType}');
        var items = fid.items!.map(fidToSchemeItem).toList();
        return initItem(
            SchemeItemTabs(items: items, fid: fid, formGroup: formGroup));

      default:
        throw UnimplementedError(fid.itemType.toString());
    }
  }

  void checkProperties(FormItemData fid) {
    if (fid.properties != null && fid.properties!.isNotEmpty) {
      for (var element in fid.properties!) {
        var property = element.toLowerCase();
        switch (property) {
          case 'vertical':
            fid.itemType = FormItemType.column;
            break;
          case 'wrap':
            fid.itemType = FormItemType.wrap;
            break;
          case 'tabs':
            fid.itemType = FormItemType.tabs;
            break;
          case 'expander':
            fid.itemType = FormItemType.expander;
            // fid = fid.copyWith(itemType: FormItemType.expander);
            break;
          case 'input':
            fid.itemType = FormItemType.input;
            // fid = fid.copyWith(itemType: FormItemType.input);
            break;
          case 'notes':
            fid.itemType = FormItemType.notes;
            // fid = fid.copyWith(itemType: FormItemType.notes);
            break;
          case 'date':
            fid.itemType = FormItemType.date;
            // fid = fid.copyWith(itemType: FormItemType.date);
            break;
          case 'radio':
            fid.itemType = FormItemType.radio;
            // fid = fid.copyWith(itemType: FormItemType.radio);
            break;
          case 'checkbox':
            fid.itemType = FormItemType.checkbox;
            // fid = fid.copyWith(itemType: FormItemType.checkbox);
            break;
          case 'checkboxgroup':
            fid.itemType = FormItemType.checkboxGroup;
            // fid = fid.copyWith(itemType: FormItemType.checkboxGroup);
            break;
          case 'radiogroup':
            fid.itemType = FormItemType.radioGroup;
            // fid = fid.copyWith(itemType: FormItemType.radioGroup);
            break;
        }

        if (property.contains('validator')) {
          fid.validators ??= [];
          fid.validators!.add(property.substring('validator'.length));
          print(fid.validators);
        }
      }
    }
    if (fid.itemType == FormItemType.unknown) {
      var hasItems = fid.items != null && fid.items!.isNotEmpty;
      var hasTitle = fid.title.isNotEmpty;
      if (hasItems) {
        fid.itemType = FormItemType.column;

        // fid = fid.copyWith(itemType: FormItemType.column);
      } else if (hasTitle) {
        fid.itemType = FormItemType.text;
        // fid = fid.copyWith(itemType: FormItemType.text);
      } else {
        throw UnimplementedError(fid.itemType.toString());
      }
    }
  }

  List<Validator> checkValidators(FormItemData fid) {
    List<Validator> validators = [];
    if (fid.validators != null && fid.validators!.isNotEmpty) {
      for (var element in fid.validators!) {
        switch (element) {
          case 'required':
            validators.add(const RequiredAppValidator());
            continue;
        }
        if (element.startsWith('max') && element.length > 4) {
          var tryLenght = int.tryParse(element.substring(4));
          print('tryLenght: $tryLenght');
          if (tryLenght != null) {
            validators.add(MaxLengthAppValidator(tryLenght));
          }
        }
      }
    }
    return validators;
  }

  Map<String, String> titles = {};
  void setTitles(Map<String, dynamic> titlesJson) {
    titlesJson.forEach((key, value) => titles[key] = value.toString());
    print('titles: $titles');
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

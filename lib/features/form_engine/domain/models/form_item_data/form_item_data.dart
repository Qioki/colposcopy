// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_item_data.freezed.dart';
part 'form_item_data.g.dart';

@Freezed(equal: false, toStringOverride: false)
// @Freezed(copyWith: false, equal: false, toStringOverride: false)
class FormItemData with _$FormItemData {
  @JsonSerializable(includeIfNull: false)
  const factory FormItemData({
    @Default('') String key,
    @Default(FormItemType.unknown) FormItemType itemType,
    @Default('') String title,
    List<FormItemData>? items,
    List<String>? properties,
    Object? defaultValue,
    String? hint,
    List<String>? validators,
    String? style,
    int? minWidth,
    int? maxWidth,
    int? minHeight,
    int? maxHeight,
  }) = _FormItemData;

  factory FormItemData.fromJson(Map<String, dynamic> json) =>
      _$FormItemDataFromJson(json);
}

enum FormItemType {
  unknown,

  //containers
  tabs,
  expander, // vertical +weight

  // inputs
  input, // TextField
  notes, // TextField
  date, // DateTime
  checkbox,
  radio,

  combobox,

  // imput + container
  // toggleButtonExpander, // CheckBox + Expander
  checkboxGroup,
  radioGroup,

  // runtime
  group, // FormGroup

  text, // title != null && items == null

  // items, // Column / Wrap  // if items != null
  column,
  wrap, // items + horizontal

  // container, // constaints

  // slider,
  // row,
  // root,
  // toggleButton,
  // comboBoxMd,
  // radioButton,
  // verticalExpander,
}

// dynamic value = '';

// String key;
// String title;
// // late BehaviorSubject<Object> subject;
// FormItemType itemType;
// List<FormItemData> items;
// List<String> properties;

// FormItemData({
//   this.key = '',
//   this.title = '',
//   this.items = const [],
//   this.properties = const [],
//   this.itemType = FormItemType.inputLine,
// }) {
//   // subject = BehaviorSubject<Object>.seeded(initialValue);
// }

// // Object? get value => subject.value;
// // set value(Object? newValue) {
// //   if (itemType == FormItemType.CheckBox && newValue == null) {
// //     subject.add(false);
// //   } else {
// //     subject.add(newValue);
// //   }
// // }

// @override
// String toString() => title;

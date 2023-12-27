// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_item_data.freezed.dart';
part 'form_item_data.g.dart';

@Freezed(copyWith: false, equal: false, toStringOverride: false)
class FormItemData with _$FormItemData {
  @JsonSerializable(includeIfNull: false)
  const factory FormItemData({
    @Default('') String key,
    @Default(FormItemType.inputLine) FormItemType itemType,
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
  root, // protocol
  group, // FormGroup
  unknown,
  title, // Text
  inputLine, // TextField
  inputNotes, // TextField
  inputDate, // DateTime
  radioButton,
  checkBox,
  toggleButton,
  toggleButtonExpander, // CheckBox + Expander
  comboBox,
  items, // Column
  wrap,
  expander,
  checkBoxGroup,
  comboBoxMd,
  slider,
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
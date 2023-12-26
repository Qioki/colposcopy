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
}

enum FormItemType {
  unknown,
  title,
  inputLine,
  inputNotes,
  inputDate,
  radioButton,
  checkBox,
  toggleButton,
  toggleButtonExpander,
  comboBox,
  items,
  expander,
  checkBoxGroup,
  comboBoxMd,
  slider,
}

import 'package:colposcopy/features/form_engine/domain/models/form_item_data/form_item_data.dart';
import 'package:colposcopy/features/form_engine/presentation/form_items.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

abstract class SchemeItem<T> {
  SchemeItem({required this.fid, required this.formGroup});
  final FormItemData fid;
  final FormGroup formGroup;
  // ValueNotifier<T> get value;
  Widget build();
}

class SchemeItemContainer extends SchemeItem<String> {
  // SchemeItemContainer({super.fid, required super.formGroup});
  SchemeItemContainer.container()
      : super(fid: FormItemData(), formGroup: FormGroup({}));
  // : super(fid: fid ?? FormItemData(), formGroup: formGroup);

  // @override
  // ValueNotifier<String> get value => _value;
  // final _value = ValueNotifier<String>('');

  @override
  Widget build() => Container();
  // Widget build() => FormItemInputLine(this);
}

class SchemeItemInput extends SchemeItem<String> {
  SchemeItemInput({required super.fid, required super.formGroup});

  // @override
  // ValueNotifier<String> get value => _value;
  // final _value = ValueNotifier<String>('');

  @override
  Widget build() => FormItemInputLine(this);
}

class SchemeItemDate extends SchemeItem<String> {
  SchemeItemDate({required super.fid, required super.formGroup});

  // @override
  // ValueNotifier<String> get value => _value;
  // final _value = ValueNotifier<String>('');

  @override
  Widget build() => FormItemDate(this);
}

class SchemeItemExpander extends SchemeItem<bool> {
  SchemeItemExpander({required super.fid, required super.formGroup});

  late List<SchemeItem> items;

  // @override
  // ValueNotifier<bool> get value => _valueNotifier;
  // final _valueNotifier = ValueNotifier<bool>(false);

  @override
  Widget build() => FormItemExpander(this);
}






  // @override
  // String get value {
  //   return _value;
  // }

  // @override
  // set value(String val) {
  //   formGroup.controls[fid.key]?.value = val;
  //   _value = val;
  // }

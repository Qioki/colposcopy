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

abstract class SchemeItems<T> extends SchemeItem<T> {
  SchemeItems(
      {required this.items, required super.fid, required super.formGroup});
  final List<SchemeItem> items;
}

// Containers
class SchemeItemContainer extends SchemeItem {
  SchemeItemContainer(
      {this.item, required super.fid, required super.formGroup});
  SchemeItemContainer.empty()
      : item = null,
        super(fid: FormItemData(), formGroup: FormGroup({}));

  final SchemeItem? item;
  @override
  Widget build() => Container(child: item?.build());
}

class SchemeItemColumn extends SchemeItems {
  SchemeItemColumn({
    required super.items,
    required super.fid,
    required super.formGroup,
  });

  @override
  Widget build() => Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [for (var item in items) item.build()],
        ),
      );
}

class SchemeItemWrap extends SchemeItems {
  SchemeItemWrap({
    required super.items,
    required super.fid,
    required super.formGroup,
  });

  @override
  Widget build() => Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Wrap(
          spacing: 30,
          runSpacing: 0,
          children: [for (var item in items) item.build()],
        ),
      );
}

class SchemeItemTabs extends SchemeItems {
  SchemeItemTabs({
    required super.items,
    required super.fid,
    required super.formGroup,
  });

  @override
  Widget build() => FormItemTabs(this);
}

class SchemeItemExpander extends SchemeItems<bool> {
  SchemeItemExpander(
      {required super.items, required super.fid, required super.formGroup}) {
    _value.addListener(onExpand);
  }

  ValueNotifier<bool> get value => _value;
  final _value = ValueNotifier<bool>(false);
  ExpansionTileController controller = ExpansionTileController();

  @override
  Widget build() {
    print('si expander build');
    controller = ExpansionTileController();
    _value.removeListener(onExpand);
    _value.addListener(onExpand);
    return FormItemExpander(this);
  }

  void onExpand() {
    print('ssss');
    if (value.value) {
      controller.collapse();
    } else {
      controller.expand();
    }
    // controller.expanded = _value.value;
  }
}

// Inputs
class SchemeItemInput extends SchemeItem<String> {
  SchemeItemInput({
    required super.fid,
    required super.formGroup,
  });

  // ValueNotifier<String> get value => _value;
  // final _value = ValueNotifier<String>('');
  @override
  Widget build() => FormItemInputLine(this);
}

class SchemeItemNotes extends SchemeItem<String> {
  SchemeItemNotes({
    required super.fid,
    required super.formGroup,
  });
  @override
  Widget build() => FormItemInputLine(this);
}

class SchemeItemDate extends SchemeItem<String> {
  SchemeItemDate({required super.fid, required super.formGroup});

  @override
  Widget build() => FormItemDate(this);
}

class SchemeItemText extends SchemeItem<String> {
  SchemeItemText({required super.fid, required super.formGroup});

  @override
  Widget build() => Text(fid.title);
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

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:colposcopy/domain/repositories/protocols.dart';
import 'package:colposcopy/features/form_engine/domain/form_controller.dart';
import 'package:colposcopy/features/form_engine/domain/models/form_item_data/form_item_data.dart';
import 'package:colposcopy/features/form_engine/domain/models/scheme_item/scheme_item.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'protocol_state.dart';
part 'protocol_cubit.freezed.dart';

@injectable
class ProtocolCubit extends Cubit<ProtocolState> {
  ProtocolCubit(this._protocolRepository)
      : super(const ProtocolState.initial());

  final ProtocolRepository _protocolRepository;

  final FormController formController = FormController();
  late SchemeItem scheme = SchemeItemContainer.empty();

  FormGroup formGroup = FormGroup({});

  @postConstruct
  void init() {
    testInit();
  }

  void testInit() async {
    formGroup = formController.formGroup;

    Map<String, dynamic> titlesJson = jsonDecode(
        await rootBundle.loadString('assets/jsons/protocol_keys.json'));
    formController.setTitles(titlesJson);

    String jsonString =
        await rootBundle.loadString('assets/jsons/test_protocol.json');
    // var json = _protocolRepository.getProtocolJson();
    var json = jsonDecode(jsonString);
    print(json);
    // print(protocolJson);
    FormItemData tree = FormItemData.fromJson(json);

    scheme = formController.fidToSchemeItem(tree);
    emit(const ProtocolState.initial());
  }

  void clearForm() {
    formGroup.reset();
  }

  void setReadOnly(bool readOnly) {
    emit(const ProtocolState.initial());
    // formGroup.markAsDisabled(updateParent: true, emitEvent: true);
  }
}

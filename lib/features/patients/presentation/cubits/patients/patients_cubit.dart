import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:colposcopy/core/constants/string.dart';
import 'package:colposcopy/domain/models/patient/patient.dart';
import 'package:colposcopy/domain/repositories/patients.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'patients_state.dart';
part 'patients_cubit.freezed.dart';

@injectable
class PatientsCubit extends Cubit<PatientsState> {
  final DateFormat _dateOnlyFormatter = DateFormat('dd.MM.yyyy');

  PatientsCubit(this._repository) : super(const PatientsState.initial()) {
    _subscription = _repository.watchPatients().listen((event) {
      patients = event;
      print('PatientsCubit ${patients.length}');
      onSearchTextChanged(searchText);
    });
  }
  final PatientsRepository _repository;

  StreamSubscription<List<Patient>>? _subscription;

  List<Patient> patients = [];
  List<Patient> filteredPatients = [];
  List<DataRow2> filteredRows = [];

  String searchText = '';
  Patient? selectedPatient;
  int selectedRowIndex = -1;

  final signUpForm = fb.group({
    SearchFormKeys.search: FormControl<String>(value: ''),
  });

  void tryOpenPatient() {}

  bool tryLogout() {
    return true;
  }

  void onSearchTextChanged(String text) async {
    selectedPatient = null;
    print('onSearchTextChanged ${text}');
    searchText = text;

    if (searchText == '') {
      filteredPatients = [...patients];
    } else {
      var textItems = searchText.toLowerCase().split(' ');
      filteredPatients = patients
          .where((Patient item) =>
              textItems.every((textItem) => _ifTextContaints(item, textItem)))
          .toList();
    }

    prepareDataRows();
  }

  void onRowSelectChanged(Patient patient) {
    print('onRowSelectChanged ${patient.firstname}');
    selectedPatient = patient;
    selectedRowIndex = filteredPatients.indexOf(patient);
    prepareDataRows();
  }

  void prepareDataRows() {
    filteredRows = filteredPatients.map(toDataRow).toList();
    emit(PatientsState.filtered(filteredRows));
  }

  Timer doubleTabTimer = Timer(const Duration(milliseconds: 300), () {});
  Patient? lastPressedPatient;

  DataRow2 toDataRow(Patient patient) {
    var selected = patient == selectedPatient;
    var row = DataRow2(
      cells: getCells(patient, selected),
      selected: selected,
      onSelectChanged: (value) {
        print('value $value $patient');
        onRowSelectChanged(patient);
        if (doubleTabTimer.isActive) {
          print('doubleTapEvent ${lastPressedPatient == patient}');
        } else {
          lastPressedPatient = patient;
          doubleTabTimer = Timer(const Duration(milliseconds: 300), () {});
        }
      },
      // onSecondaryTapDown: (details) {},
    );
    return row;
  }

  // TODO: selected style
  List<DataCell> getCells(Patient e, bool selected) {
    FontWeight? fontWeight = selected ? FontWeight.w600 : null;
    return [
      DataCell(Text(
        '${e.lastname} ${e.firstname} ${e.patronymic ?? ''}',
        style: TextStyle(fontWeight: fontWeight),
      )),
      DataCell(Text(
        e.birthday == null ? '' : _dateOnlyFormatter.format(e.birthday!),
        style: TextStyle(fontWeight: fontWeight),
      )),
      DataCell(Text(
        e.phone ?? '',
        style: TextStyle(fontWeight: fontWeight),
      )),
      DataCell(Text(
        e.email ?? '',
        style: TextStyle(fontWeight: fontWeight),
      )),
      DataCell(Text(
        e.snils ?? '',
        style: TextStyle(fontWeight: fontWeight),
      )),
      DataCell(Text(
        e.policy ?? '',
        style: TextStyle(fontWeight: fontWeight),
      )),
    ];
  }

  var patientColumns = const [
    DataColumn(label: Text(Strings.patientFullnameShort)),
    DataColumn(label: Text(Strings.patientBirthday)),
    DataColumn(label: Text(Strings.personPhone)),
    DataColumn(label: Text(Strings.personEmail)),
    DataColumn(label: Text(Strings.patientSnils)),
    DataColumn(label: Text(Strings.patientPolicy)),
  ];

  // Search
  bool _ifTextContaints(Patient item, String textItem) {
    var stringBuffer = StringBuffer([
      item.lastname.toLowerCase(),
      item.firstname.toLowerCase(),
      item.patronymic?.toLowerCase(),
      item.phone?.toLowerCase(),
      item.email?.toLowerCase(),
      item.snils?.toLowerCase(),
    ]);
    return stringBuffer.toString().contains(textItem);
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}

class SearchFormKeys {
  static const search = 'search';
  static const firstname = 'firstname';
  static const lastname = 'lastname';
  static const patronymic = 'patronymic';
}

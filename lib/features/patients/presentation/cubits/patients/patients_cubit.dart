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

part 'patients_state.dart';
part 'patients_cubit.freezed.dart';

@injectable
class PatientsCubit extends Cubit<PatientsState> {
  // final String _dateOnlyFormat = 'dd.MM.yyyy';
  final DateFormat _dateOnlyFormatter = DateFormat('dd.MM.yyyy');

  PatientsCubit(this._repository) : super(const PatientsState.initial()) {
    _subscription = _repository.watchPatients().listen((event) {
      patients = event;
      print('PatientsCubit ${patients.length}');
      onSearchTextChanged(searchText);
    });
  }
  StreamSubscription<List<Patient>>? _subscription;

  List<Patient> patients = [];
  List<Patient> filteredPatients = [];
  List<DataRow2> filteredRows = [];

  String searchText = '';
  Patient? selectedPatient;
  int selectedRowIndex = -1;

  final PatientsRepository _repository;

  tryOpenPatient() {}

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

  // final StringBuffer stringBuffer = StringBuffer([]);
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

  void prepareDataRows() {
    filteredRows = filteredPatients.map(toDataRow).toList();
    emit(PatientsState.filtered(filteredRows));
  }

  DataRow2 toDataRow(Patient patient) {
    var selected = patient == selectedPatient;
    var row = DataRow2(
      cells: getCells(patient),
      selected: selected,
      onSelectChanged: (value) {
        print('value $value $patient');
        onRowSelectChanged(patient);
      },
      // onDoubleTap: () {
      //   print('onDoubleTap');
      // }
    );
    return row;
  }

  void onRowSelectChanged(Patient patient) {
    selectedPatient = patient;
    selectedRowIndex = filteredPatients.indexOf(patient);
    prepareDataRows();
  }

  List<DataCell> getCells(Patient e) => [
        DataCell(Text('${e.lastname} ${e.firstname} ${e.patronymic ?? ''}')),
        DataCell(Text(
            e.birthday == null ? '' : _dateOnlyFormatter.format(e.birthday!))),
        // DataCell(Text(e.birthday == null ? '' : e.birthday!.toString())),
        DataCell(Text(e.phone ?? '')),
        DataCell(Text(e.email ?? '')),
        DataCell(Text(e.snils ?? '')),
        DataCell(Text(e.policy ?? '')),
      ];

  var patientColumns = const [
    DataColumn(label: Text(Strings.patientFullnameShort)),
    DataColumn(label: Text(Strings.patientBirthday)),
    DataColumn(label: Text(Strings.personPhone)),
    DataColumn(label: Text(Strings.personEmail)),
    DataColumn(label: Text(Strings.patientSnils)),
    DataColumn(label: Text(Strings.patientPolicy)),
  ];

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}

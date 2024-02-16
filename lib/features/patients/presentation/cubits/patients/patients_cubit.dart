import 'dart:async';
import 'package:colposcopy/domain/controllers/visit_controller.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:bloc/bloc.dart';

import 'package:colposcopy/core/constants/strings.dart';
import 'package:colposcopy/domain/models/patient/patient.dart';
import 'package:colposcopy/domain/repositories/patients.dart';
import 'package:colposcopy/domain/repositories/visits.dart';

part 'patients_state.dart';
part 'patients_cubit.freezed.dart';

@injectable
class PatientsCubit extends Cubit<PatientsState> {
  PatientsCubit(this._repository, this._visitsRepository, this._visitController)
      : super(const PatientsState.initial()) {
    _subscription = _repository.watchPatients().listen((event) {
      patients = event;
      onSearchTextChanged(searchText);
    });
  }
  final PatientsRepository _repository;
  final VisitsRepository _visitsRepository;
  final VisitController _visitController;

  final DateFormat _dateOnlyFormatter = DateFormat('dd.MM.yyyy');

  StreamSubscription<List<Patient>>? _subscription;

  List<Patient> patients = [];
  List<Patient> filteredItems = [];
  List<DataRow2> filteredRows = [];

  String searchText = '';
  Patient? selectedItem;

  Timer searchDelayTimer = Timer(const Duration(milliseconds: 700), () {});

  Timer doubleTapTimer = Timer(const Duration(milliseconds: 300), () {});
  Patient? lastPressedItem;

  void onRowSelectChanged(Patient item) {
    print('onRowSelectChanged ${item.firstname}');
    selectedItem = item;
    _visitsRepository.setActivePatient(item.patientId!);
    prepareDataRows();

    if (doubleTapTimer.isActive) {
      // print('doubleTap'); // TODO add double tap
    } else {
      lastPressedItem = item;
      doubleTapTimer = Timer(const Duration(milliseconds: 300), () {});
    }
  }

  void prepareDataRows() {
    filteredRows = filteredItems.map(toDataRow).toList();
    emit(PatientsState.filtered(filteredRows));
  }

  DataRow2 toDataRow(Patient patient) {
    var selected = patient == selectedItem;
    var row = DataRow2(
      cells: getCells(patient, selected),
      selected: selected,
      onSelectChanged: (value) {
        print('value $value $patient');
        onRowSelectChanged(patient);
      },
    );
    return row;
  }

  List<DataCell> getCells(Patient e, bool selected) {
    FontWeight? fontWeight = selected ? FontWeight.w600 : null;
    return [
      DataCell(Text(
        '${e.lastname} ${e.firstname} ${e.patronymic ?? ''}',
        style: TextStyle(fontWeight: fontWeight),
        maxLines: 1,
      )),
      DataCell(Text(
        e.birthdate == null ? '' : _dateOnlyFormatter.format(e.birthdate!),
        style: TextStyle(fontWeight: fontWeight),
      )),
      DataCell(Text(
        e.phone ?? '',
        style: TextStyle(fontWeight: fontWeight),
      )),
      DataCell(Text(
        e.snils ?? '',
        style: TextStyle(fontWeight: fontWeight),
        maxLines: 1,
      )),
      DataCell(Text(
        e.policy ?? '',
        style: TextStyle(fontWeight: fontWeight),
        maxLines: 1,
      )),
    ];
  }

  var columns = const [
    DataColumn2(size: ColumnSize.L, label: Text(Strings.patientFullnameShort)),
    DataColumn2(size: ColumnSize.S, label: Text(Strings.patientBirthday)),
    DataColumn2(size: ColumnSize.S, label: Text(Strings.personPhone)),
    DataColumn2(size: ColumnSize.S, label: Text(Strings.patientSnils)),
    DataColumn2(size: ColumnSize.S, label: Text(Strings.patientPolicy)),
  ];

  // Search
  void onSearchTextChanged(String text) async {
    if (searchDelayTimer.isActive) {
      searchDelayTimer.cancel();
    }
    searchDelayTimer = Timer(const Duration(milliseconds: 400), () {
      delayedPatientSearch(text);
    });
  }

  void delayedPatientSearch(String text) {
    selectedItem = null;
    searchText = text;

    if (searchText == '') {
      filteredItems = [...patients];
    } else {
      var textItems = searchText.toLowerCase().split(' ');
      filteredItems = patients
          .where((Patient item) =>
              textItems.every((textItem) => _ifTextContaints(item, textItem)))
          .toList();
    }

    prepareDataRows();
  }

  StringBuffer stringBuffer = StringBuffer();
  bool _ifTextContaints(Patient item, String textItem) {
    stringBuffer.clear();
    stringBuffer.write([
      item.lastname.toLowerCase(),
      item.firstname.toLowerCase(),
      item.patronymic?.toLowerCase(),
      item.birthdate != null
          ? _dateOnlyFormatter.format(item.birthdate!)
          : null,
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

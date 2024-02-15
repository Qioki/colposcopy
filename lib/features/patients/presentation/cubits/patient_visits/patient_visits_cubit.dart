import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:colposcopy/core/constants/strings.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:colposcopy/domain/models/visit/visit.dart';
import 'package:colposcopy/domain/repositories/visits.dart';
import 'package:intl/intl.dart';

part 'patient_visits_state.dart';
part 'patient_visits_cubit.freezed.dart';

@injectable
class PatientVisitsCubit extends Cubit<PatientVisitsState> {
  PatientVisitsCubit(this._repository)
      : super(const PatientVisitsState.initial());

  void tryOpenVisit() {}

  @postConstruct
  void init() {
    if (_subscription != null) return;
    _subscription = _repository.visitsWithActivePatientStream.listen((event) {
      print('visits ${event.length}');
      // visits = event;
      filteredItems = event;
    });
  }

  final DateFormat _dateOnlyFormatter = DateFormat('dd.MM.yyyy');

  final VisitsRepository _repository;
  StreamSubscription<List<Visit>>? _subscription;

  // List<Visit> visits = [];
  List<Visit> filteredItems = [];
  List<DataRow2> filteredRows = [];

  String searchText = '';
  Visit? selectedItem;

  Timer doubleTabTimer = Timer(const Duration(milliseconds: 300), () {});
  Visit? lastPressedItem;

  void onRowSelectChanged(Visit item) {
    print('onRowSelectChanged ${item.patientId}');
    selectedItem = item;
    prepareDataRows();

    if (doubleTabTimer.isActive) {
      // print('doubleTab');
    } else {
      lastPressedItem = item;
      doubleTabTimer = Timer(const Duration(milliseconds: 300), () {});
    }
  }

  void prepareDataRows() {
    filteredRows = filteredItems.map(toDataRow).toList();
    emit(PatientVisitsState.filtered(filteredRows));
  }

  DataRow2 toDataRow(Visit patient) {
    var selected = patient == selectedItem;
    var row = DataRow2(
      cells: getCells(patient, selected),
      selected: selected,
      onSelectChanged: (value) {
        print('value $value $patient');
        onRowSelectChanged(patient);
      },
      // onSecondaryTapDown: (details) {},
    );
    return row;
  }

  List<DataCell> getCells(Visit e, bool selected) {
    FontWeight? fontWeight = selected ? FontWeight.w600 : null;
    return [
      // DataCell(Text(
      //   '${e.lastname} ${e.firstname} ${e.patronymic ?? ''}',
      //   style: TextStyle(fontWeight: fontWeight),
      // )),
      DataCell(Text(
        _dateOnlyFormatter.format(e.visitDate!),
        style: TextStyle(fontWeight: fontWeight),
      )),
      // DataCell(Text(
      //   e.phone ?? '',
      //   style: TextStyle(fontWeight: fontWeight),
      // )),
    ];
  }

  var columns = const [
    // DataColumn2(size: ColumnSize.L, label: Text(Strings.patientFullnameShort)),
    DataColumn2(size: ColumnSize.S, label: Text(Strings.date)),
    // DataColumn2(size: ColumnSize.S, label: Text(Strings.patientPolicy)),
  ];
}

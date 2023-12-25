import 'package:colposcopy/core/constants/string.dart';
import 'package:colposcopy/domain/models/patient/patient.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PatientsDataTableSource extends DataTableSource {
  PatientsDataTableSource.empty() {
    patients = [];
  }

  PatientsDataTableSource(
      // this.context,
      [sortedByCalories = false,
      this.hasRowTaps = false,
      this.hasRowHeightOverrides = false,
      this.hasZebraStripes = false]) {
    // desserts = _desserts;
    if (sortedByCalories) {
      sort((d) => d.firstname, true);
    }
  }

  // final BuildContext context;
  late List<Patient> patients;
  bool hasRowTaps = false;
  bool hasRowHeightOverrides = false;
  bool hasZebraStripes = false;

  void sort<T>(Comparable<T> Function(Patient d) getField, bool ascending) {
    patients.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    notifyListeners();
  }

  @override
  DataRow getRow(int index, [Color? color]) {
    final format = NumberFormat.decimalPercentPattern(
      locale: 'en',
      decimalDigits: 0,
    );
    assert(index >= 0);
    if (index >= patients.length) throw 'index > _desserts.length';
    final item = patients[index];
    return DataRow2.byIndex(
      index: index,
      // selected: dessert.selected,
      // color: color != null
      //     ? MaterialStateProperty.all(color)
      //     : (hasZebraStripes && index.isEven
      //         ? MaterialStateProperty.all(Theme.of(context).highlightColor)
      //         : null),
      onSelectChanged: (value) {
        // if (dessert.selected != value) {
        //   _selectedCount += value! ? 1 : -1;
        //   assert(_selectedCount >= 0);
        //   dessert.selected = value;
        //   notifyListeners();
        // }
      },
      onTap: hasRowTaps ? () => print('Tapped on row ${item.firstname}') : null,
      onDoubleTap: hasRowTaps
          ? () => print('Double Tapped on row ${item.lastname}')
          : null,
      // onLongPress: hasRowTaps
      //     ? () => print( 'Long pressed on row ${dessert.name}')
      //     : null,
      // onSecondaryTap: hasRowTaps
      //     ? () => print('Right clicked on row ${dessert.name}')
      //     : null,
      // onSecondaryTapDown: hasRowTaps
      //     ? (d) =>
      //         print( 'Right button down on row ${dessert.name}')
      //     : null,
      // specificRowHeight:
      //     hasRowHeightOverrides && dessert.fat >= 25 ? 100 : null,
      cells: [
        DataCell(Text(item.lastname)),
        DataCell(Text(item.firstname)),
        DataCell(Text(item.patronymic ?? '')),
        // DataCell(Text(dessert.name)),
        // DataCell(Text('${item.calories}'),
        //     onTap: () => print(
        //         'Tapped on a cell with "${item.calories}"')),
        // DataCell(Text(item.fat.toStringAsFixed(1))),
        // DataCell(Text('${item.carbs}')),
        // DataCell(Text(item.protein.toStringAsFixed(1))),
        // DataCell(Text('${item.sodium}')),
        // DataCell(Text(format.format(item.calcium / 100))),
        // DataCell(Text(format.format(item.iron / 100))),
      ],
    );
  }

  var patientColumns = const [
    DataColumn(label: Text(Strings.patientFullnameShort)),
    DataColumn(label: Text(Strings.patientBirthday)),
    DataColumn(label: Text(Strings.personPhone)),
    // DataColumn(label: Text(Strings.personEmail)),
    // DataColumn(label: Text(Strings.patientSnils)),
    // DataColumn(label: Text(Strings.patientPolicy)),
  ];
  // List<DataRow> get patientRows => searchPatients.map((e) {
  //       return DataRow(
  //         cells: [
  //           DataCell(Text(e.lastname)),
  //           DataCell(Text(e.firstname)),
  //           DataCell(Text(e.patronymic ?? '')),
  //         ],
  //         onSelectChanged: (value) {
  //           // selected = true;
  //           print('value $value $e');
  //         },
  //       );
  //     }).toList();
  @override
  int get rowCount => patients.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 1;

  // void selectAll(bool? checked) {
  //   for (final dessert in patients) {
  //     dessert.selected = checked ?? false;
  //   }
  //   _selectedCount = (checked ?? false) ? patients.length : 0;
  //   notifyListeners();
  // }

  // void updateSelectedDesserts(RestorableDessertSelections selectedRows) {
  //   _selectedCount = 0;
  //   for (var i = 0; i < desserts.length; i += 1) {
  //     var dessert = desserts[i];
  //     if (selectedRows.isSelected(i)) {
  //       dessert.selected = true;
  //       _selectedCount += 1;
  //     } else {
  //       dessert.selected = false;
  //     }
  //   }
  //   notifyListeners();
  // }
}

import 'package:bloc/bloc.dart';
import 'package:colposcopy/domain/models/patient/patient.dart';
import 'package:colposcopy/domain/repositories/patients.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'patients_state.dart';
part 'patients_cubit.freezed.dart';

@injectable
class PatientsCubit extends Cubit<PatientsState> {
  PatientsCubit(this._repository) : super(const PatientsState.initial()) {
    _repository.watchPatients().listen((event) {
      patients = event;
      // searchPatients = [...event];
      print('PatientsCubit ${patients.length}');
      emit(PatientsState.search(patients));
    });
  }

  List<Patient> patients = [];
  List<Patient> searchPatients = [];

  final PatientsRepository _repository;

  void onSearchTextChanged(String text) {
    print(text);
    if (text == '') {
      emit(PatientsState.search(patients));
      // return const Iterable<User>.empty();
    }
    var textItems = text.toLowerCase().split(' ');
    searchPatients = patients
        .where((Patient item) =>
            textItems.every((textItem) => _ifTextContaints(item, textItem)))
        .toList();
    emit(PatientsState.search(searchPatients));
    // searchPatients = patients.where((element) {
    //   return element.name.toLowerCase().contains(text.toLowerCase());
    // })
  }

  bool _ifTextContaints(Patient item, String textItem) =>
      item.lastname.toLowerCase().contains(textItem) ||
      item.firstname.toLowerCase().contains(textItem) ||
      (item.patronymic != null
          ? item.patronymic!.toLowerCase().contains(textItem)
          : false);
}

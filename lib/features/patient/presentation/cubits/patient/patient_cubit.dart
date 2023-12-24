import 'package:bloc/bloc.dart';
import 'package:colposcopy/domain/repositories/patients.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'patient_state.dart';
part 'patient_cubit.freezed.dart';

@injectable
class PatientCubit extends Cubit<PatientState> {
  PatientCubit(this._repository) : super(PatientState.initial());

  PatientsRepository _repository;
}

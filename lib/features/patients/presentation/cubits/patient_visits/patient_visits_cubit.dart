import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'patient_visits_state.dart';
part 'patient_visits_cubit.freezed.dart';

@injectable
class PatientVisitsCubit extends Cubit<PatientVisitsState> {
  PatientVisitsCubit() : super(const PatientVisitsState.initial());
}

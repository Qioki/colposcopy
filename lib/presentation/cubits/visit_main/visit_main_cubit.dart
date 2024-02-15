import 'package:bloc/bloc.dart';
import 'package:colposcopy/domain/models/patient/patient.dart';
import 'package:colposcopy/domain/models/visit/visit.dart';
import 'package:colposcopy/presentation/routes/app_router.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'visit_main_state.dart';
part 'visit_main_cubit.freezed.dart';

@injectable
class VisitMainCubit extends Cubit<VisitMainState> {
  VisitMainCubit() : super(const VisitMainState.patient());
  void patientMode() {
    emit(const VisitMainState.patient());
  }

  void visitMode() {
    emit(const VisitMainState.visit());
  }

  // void editPatient() {
  //   emit(const VisitMainState.patient());
  // }

  // void savePatient() {}

  // void newVisit(Patient patient) {
  //   emit(const VisitMainState.visit());
  // }

  // void viewVisit(Patient patient, Visit visit) {
  //   emit(const VisitMainState.visit());
  // }
}

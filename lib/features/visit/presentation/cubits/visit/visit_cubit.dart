import 'package:bloc/bloc.dart';
import 'package:colposcopy/domain/repositories/visits.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'visit_state.dart';
part 'visit_cubit.freezed.dart';

@injectable
class VisitCubit extends Cubit<VisitState> {
  VisitCubit(this._repository) : super(const VisitState.patientPreview());
  final VisitsRepository _repository;

  void startVisit() {}
}

import 'package:colposcopy/domain/repositories/patients.dart';
import 'package:colposcopy/domain/repositories/visits.dart';
import 'package:injectable/injectable.dart';

import 'package:colposcopy/domain/models/patient/patient.dart';
import 'package:colposcopy/domain/models/visit/visit.dart';

@singleton
class VisitController {
  VisitController(this._patientsRepository, this._visitsRepository);

  final PatientsRepository _patientsRepository;
  final VisitsRepository _visitsRepository;

  Patient? activePatient;
  Visit? activeVisit;

  void setActivePatient(Patient patient) {
    activePatient = patient;
  }

  void setActiveVisit(Visit visit) {
    activeVisit = visit;
  }
}

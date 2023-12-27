import 'package:colposcopy/domain/models/patient/patient.dart' as model;

abstract class PatientsDatasource {
  Future<List<model.Patient>> getPatients();
  Stream<List<model.Patient>> watchPatients();
  Future<model.Patient?> getPatientById(int id);
  Future<int> addPatient(model.Patient item);
  Future<void> deletePatientWithId(int id);
  Future<void> updatePatient(model.Patient item);
}

import 'package:colposcopy/domain/models/patient/patient.dart';

abstract class PatientsRepository {
  Future<List<Patient>> getPatients();
  Stream<List<Patient>> watchPatients();
  Future<Patient> getPatientById(int id);
  Future<int> addPatient(Patient item);
  Future<void> deletePatientWithId(int id);
  Future<void> updatePatient(Patient item);
}

import 'package:colposcopy/data/datasources/base/patients.dart';
import 'package:colposcopy/domain/models/patient/patient.dart';
import 'package:colposcopy/domain/repositories/patients.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PatientsRepository)
class PatientsRepositoryImpl extends PatientsRepository {
  PatientsRepositoryImpl({required this.datasource});
  PatientsDatasource datasource;

  @override
  Future<List<Patient>> getPatients() => datasource.getPatients();

  @override
  Stream<List<Patient>> watchPatients() => datasource.watchPatients();

  @override
  Future<Patient?> getPatientById(int id) => datasource.getPatientById(id);

  @override
  Future<int> addPatient(Patient item) => datasource.addPatient(item);

  @override
  Future<void> deletePatientWithId(int id) =>
      datasource.deletePatientWithId(id);

  @override
  Future<void> updatePatient(Patient item) => datasource.updatePatient(item);
}

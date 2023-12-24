import 'package:colposcopy/data/datasources/drift/database/database.dart';
import 'package:colposcopy/data/datasources/drift/mappers/patient.dart';
import 'package:colposcopy/data/datasources/base/patients.dart';
import 'package:colposcopy/domain/models/patient/patient.dart' as model;
import 'package:injectable/injectable.dart';

@LazySingleton(as: PatientsDatasource)
class PatientsDatasourceImpl extends PatientsDatasource {
  PatientsDatasourceImpl({required this.database});

  final Database database;

  @override
  Future<int> addPatient(model.Patient item) =>
      database.into(database.patients).insert(PatientsCompanion.insert(
          userId: item.userId,
          state: item.state,
          firstname: item.firstname,
          lastname: item.lastname));

  @override
  Future<void> deletePatientWithId(int id) =>
      (database.delete(database.patients)
            ..where((tbl) => tbl.patientId.equals(id)))
          .go();

  @override
  Future<model.Patient> getPatientById(int id) =>
      (database.select(database.patients)
            ..where((tbl) => tbl.patientId.equals(id)))
          .getSingle()
          .then(PatientMapper.toModel);

  @override
  Future<List<model.Patient>> getPatients() =>
      database.select(database.patients).get().then(PatientMapper.toModelList);

  @override
  Future<void> updatePatient(model.Patient item) =>
      database.update(database.patients).replace(PatientMapper.toEntity(item));

  @override
  Stream<List<model.Patient>> watchPatients() =>
      database.select(database.patients).watch().map(PatientMapper.toModelList);
}

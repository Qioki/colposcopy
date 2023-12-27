import 'package:colposcopy/data/datasources/drift/database/database.dart';
import 'package:colposcopy/data/datasources/drift/mappers/patient.dart';
import 'package:colposcopy/data/datasources/base/patients.dart';
import 'package:colposcopy/domain/models/patient/patient.dart' as model;
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PatientsDatasource)
class PatientsDatasourceImpl extends PatientsDatasource {
  PatientsDatasourceImpl({required this.database});

  final Database database;

  @override
  Future<int> addPatient(model.Patient item) => database
      .into(database.patients)
      .insert(PatientsCompanion.insert(
        userId: item.userId,
        state: Value(item.state),
        firstname: item.firstname,
        lastname: item.lastname,
        patronymic: item.patronymic != null
            ? Value(item.patronymic)
            : const Value.absent(),
        phone:
            item.patronymic != null ? Value(item.phone) : const Value.absent(),
        email:
            item.patronymic != null ? Value(item.email) : const Value.absent(),
        birthdate: item.patronymic != null
            ? Value(item.birthdate)
            : const Value.absent(),
        snils:
            item.patronymic != null ? Value(item.snils) : const Value.absent(),
        policy:
            item.patronymic != null ? Value(item.policy) : const Value.absent(),
        card: item.patronymic != null ? Value(item.card) : const Value.absent(),
      ));

  @override
  Future<void> deletePatientWithId(int id) =>
      (database.delete(database.patients)
            ..where((tbl) => tbl.patientId.equals(id)))
          .go();

  @override
  Future<model.Patient?> getPatientById(int id) async => await (database
          .select(database.patients)
        ..where((tbl) => tbl.patientId.equals(id)))
      .get()
      .then(
          (value) => value.isEmpty ? null : PatientMapper.toModel(value.first));

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

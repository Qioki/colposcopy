import 'package:colposcopy/data/datasources/drift/database/database.dart';
import 'package:colposcopy/domain/models/patient/patient.dart' as model;

// PatientMapper
class PatientMapper {
  static model.Patient toModel(Patient entity) => model.Patient(
        patientId: entity.patientId,
        userId: entity.userId,
        state: entity.state,
        firstname: entity.firstname,
        lastname: entity.lastname,
        patronymic: entity.patronymic,
        phone: entity.phone,
        email: entity.email,
        birthdate: entity.birthdate,
        snils: entity.snils,
        policy: entity.policy,
        card: entity.card,
      );

  static List<model.Patient> toModelList(List<Patient> entities) =>
      entities.map(toModel).toList();

  static Patient toEntity(model.Patient model) => Patient(
        patientId: model.patientId,
        userId: model.userId,
        state: model.state,
        firstname: model.firstname,
        lastname: model.lastname,
        patronymic: model.patronymic,
        phone: model.phone,
        email: model.email,
        birthdate: model.birthdate,
        snils: model.snils,
        policy: model.policy,
        card: model.card,
      );
}

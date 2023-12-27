import 'package:colposcopy/data/datasources/drift/database/database.dart';
import 'package:colposcopy/data/datasources/drift/mappers/visit.dart';
import 'package:colposcopy/data/datasources/base/visits.dart';
import 'package:colposcopy/domain/models/visit/visit.dart' as model;
import 'package:colposcopy/domain/models/media/media.dart' as model;
import 'package:colposcopy/domain/models/image/image.dart' as model;
import 'package:colposcopy/domain/models/protocol/protocol.dart' as model;
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: VisitsDatasource)
class VisitsDatasourceImpl extends VisitsDatasource {
  VisitsDatasourceImpl({required this.database});

  final Database database;

  @override
  Future<int> addVisit(model.Visit item) =>
      database.into(database.visits).insert(VisitsCompanion.insert(
            userId: item.userId,
            patientId: item.patientId,
            protocolId: item.protocolId,
            visitDate: item.visitDate,
            protocolData: item.protocolData,
          ));

  @override
  Future<void> deleteVisitWithId(int id) =>
      (database.delete(database.visits)..where((tbl) => tbl.visitId.equals(id)))
          .go();

  @override
  Future<model.Visit?> getVisitById(int id) async {
    var result = await (database.select(database.visits)
          ..where((tbl) => tbl.visitId.equals(id)))
        .get();

    return result.isEmpty ? null : VisitMapper.toModel(result.first);
  }

  @override
  Future<List<model.Visit>> getVisitsWithUserId(int id) =>
      (database.select(database.visits)..where((tbl) => tbl.userId.equals(id)))
          .get()
          .then(VisitMapper.toModelList);

  @override
  Future<void> updateVisit(model.Visit item) =>
      database.update(database.visits).replace(VisitMapper.toEntity(item));

  @override
  Stream<List<model.Visit>> watchVisits() {
    // TODO: implement watchVisits
    throw UnimplementedError();
  }

  @override
  Future<int> addMedia(model.Media item) =>
      database.into(database.media).insert(MediaCompanion.insert(
          visitId: item.visitId,
          mediaType: item.mediaType,
          imageId: item.imageId,
          thumbnailId: item.thumbnailId,
          listNumber: item.listNumber));

  @override
  Future<void> deleteMedia(int id) =>
      (database.delete(database.media)..where((tbl) => tbl.mediaId.equals(id)))
          .go();

  @override
  Future<model.Media?> getMediaById(int id) async {
    var result = await (database.select(database.media)
          ..where((tbl) => tbl.mediaId.equals(id)))
        .get();

    return result.isEmpty ? null : MediaMapper.toModel(result.first);
  }

  @override
  Future<List<model.Media>> getMediaWithVisitId(int id) =>
      (database.select(database.media)..where((tbl) => tbl.visitId.equals(id)))
          .get()
          .then(MediaMapper.toModelList);

  @override
  Future<void> updateMedia(model.Media item) =>
      database.update(database.media).replace(MediaMapper.toEntity(item));

  @override
  Future<int> addImage(model.Image item) =>
      database.into(database.images).insert(ImagesCompanion.insert(
            width: item.width,
            height: item.height,
            format: item.format,
            imageData: item.imageData,
          ));

  @override
  Future<void> deleteImageWithId(int id) =>
      (database.delete(database.images)..where((tbl) => tbl.imageId.equals(id)))
          .go();

  @override
  Future<model.Image?> getImageById(int id) async {
    var result = await (database.select(database.images)
          ..where((tbl) => tbl.imageId.equals(id)))
        .get();

    return result.isEmpty ? null : ImageMapper.toModel(result.first);
  }
  // =>
  //     (database.select(database.images)..where((t) => t.imageId.equals(id)))
  //         .getSingle()
  //         .then(ImageMapper.toModel);

  @override
  Future<void> updateImage(model.Image item) =>
      database.update(database.images).replace(ImageMapper.toEntity(item));

  @override
  Future<int> addProtocol(model.Protocol item) =>
      database.into(database.protocols).insert(ProtocolsCompanion.insert(
            userId: Value(item.userId),
            state: Value(item.state),
            scheme: item.scheme,
          ));

  @override
  Future<model.Protocol?> getProtocolById(int id) async {
    var result = await (database.select(database.protocols)
          ..where((tbl) => tbl.protocolId.equals(id)))
        .get();

    return result.isEmpty ? null : ProtocolMapper.toModel(result.first);
  }

  @override
  Future<void> updateProtocol(model.Protocol item) => database
      .update(database.protocols)
      .replace(ProtocolMapper.toEntity(item));

  @override
  Future<void> deleteProtocolWithId(int id) {
    // TODO: implement deleteProtocol
    throw UnimplementedError();
  }
}

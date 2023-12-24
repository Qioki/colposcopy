import 'package:colposcopy/data/datasources/base/visits.dart';
import 'package:colposcopy/domain/models/visit/visit.dart';
import 'package:colposcopy/domain/models/media/media.dart';
import 'package:colposcopy/domain/models/image/image.dart';
import 'package:colposcopy/domain/models/protocol/protocol.dart';
import 'package:colposcopy/domain/repositories/visits.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: VisitsRepository)
class VisitsRepositoryImpl extends VisitsRepository {
  VisitsRepositoryImpl({required this.datasource});

  VisitsDatasource datasource;

  // Visit
  @override
  Future<List<Visit>> getVisitsWithUserId(int id) =>
      datasource.getVisitsWithUserId(id);

  @override
  Stream<List<Visit>> watchVisits() => datasource.watchVisits();

  @override
  Future<int> addVisit(Visit item) => datasource.addVisit(item);

  @override
  Future<void> deleteVisitWithId(int id) => datasource.deleteVisitWithId(id);

  @override
  Future<void> updateVisit(Visit item) => datasource.updateVisit(item);

  @override
  Future<Visit> getVisitById(int id) => datasource.getVisitById(id);

  // Media
  @override
  Future<Media> getMediaById(int id) => datasource.getMediaById(id);

  @override
  Future<int> addMedia(Media item) => datasource.addMedia(item);

  @override
  Future<void> deleteMediaWithId(int id) => datasource.deleteMedia(id);

  @override
  Future<void> updateMedia(Media item) => datasource.updateMedia(item);

  // Image
  @override
  Future<Image> getImageById(int id) => datasource.getImageById(id);

  @override
  Future<int> addImage(Image item) => datasource.addImage(item);

  @override
  Future<void> deleteImageWithId(int id) => datasource.deleteImageWithId(id);

  @override
  Future<void> updateImage(Image item) => datasource.updateImage(item);

  // Protocol
  @override
  Future<Protocol> getProtocolById(int id) => datasource.getProtocolById(id);

  @override
  Future<int> addProtocol(Protocol item) => datasource.addProtocol(item);

  @override
  Future<void> deleteProtocolWithId(int id) =>
      datasource.deleteProtocolWithId(id);

  @override
  Future<void> updateProtocol(Protocol item) => datasource.updateProtocol(item);
}

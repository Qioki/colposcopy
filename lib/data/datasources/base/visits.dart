import 'package:colposcopy/domain/models/visit/visit.dart' as model;
import 'package:colposcopy/domain/models/media/media.dart' as model;
import 'package:colposcopy/domain/models/image/image.dart' as model;
import 'package:colposcopy/domain/models/protocol/protocol.dart' as model;

abstract class VisitsDatasource {
  // Visit
  Future<List<model.Visit>> getVisitsWithUserId(int id);
  Stream<List<model.Visit>> watchVisits();
  Future<int> addVisit(model.Visit item);
  Future<void> deleteVisitWithId(int id);
  Future<void> updateVisit(model.Visit item);
  Future<model.Visit> getVisitById(int id);

  // Media
  Future<model.Media> getMediaById(int id);
  Future<int> addMedia(model.Media item);
  Future<void> deleteMedia(int id);
  Future<void> updateMedia(model.Media item);
  Future<List<model.Media>> getMediaWithVisitId(int id);

  // Image
  Future<model.Image> getImageById(int id);
  Future<int> addImage(model.Image item);
  Future<void> deleteImageWithId(int id);
  Future<void> updateImage(model.Image item);

  // Protocol
  Future<model.Protocol> getProtocolById(int id);
  Future<int> addProtocol(model.Protocol item);
  Future<void> deleteProtocolWithId(int id);
  Future<void> updateProtocol(model.Protocol item);
}

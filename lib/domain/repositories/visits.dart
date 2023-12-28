import 'package:colposcopy/domain/models/visit/visit.dart';
import 'package:colposcopy/domain/models/media/media.dart';
import 'package:colposcopy/domain/models/image/image.dart';
import 'package:colposcopy/domain/models/protocol/protocol.dart';

abstract class VisitsRepository {
  // Visit
  Future<List<Visit>> getVisitsWithUserId(int id);
  Stream<List<Visit>> watchVisits();
  Future<int> addVisit(Visit item);
  Future<void> deleteVisitWithId(int id);
  Future<void> updateVisit(Visit item);
  Future<Visit?> getVisitById(int id);
  Stream<List<Visit>> get visitsWithActivePatientStream;
  void setActivePatient(int id);

  // Media
  Future<Media?> getMediaById(int id);
  Future<int> addMedia(Media item);
  Future<void> deleteMediaWithId(int id);
  Future<void> updateMedia(Media item);

  // Image
  Future<Image?> getImageById(int id);
  Future<int> addImage(Image item);
  Future<void> deleteImageWithId(int id);
  Future<void> updateImage(Image item);
}

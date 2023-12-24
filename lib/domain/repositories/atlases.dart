import 'package:colposcopy/domain/models/atlas/atlas.dart';

abstract class AtlasesRepository {
  Future<Atlas> getAtlasById(int id);
  Future<bool> addAtlas(Atlas item);
  Future<void> deleteAtlas(Atlas item);
  Future<void> updateAtlas(Atlas item);
}

import 'package:colposcopy/domain/models/atlas/atlas.dart' as model;

abstract class AtlasesDatasource {
  Future<model.Atlas> getAtlasById(int id);
  Future<bool> addAtlas(model.Atlas item);
  Future<void> deleteAtlas(model.Atlas item);
  Future<void> updateAtlas(model.Atlas item);
}

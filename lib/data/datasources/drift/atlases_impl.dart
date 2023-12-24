import 'package:colposcopy/data/datasources/base/atlases.dart';
import 'package:colposcopy/data/datasources/drift/database/database.dart';
import 'package:colposcopy/domain/models/atlas/atlas.dart' as model;
import 'package:injectable/injectable.dart';

@LazySingleton(as: AtlasesDatasource)
class AtlasesDatasourceImpl extends AtlasesDatasource {
  AtlasesDatasourceImpl({required this.database});

  final Database database;

  @override
  Future<bool> addAtlas(model.Atlas item) {
    // TODO: implement addAtlas
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAtlas(model.Atlas item) {
    // TODO: implement deleteAtlas
    throw UnimplementedError();
  }

  @override
  Future<model.Atlas> getAtlasById(int id) {
    // TODO: implement getAtlasById
    throw UnimplementedError();
  }

  @override
  Future<void> updateAtlas(model.Atlas item) {
    // TODO: implement updateAtlas
    throw UnimplementedError();
  }
}

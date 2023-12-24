import 'package:colposcopy/data/datasources/base/atlases.dart';
import 'package:colposcopy/domain/models/atlas/atlas.dart';
import 'package:colposcopy/domain/repositories/atlases.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AtlasesRepository)
class AtlasesRepositoryImpl implements AtlasesRepository {
  AtlasesRepositoryImpl({required this.datasource});

  AtlasesDatasource datasource;

  @override
  Future<Atlas> getAtlasById(int id) => datasource.getAtlasById(id);

  @override
  Future<bool> addAtlas(Atlas item) => datasource.addAtlas(item);

  @override
  Future<void> deleteAtlas(Atlas item) => datasource.deleteAtlas(item);

  @override
  Future<void> updateAtlas(Atlas item) => datasource.updateAtlas(item);
}

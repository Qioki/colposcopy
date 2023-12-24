import 'package:colposcopy/data/datasources/drift/database/connection/native.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

part 'database.g.dart';

@LazySingleton() //as: Datasource)
@DriftDatabase(include: {'sql/scheme.drift'})
class Database extends _$Database {
  Database() : super(connect());

  @override
  int get schemaVersion => 1;
}
